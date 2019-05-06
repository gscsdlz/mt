package com.mt.web;

import com.mt.entity.Account;
import com.mt.entity.Order;
import com.mt.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")

public class AccountController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private AccountService accountService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("/me")
    private String center(Model model) {
        int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());
        Account a = accountService.getAccountById(accountId);

        model.addAttribute("account", a);
        return "me";
    }

    @RequestMapping("/order")
    private String order(Model model) {
        int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());
        int page = 1;
        int size = 15;
        List<Order> orders = orderService.getOrderByUser(accountId, page, size);

        model.addAttribute("data", orders);
        return "me_order";
    }

    @RequestMapping("/info")
    private String info(Model model) {

        int uid = Integer.parseInt(request.getSession().getAttribute("id").toString());
        Account a = accountService.getAccountById(uid);

        model.addAttribute("account", a);
        return "me_info";
    }

    @RequestMapping("/sec")
    private String sec(Model model) {

        int uid = Integer.parseInt(request.getSession().getAttribute("id").toString());
        Account a = accountService.getAccountById(uid);

        model.addAttribute("account", a);
        return "me_sec";
    }
}
