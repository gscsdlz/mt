package com.mt.middleware;

import com.mt.entity.Account;
import com.mt.enums.AccountType;
import com.mt.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class PrivilegeMiddleWare implements HandlerInterceptor {

    @Autowired
    private AccountService accountService;

    private static List<String> blackList;

    static {
        blackList = new ArrayList<>();
        blackList.add("/admin");
        blackList.add("/user");
        blackList.add("/city");
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        /*if (request.getSession().getAttribute("id") == null) {
            Account a = accountService.getAccountById(3);
            request.getSession().setAttribute("username", a.getUsername());
            request.getSession().setAttribute("id", a.getId());
            request.getSession().setAttribute("recent_city", a.getRecentCity());
            request.getSession().setAttribute("pri", a.getPri());
            request.getSession().setAttribute("accountImg", a.getAccountImg());
        }*/
        //return true;
        //
        //反向检验 属于黑名单的请求 统一需要认证

        for (String uri : blackList) {
            if (request.getServletPath().startsWith(uri)) {
                if (request.getSession().getAttribute("id") == null) {
                    response.sendRedirect("/login");
                    return false;
                } else {
                    if (uri.equals("/admin") && Integer.parseInt(request.getSession().getAttribute("pri").toString()) == AccountType.USER.ordinal()) {
                        response.sendRedirect("/login");
                        return false;
                    }
                }
            }
        }
        //不在黑名单中的请求直接通过
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
