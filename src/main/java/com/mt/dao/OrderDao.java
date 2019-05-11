package com.mt.dao;

import com.mt.entity.Order;
import com.mt.entity.StoreStar;
import com.mt.entity.UserRemark;
import com.mt.utils.ParamUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderDao {
    List<Order> getAllOrderByUser(@Param("account_id") int accountId, @Param("offset") int offset, @Param("limit") int limit);

    List<Order> getAllOrderByStore(@Param("store_id") int storeId, @Param("offset") int offset, @Param("limit") int limit);

    List<Order> getAllOrder(@Param("offset") int offset, @Param("limit") int limit);

    int addOrder(
            @Param("items") String itemId,
            @Param("account_id") int accountId,
            @Param("store_id") int storeId,
            @Param("total_price") double totalPrice
    );

    int updateOrderStar(@Param("id") int id, @Param("star") int star);

    int updateOrderRemark(@Param("id") int id, @Param("remark") String remark);

    int updateOrderStatus(@Param("id") int id, @Param("order_status") int orderStatus);

    List<Order> getHistoryOrder(@Param("offset") int offset, @Param("limit") int limit);

    int delOrder(@Param("id") int id);

    StoreStar getStoreStar(@Param("store_id") int storeId);

    List<UserRemark> getRemarkOrderByDate(@Param("store_id") int storeId, @Param("offset") int offset, @Param("limit") int limit);

    List<UserRemark> getRemarkOrderByStar(@Param("store_id") int storeId, @Param("offset") int offset, @Param("limit") int limit);

    List<Integer> getRemarkInfo(@Param("store_id") int storeId);

    int countOrder();

    int countUnOrder();

    List<String> getOrderCreatedAt(@Param("date") String date);
}
