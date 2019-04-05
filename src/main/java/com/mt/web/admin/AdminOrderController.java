package com.mt.web.admin;

import com.mt.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/index")
    private String index(Model model)
    {
        model.addAttribute("menu", "order");
        return "/admin/order_manage";
    }

    @RequestMapping("/history")
    private String historyOrder(Model model) {
        model.addAttribute("menu", "order");
        return "/admin/order_history";
    }
}
