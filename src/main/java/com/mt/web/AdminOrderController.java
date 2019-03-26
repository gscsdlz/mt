package com.mt.web;

import com.mt.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/index")
    private String index() {
        return "/admin/order_manage";
    }

    @RequestMapping("/history")
    private String historyOrder() {
        return "/admin/order_history";
    }
}
