package com.mt.service;

import com.mt.entity.*;
import com.mt.enums.OrderUpdateOption;
import com.mt.enums.RemarkOrder;
import com.mt.exception.CustomException;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface OrderService {

    List<Order> getOrderByUser(int accountId, int page, int size);

    List<Order> getOrderByStore(int storeId, int page, int size);

    List<Order> getOrder(int page, int size);

    List<MiniItem> generateOrder(Order o);

    boolean insertOrder(Order o, List<MiniItem> newItems);

    boolean updateOrder(Order o, OrderUpdateOption updateOption);

    List<Order> getHistoryOrder(int page, int size);

    boolean delOrder(int id);

    StoreStar getStoreStar(int storeId);

    List<UserRemark> getRemark(int storeId, int page, int size, RemarkOrder orderBy);

    Map<String, Integer> getRemarkInfo(int storeId);

    int countOrder();

    int countUnOrder();

    List<String> groupByMonth(String lastTime);
}
