package com.mt.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
@RequestMapping(value = "/admin/order_api", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
public class AdminOrderApiController {
}
