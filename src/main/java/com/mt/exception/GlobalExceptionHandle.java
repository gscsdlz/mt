package com.mt.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GlobalExceptionHandle implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

        e.printStackTrace();
        String message = "Uncaught Exception " + e.getMessage();
        if (e instanceof CustomException) {
            message = e.getMessage();
        }
        if (httpServletRequest.getHeader("x-requested-with") != null && httpServletRequest.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
            //Ajax
            ModelAndView mv = new ModelAndView(new MappingJackson2JsonView());
            mv.addObject("status", false)
                    .addObject("info", message)
                    .addObject("data", "");

            return mv;
        } else {
           // httpServletRequest.getContextPath().contains()
            ModelAndView mv = new ModelAndView("/admin/common/error");
            mv.addObject("error", message);
            return mv;
        }
    }
}
