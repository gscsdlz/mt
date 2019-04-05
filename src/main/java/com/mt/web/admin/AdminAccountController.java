package com.mt.web.admin;

import com.mt.entity.Account;
import com.mt.enums.AccountType;
import com.mt.service.AccountService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/account")
public class AdminAccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/normal")
    private String normalAccount(@RequestParam Map<String, Object> param, Model model) {
        ParamUtils p = new ParamUtils(param);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        List<Account> res = accountService.getAllAccount(AccountType.USER, page, size);
        model.addAttribute("data", res);
        model.addAttribute("menu", "normal_user");
        return "/admin/normal_account_manage";
    }

    @RequestMapping("/admin")
    private String adminAccount(@RequestParam Map<String, Object> param, Model model) {
        ParamUtils p = new ParamUtils(param);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);
        List<Account> res = accountService.getAllAccount(AccountType.ADMIN, page, size);
        model.addAttribute("data", res);
        model.addAttribute("menu", "admin_user");
        return "/admin/admin_account_manage";
    }

    @RequestMapping("/center")
    private String accountCenter(@RequestParam Map<String, Object> param, Model model) {
        Account a = accountService.getAccountById(3);
        model.addAttribute("account", a);
        return "/admin/account_center";
    }
}
