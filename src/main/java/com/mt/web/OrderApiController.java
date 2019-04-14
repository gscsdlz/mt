package com.mt.web;

import com.mt.dto.NormalResponse;
import com.mt.dto.PaginationResponse;
import com.mt.entity.UserRemark;
import com.mt.enums.OrderStatus;
import com.mt.enums.RemarkOrder;
import com.mt.service.OrderService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/order_api", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
public class OrderApiController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/get_remark")
    private PaginationResponse<List<UserRemark>> getRemark(@RequestParam Map<String, Object> param) {
        PaginationResponse<List<UserRemark>> response = new PaginationResponse<>();
        ParamUtils p = new ParamUtils(param);
        int storeId = p.getInteger("store_id");
        int orderBy = p.getInteger("order_by", 0);
        int page = p.getInteger("page", 1);
        int size = p.getInteger("size", 15);

        response.setData(orderService.getRemark(storeId, page, size, RemarkOrder.values()[orderBy]));
        Map<String, Integer> info = orderService.getRemarkInfo(storeId);
        response.setCurrPage(page);
        response.setPageSize(size);
        response.setTotalPage((info.get("total") - 1) / size + 1);
        return response;
    }

    @RequestMapping("/get_remark_info")
    private NormalResponse<Map<String, Integer>> getRemarkInfo(@RequestParam Map<String, Object> param) {
        NormalResponse<Map<String, Integer>> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int storeId = p.getInteger("store_id");
        response.setData(orderService.getRemarkInfo(storeId));
        return response;
    }
}
