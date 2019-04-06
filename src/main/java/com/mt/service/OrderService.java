package com.mt.service;

import com.mt.entity.Order;
import com.mt.enums.OrderUpdateOption;

import java.util.List;

public interface OrderService {

    List<Order> getOrderByUser(int accountId, int page, int size);

    List<Order> getOrderByStore(int storeId, int page, int size);

    List<Order> getOrder(int page, int size);

    boolean addOrder(Order o);

    boolean updateOrder(Order o, OrderUpdateOption updateOption);

    List<Order> getHistoryOrder(int page, int size);

    boolean delOrder(int id);
}
