package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.entity.Account;
import com.mt.enums.AccountType;
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

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/account_api", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=UTF-8")
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
        if (a != null && a.getUsername().equals(username) && a.getPassword().equals(Encrypt.sha1Encode(password))) {
            if (a.getDisabled() == 1) {
                response.setInfo("账号已被禁用");
            } else {
                this.setSession(a);
                if (a.getPri() == AccountType.USER.ordinal()) {
                    response.setData("/");
                } else {
                    response.setData("/admin/index");
                }
            }
        } else {
            response.setInfo("用户名或者密码错误");
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
        a.setPassword(Encrypt.sha1Encode(password));
        a.setRecentCity(1);
        a.setPri(AccountType.USER.ordinal());
        accountService.addAccount(a);
        this.setSession(a);
        return response;
    }

    @RequestMapping("/logout")
    private NormalResponse<String> logout() {
        NormalResponse<String> response = new NormalResponse<>();
        clearSession();
        return response;
    }

    @RequestMapping("/set_password")
    private NormalResponse<String> setPassword(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        String old = p.getString("old_password");
        String password = p.getString("password");
        Account a = accountService.getAccountById(Integer.parseInt(request.getSession().getAttribute("id").toString()));
        if (a.getPassword().equals(Encrypt.sha1Encode(old))) {
            a.setPassword(Encrypt.sha1Encode(password));
            if (!accountService.updateAccount(a, AccountUpdateOption.UPDATE_PASSWORD)) {
                response.setInfo("密码更新失败，请重试");
            } else {
                response.setInfo("密码设置成功，请重新登录");
                clearSession();
            }
        } else {
            response.setInfo("旧密码输入错误");
        }
        return response;
    }

    @RequestMapping("/update")
    private NormalResponse<String> update(@RequestParam Map<String, Object> param) throws CustomException {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        String needUpdate = p.getString("needUpdate");
        String[] args = needUpdate.split(":");

        String[] invalidArgs = new String[]{
                "pri", "disabled", "id", "password", "createdAt", "updatedAt"
        };

        for (String check : invalidArgs) {
            if (needUpdate.contains(check)) {
                throw new CustomException("不允许修改的字段" + check);
            }
        }

        Account a = accountService.getAccountById(Integer.parseInt(request.getSession().getAttribute("id").toString()));
        Class<? extends Account> aref = a.getClass();
        Field[] fields = aref.getDeclaredFields();

        try {
            for (Field field : fields) {
                boolean flag = field.isAccessible();
                String name = field.getName();
                for (String arg : args) {
                    if (arg.equals(name)) {
                        String typeName = field.getGenericType().toString();
                        field.setAccessible(true);
                        if (typeName.equals("int")) {
                            field.setInt(a, p.getInteger(name));
                        } else {
                            field.set(a, p.getString(name));
                        }
                    }
                }
                field.setAccessible(flag);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new CustomException("参数字段有错，请检查");
        }
        if (!accountService.updateAccount(a, AccountUpdateOption.UPDATE_NORMAL_INFO)) {
            response.setInfo("更新失败");
        }

        if (needUpdate.contains("username") || needUpdate.contains("recentCity") || needUpdate.contains("accountImg")) {
            response.setInfo("更新成功，请重新登录");
            clearSession();
        }
        return response;
    }

    private void setSession(Account a) {
        request.getSession().setAttribute("username", a.getUsername());
        request.getSession().setAttribute("id", a.getId());
        request.getSession().setAttribute("recent_city", a.getRecentCity());
        request.getSession().setAttribute("pri", a.getPri());
        request.getSession().setAttribute("accountImg", a.getAccountImg());
    }

    private void clearSession() {
        request.getSession().removeAttribute("username");
        request.getSession().removeAttribute("id");
        request.getSession().removeAttribute("recent_city");
        request.getSession().removeAttribute("pri");
        request.getSession().removeAttribute("accountImg");
    }
}
