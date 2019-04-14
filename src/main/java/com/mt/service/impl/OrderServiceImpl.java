package com.mt.service.impl;

import com.mt.dao.OrderDao;
import com.mt.entity.Order;
import com.mt.entity.StoreStar;
import com.mt.entity.UserRemark;
import com.mt.enums.OrderUpdateOption;
import com.mt.enums.RemarkOrder;
import com.mt.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public List<Order> getOrderByUser(int accountId, int page, int size) {
        return orderDao.getAllOrderByUser(accountId, (page - 1) *size, size);
    }

    @Override
    public List<Order> getOrderByStore(int storeId, int page, int size) {
        return orderDao.getAllOrderByStore(storeId, (page - 1) *size, size);
    }

    @Override
    public List<Order> getOrder(int page, int size) {
        return orderDao.getAllOrder((page - 1) *size, size);
    }

    @Override
    public boolean addOrder(Order o) {
        return false;
    }

    @Override
    public boolean updateOrder(Order o, OrderUpdateOption updateOption) {
        if (updateOption == OrderUpdateOption.UPDATE_COMMIT_ONLY) {
            return orderDao.updateOrderRemark(o.getId(), o.getRemark()) > 0;
        } else if (updateOption == OrderUpdateOption.UPDATE_STAR_ONLY) {
            return orderDao.updateOrderStar(o.getId(), o.getStar()) > 0;
        } else {
            return orderDao.updateOrderStatus(o.getId(), o.getOrderStatus()) > 0;
        }
    }

    @Override
    public List<Order> getHistoryOrder(int page, int size) {
        return orderDao.getHistoryOrder((page - 1) * size, size);
    }

    @Override
    public boolean delOrder(int id) {
        return orderDao.delOrder(id) > 0;
    }

    @Override
    public StoreStar getStoreStar(int storeId) {
        return orderDao.getStoreStar(storeId);
    }

    @Override
    public List<UserRemark> getRemark(int storeId, int page, int size, RemarkOrder orderBy) {
        if (orderBy == RemarkOrder.ORDER_BY_DATE) {
            return orderDao.getRemarkOrderByDate(storeId, (page-1) * size, size);
        } else {
            return orderDao.getRemarkOrderByStar(storeId, (page-1) * size, size);
        }
    }

    @Override
    public Map<String, Integer> getRemarkInfo(int storeId) {
        List<Integer> stars = orderDao.getRemarkInfo(storeId);
        Map<String, Integer> res = new HashMap<>();
        res.put("total", stars.size());
        int r1 = 0, r2 = 0, r3 = 0;
        for (Integer s : stars) {
            if (s >= 8) {
                r1++;
            } else if (s > 4) {
                r2++;
            } else {
                r3++;
            }
        }
        res.put("r1", r1);
        res.put("r2", r2);
        res.put("r3", r3);
        return res;
    }
}
