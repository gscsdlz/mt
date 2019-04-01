package com.mt.web.admin;

import com.mt.entity.Store;
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
@RequestMapping("/admin/store")
public class AdminStoreController {

    @Autowired
    private StoreService storeService;

    @RequestMapping("/index")
    private String index(@RequestParam Map<String, Object> param, Model model) {
        ParamUtils p = new ParamUtils(param);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        List<Store> res = storeService.getStore(page, size);
        model.addAttribute("data", res);
        return "admin/store_manage";
    }

}
