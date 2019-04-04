package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.Account;
import com.mt.exception.CustomException;
import com.mt.service.AccountService;
import com.mt.utils.Encrypt;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "account_api", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=UTF-8")
public class AccountApiController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/login")
    private NormalResponse<String> login(@RequestParam Map<String, Object> param) {
        ParamUtils p = new ParamUtils(param);
        NormalResponse<String> response = new NormalResponse<>();
        String username = p.getString("username");
        String password = p.getString("password");
        Account a = accountService.getAccountByUserName(username);
        if (a.getUsername().equals(username) && a.getPassword().equals(Encrypt.sha1Encode(password))) {
            if (a.getDisabled() == 1) {
                response.setInfo("");
            } else {
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("id", a.getId());
                request.getSession().setAttribute("recent_city", a.getRecentCity());
                request.getSession().setAttribute("pri", a.getPri());
            }
        } else {
            response.setInfo("");
        }
        return response;
    }

    @RequestMapping("/register")
    private NormalResponse<String> register(@RequestParam Map<String, Object> param) throws CustomException {
        ParamUtils p = new ParamUtils(param);
        NormalResponse<String> response = new NormalResponse<>();
        String username = p.getString("username");
        String password = p.getString("password");

        Account a = new Account();
        a.setUsername(username);
        a.setPassword(password);
        accountService.addAccount(a);
        return response;
    }


}
