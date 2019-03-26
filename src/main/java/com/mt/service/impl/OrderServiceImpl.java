package com.mt.service.impl;

import com.mt.dao.OrderDao;
import com.mt.entity.Order;
import com.mt.enums.OrderUpdateOption;
import com.mt.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
            return orderDao.updateOrderCommit(o.getId(), o.getRemark()) > 0;
        } else if (updateOption == OrderUpdateOption.UPDATE_STAR_ONLY) {
            return orderDao.updateOrderStar(o.getId(), o.getStar()) > 0;
        } else {
            return orderDao.updateOrderStar(o.getId(), o.getOrderStatus()) > 0;
        }
    }

    @Override
    public List<Order> getHistoryOrder(int page, int size) {
        return orderDao.getHistoryOrder((page - 1) * size, size);
    }
}
