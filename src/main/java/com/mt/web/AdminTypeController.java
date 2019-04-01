package com.mt.web;

import com.mt.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/admin/type")
public class AdminTypeController {

    @RequestMapping("/index")
    private String index(@RequestParam Map<String, Object> param, Model model) {
        return "/admin/type_manage";
    }
}
