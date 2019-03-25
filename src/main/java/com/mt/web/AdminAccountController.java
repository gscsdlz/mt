package com.mt.web;

import com.mt.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/admin/account")
public class AdminAccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/normal")
    private String normalAccount(@RequestParam Map<String, Object> param) {
        return "/admin/normal_account_manage";
    }

    @RequestMapping("/admin")
    private String adminAccount(@RequestParam Map<String, Object> param) {
        return "/admin/admin_account_manage";
    }

    @RequestMapping("/center")
    private String accountCenter(@RequestParam Map<String, Object> param) {
        return "/admin/account_center";
    }
}
