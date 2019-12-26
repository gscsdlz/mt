package com.mt.web;

import com.mt.entity.City;
import com.mt.service.AccountService;
import com.mt.service.CityService;
import com.mt.service.StoreService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private AccountService accountService;

    @Autowired
    private StoreService storeService;

    @Autowired
    private CityService cityService;

    @RequestMapping("/")
    private String index() {
        return "index";
    }

    @RequestMapping("/city")
    private String city(Model model) {
        List<City> city = cityService.getAll();
        List<City> province = cityService.getProvince();

        model.addAttribute("province", province);
        model.addAttribute("city", city);
        return "city";
    }

    @RequestMapping("/login")
    private String login(@RequestParam Map<String, Object> param) {
        if (isLogin()) {
            return "redirect:/";
        }
        return "admin/login";
    }

    @RequestMapping("/register")
    private String register(@RequestParam Map<String, Object> param) {
        if (isLogin()) {
            return "redirect:/";
        }
        return "admin/register";
    }

    protected boolean isLogin() {
        return request.getSession().getAttribute("id") != null;
    }

    @RequestMapping("/logout")
    private String logout() {
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("id");
        request.getSession().removeAttribute("recent_city");
        request.getSession().removeAttribute("pri");
        request.getSession().removeAttribute("accountImg");
        return "index";
    }
}
