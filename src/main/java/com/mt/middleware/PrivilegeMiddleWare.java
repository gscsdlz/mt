package com.mt.middleware;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class PrivilegeMiddleWare implements HandlerInterceptor {

    private static List<String> whiteList;

    static {
        whiteList = new ArrayList<>();
        whiteList.add("/login");
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      /*  request.getSession().setAttribute("account_id", 7);
        request.getSession().setAttribute("username", "familyUser");
        request.getSession().setAttribute("act", 3);
        return true;
*/
        //登录注册相关接口和默认页面 直接放行
       /*for (String uri : whiteList) {
            if (request.getServletPath().startsWith(uri)) {
                return true;
            }
        }
        if (request.getServletPath().equals("/")) {
            return true;
        }
        if (request.getSession().getAttribute("act") == null) {
            response.sendRedirect("/login");
            return false;
        }*/
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
