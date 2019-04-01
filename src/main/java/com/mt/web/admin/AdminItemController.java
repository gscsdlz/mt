package com.mt.web.admin;

import com.mt.entity.Item;
import com.mt.service.ItemService;
import com.mt.service.StoreService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/item")
public class AdminItemController {

    @Autowired
    private ItemService itemService;

    @Autowired
    private StoreService storeService;

    @RequestMapping("/index")
    private String getAll(@RequestParam Map<String, Object> param, Model model) {
        ParamUtils p = new ParamUtils(param);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        int storeId = p.getInteger("store", 0);
        List<Item> res = itemService.getItem(page, size, storeId);
        model.addAttribute("menu", "store");
        model.addAttribute("data", res);
        model.addAttribute("stores", storeService.getAllStoreName());
        return "admin/item_manage";
    }
}
