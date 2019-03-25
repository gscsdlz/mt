package com.mt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
@RequestMapping(value = "/admin/type_api", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
public class AdminTypeApiController {
}
