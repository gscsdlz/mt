package com.mt.web;

import com.mt.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private HttpServletRequest request;

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    private String login(@RequestParam Map<String, Object> param) {
        return "";
    }

}
