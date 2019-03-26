package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.Account;
import com.mt.exception.CustomException;
import com.mt.service.AccountService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/admin/account_api", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
public class AdminAccountApiController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/modify")
    private NormalResponse<String> update(@RequestParam Map<String, Object> param) throws CustomException {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        Account a = p.parseJson("json_str", Account.class);
        if (!accountService.updateAccount(a)) {
            response.setInfo("");
        }
        return response;
    }
}
