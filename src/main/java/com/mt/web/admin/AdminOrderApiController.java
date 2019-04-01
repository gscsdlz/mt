package com.mt.web.admin;

import com.mt.dto.NormalResponse;
import com.mt.entity.Order;
import com.mt.enums.OrderUpdateOption;
import com.mt.service.OrderService;
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
@RequestMapping(value = "/admin/order_api", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json;charset=utf-8")
public class AdminOrderApiController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/change_status")
    private NormalResponse<String> changeStatus(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int orderId = p.getInteger("id");
        int status = p.getInteger("status");
        Order o = new Order();
        o.setOrderStatus(status);
        o.setId(orderId);

        if (!orderService.updateOrder(o, OrderUpdateOption.UPDATE_STATUS_ONLY)) {
            response.setInfo("");
        }
        return response;
    }
}
