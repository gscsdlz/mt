package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.Store;
import com.mt.service.StoreService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/store_api", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
public class StoreApiController {

    @Autowired
    private StoreService storeService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/get_hot")
    private NormalResponse<List<Store>> getHotStore(@RequestParam Map<String, Object> param) {
        ParamUtils p = new ParamUtils(param);
        NormalResponse<List<Store>> response = new NormalResponse<>();
        int limit = p.getInteger("limit", 100);

        int cityId = 1;
        if (request.getSession().getAttribute("recent_city") != null) {
            cityId = Integer.parseInt(request.getSession().getAttribute("recent_city").toString());
        }
        response.setData(storeService.getHotStore(cityId, limit));
        return response;
    }
}
