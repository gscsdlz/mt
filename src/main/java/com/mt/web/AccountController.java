package com.mt.web;

import com.mt.dto.NormalResponse;
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
    private HttpServletRequest request;

    @RequestMapping("/me")
    private String center() {
        return "me";
    }
}
