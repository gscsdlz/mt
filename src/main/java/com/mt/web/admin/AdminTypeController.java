package com.mt.web.admin;

import com.mt.entity.Type;
import com.mt.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/type")
public class AdminTypeController {

    @Autowired
    private TypeService typeService;

    @RequestMapping("/index")
    private String index(@RequestParam Map<String, Object> param, Model model) {
        List<Type> typeList = typeService.getAllType();
        model.addAttribute("data", typeList);
        model.addAttribute("menu", "type");

        return "/admin/type_manage";
    }
}
