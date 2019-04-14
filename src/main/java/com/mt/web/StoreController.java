package com.mt.web;

import com.mt.entity.Item;
import com.mt.entity.Store;
import com.mt.entity.Type;
import com.mt.enums.StoreFetchOrder;
import com.mt.service.ItemService;
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
    private ItemService itemService;

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

    @RequestMapping("/detail")
    private String detail(@RequestParam Map<String, Object> param, Model model) {
        ParamUtils p = new ParamUtils(param);
        int storeId = p.getInteger("store_id");
        Store s = storeService.getStoreById(storeId);
        List<Item> hotItem = itemService.getHotItem(storeId);

        model.addAttribute("hotItem", hotItem);
        model.addAttribute("store", s);
        return "store_detail";
    }

    @RequestMapping("/search")
    private String search(@RequestParam Map<String, Object> param, Model model) {
        ParamUtils p = new ParamUtils(param);
        String key = p.getString("key");
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 50);

        List<Store> stores = storeService.searchStoreName(key, page, size);

        model.addAttribute("search_key", key);
        model.addAttribute("data", stores);
        model.addAttribute("curr_page", page);
        model.addAttribute("total_page", 1);
        model.addAttribute("page_size", size);
        return "store_search";
    }
}