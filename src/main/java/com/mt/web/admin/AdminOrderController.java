package com.mt.web.admin;

import com.mt.entity.Order;
import com.mt.service.OrderService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/index")
    private String index(@RequestParam Map<String, Object> param, Model model)
    {
        ParamUtils p = new ParamUtils(param);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        List<Order> data = orderService.getOrder(page, size);

        model.addAttribute("data", data);
        model.addAttribute("menu", "order");
        return "/admin/order_manage";
    }

    @RequestMapping("/history")
    private String historyOrder(Model model) {
        model.addAttribute("menu", "order");
        return "/admin/order_history";
    }
}
