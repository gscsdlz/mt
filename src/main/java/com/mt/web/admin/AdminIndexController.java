package com.mt.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {

    @RequestMapping("/index")
    private String index(Model model) {
        //TODO 管理后台的主页
        model.addAttribute("menu", "index");
        return "admin/index";
    }

}
