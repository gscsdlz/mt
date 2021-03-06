package com.mt.web;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mt.dto.NormalResponse;
import com.mt.dto.PaginationResponse;
import com.mt.entity.Item;
import com.mt.entity.MiniItem;
import com.mt.entity.Order;
import com.mt.entity.UserRemark;
import com.mt.enums.OrderStatus;
import com.mt.enums.OrderUpdateOption;
import com.mt.enums.RemarkOrder;
import com.mt.exception.CustomException;
import com.mt.service.OrderService;
import com.mt.utils.ParamUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.ParameterMetaData;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping(value = "/order_api", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json;charset=utf-8")
public class OrderApiController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private HttpServletRequest request;

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

    @RequestMapping("/add_order")
    private NormalResponse<String> addOrder(@RequestParam Map<String, Object> param) throws CustomException {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        Order o = p.parseJson("json_str", Order.class);

        int accountId = Integer.parseInt(request.getSession().getAttribute("id").toString());
        o.setAccountId(accountId);

        List<MiniItem> items = orderService.generateOrder(o);
        if (items.size() == 0) {
            response.setInfo("空订单");
        } else {
            orderService.insertOrder(o, items);
        }
        return response;
    }

    @RequestMapping("/update_status")
    private NormalResponse<String> updateStatus(@RequestParam Map<String, Object> params) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(params);
        int orderId = p.getInteger("id");
        int status = p.getInteger("status");
        Order order = new Order();
        order.setId(orderId);
        order.setOrderStatus(status);
        if (!orderService.updateOrder(order, OrderUpdateOption.UPDATE_STATUS_ONLY)) {
            response.setInfo("更新失败，请重试");
        }
        return response;
    }

    @RequestMapping("/add_remark")
    private NormalResponse<String> addRemark(@RequestParam Map<String, Object> param) {
        NormalResponse<String> response = new NormalResponse<>();
        ParamUtils p = new ParamUtils(param);
        int id = p.getInteger("id");
        int star = p.getInteger("star");
        String remark = p.getString("remark");

        Order o = new Order();
        o.setId(id);
        o.setStar(star);
        o.setRemark(remark);
        o.setOrderStatus(OrderStatus.DONE.ordinal());

        boolean ok1 = orderService.updateOrder(o, OrderUpdateOption.UPDATE_COMMIT_ONLY);
        boolean ok2 = orderService.updateOrder(o, OrderUpdateOption.UPDATE_STAR_ONLY);
        boolean ok3 = orderService.updateOrder(o, OrderUpdateOption.UPDATE_STATUS_ONLY);

        if (!ok1 || !ok2) {
            response.setInfo("评价失败，请重试");
        }
        return response;
    }
}
