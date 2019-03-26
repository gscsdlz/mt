package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.Store;
import com.mt.exception.DBSystemError;
import com.mt.service.StoreService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/admin/store_api/", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
public class AdminStoreApiController {

    @Autowired
    private StoreService storeService;

    @RequestMapping("/get")
    private NormalResponse<List<Store>> getList(@RequestParam Map<String, Object> param) {
        ParamUtils p = new ParamUtils(param);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        NormalResponse<List<Store>> response = new NormalResponse<>();
        List<Store> res = storeService.getStore(page, size);
        response.setData(res);
        return response;
    }

    @RequestMapping("/modify")
    private NormalResponse<String> modify(@RequestParam Map<String, Object> param) throws DBSystemError {
        ParamUtils p = new ParamUtils(param);
        NormalResponse<String> response = new NormalResponse<>();
        Store s = p.parseJson("json_str", Store.class);
        storeService.modifyStore(s);
        return response;
    }

    @RequestMapping("/add")
    private NormalResponse<String> add(@RequestParam Map<String, Object> param) {
        ParamUtils p = new ParamUtils(param);
        NormalResponse<String> response = new NormalResponse<>();
        try {
            Store s = p.parseJson("json_str", Store.class);
            storeService.addStore(s);
        } catch (Exception e) {
            e.printStackTrace();
            response.setInfo(e.getMessage());
        }
        return response;
    }

    @RequestMapping("/del")
    private NormalResponse<String> del(@RequestParam Map<String, Object> param) {
        ParamUtils p = new ParamUtils(param);
        NormalResponse<String> response = new NormalResponse<>();

        int storeId = p.getInteger("id");
        if (!storeService.delStore(storeId)) {
            response.setInfo("删除失败，请重试");
        }
        return response;
    }
}
