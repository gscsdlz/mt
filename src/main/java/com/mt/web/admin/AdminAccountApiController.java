package com.mt.web.admin;

import com.mt.dto.NormalResponse;
import com.mt.entity.Account;
import com.mt.enums.AccountUpdateOption;
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


import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/admin/account_api", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
public class AdminAccountApiController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/reset_password")
    private NormalResponse<String> resetPassword(@RequestParam Map<String, Object> param) throws CustomException {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int id = p.getInteger("id");
        Account a = new Account();
        a.setPassword(Encrypt.sha1Encode("123456"));
        a.setId(id);
        if (!accountService.updateAccount(a, AccountUpdateOption.UPDATE_PASSWORD)) {
            response.setInfo("更新失败");
        }
        return response;
    }

    @RequestMapping("/set_adminInfo")
    private NormalResponse<String> setAdminInfo(@RequestParam Map<String, Object> param) throws CustomException {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int id = p.getInteger("id");
        int pri = p.getInteger("pri");
        int disabled = p.getInteger("disable");
        String username = p.getString("username");

        Account a = new Account();
        a.setId(id);
        a.setUsername(username);
        a.setPri(pri);
        a.setDisabled(disabled);

        if (!accountService.updateAccount(a, AccountUpdateOption.UPDATE_ADMIN_INFO)) {
            response.setInfo("更新失败");
        }
        return response;
    }

    @RequestMapping("/add")
    private NormalResponse<String> add(@RequestParam Map<String, Object> param) throws CustomException {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        Account a = new Account();
        a.setUsername(p.getString("username"));
        a.setPri(p.getInteger("pri"));
        a.setDisabled(p.getInteger("disable"));
        a.setPassword(Encrypt.sha1Encode("123456"));
        if (!accountService.addAccount(a)) {
            response.setInfo("添加失败");
        }
        return response;
    }

    @RequestMapping("/del")
    private NormalResponse<String> del(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int id = p.getInteger("id");
        if (!accountService.delAccount(id)) {
            response.setInfo("删除失败");
        }
        return response;
    }

    @RequestMapping("/lock")
    private NormalResponse<String> lockUser(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int id = p.getInteger("id");
        int disabled = p.getInteger("disabled");
        Account a = new Account();
        a.setId(id);
        a.setDisabled(disabled);
        if (!accountService.updateAccount(a, AccountUpdateOption.UPDATE_DISABLED)) {
            response.setInfo("更新失败，请重试");
        }
        return response;
    }
}
