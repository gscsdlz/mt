package com.mt.web;

import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private HttpServletRequest request;

    @RequestMapping("/")
    private String index() {
        return "index";
    }

    @RequestMapping("/city")
    private String city() {
        return "city";
    }

    @RequestMapping("/change_city")
    private String cityChange(@RequestParam Map<String, Object> param) {
        ParamUtils p = new ParamUtils(param);
        int cityId = p.getInteger("id");
        request.getSession().setAttribute("recent_city", cityId);
        return "";
    }
}
