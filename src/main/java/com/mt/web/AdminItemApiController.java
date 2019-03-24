package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.Item;
import com.mt.service.ItemService;
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
@RequestMapping(value = "/admin/item_api", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
public class AdminItemApiController {
    @Autowired
    private ItemService itemService;

    @RequestMapping("/get")
    private NormalResponse<List<Item>> getList(@RequestParam Map<String, Object> param) {
        NormalResponse<List<Item>> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        int storeId = p.getInteger("storeId", 0);
        response.setData(itemService.getItem(page, size, storeId));
        return response;
    }
}
