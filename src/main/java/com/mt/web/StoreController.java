package com.mt.web;

import com.mt.entity.Store;
import com.mt.entity.Type;
import com.mt.enums.StoreFetchOrder;
import com.mt.service.StoreService;
import com.mt.service.TypeService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/store")
public class StoreController {

    @Autowired
    private StoreService storeService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/list")
    private String list(@RequestParam Map<String, Object> param, Model model) {
        ParamUtils p = new ParamUtils(param);
        int typeId = p.getInteger("type_id");
        String display = p.getString("display", "all");
        String special = p.getString("special", "all");
        int order = p.getInteger("order_by", 0);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        int cityId = 1;
        if (request.getSession().getAttribute("recent_city") != null ) {
            cityId = Integer.parseInt(request.getSession().getAttribute("recent_city").toString());
        }

        List<Type> types = typeService.getTypeRefId(typeId);
        List<String> specials = storeService.getAllSpecial(cityId);

        model.addAttribute("curr_type", typeId);
        if (display.equals("all")) {
            typeId = 0;
        }
        List<Store> storeList = storeService.fetchStore(typeId, cityId, special, StoreFetchOrder.values()[order], page, size);


        model.addAttribute("curr_special", special);
        model.addAttribute("curr_order", order);
        model.addAttribute("curr_display", display);
        model.addAttribute("data", storeList);
        model.addAttribute("types", types);
        model.addAttribute("special", specials);
        return "store_list";
    }
}