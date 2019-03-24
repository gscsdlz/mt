package com.mt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminIndexController {

    @RequestMapping("/index")
    private String index() {
        return "admin/index";
    }

}
