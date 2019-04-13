package com.mt.dao;

import com.mt.entity.Order;
import com.mt.entity.StoreStar;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    List<Order> getAllOrderByUser(@Param("account_id") int accountId, @Param("offset") int offset, @Param("limit") int limit);

    List<Order> getAllOrderByStore(@Param("store_id") int storeId, @Param("offset") int offset, @Param("limit") int limit);

    List<Order> getAllOrder(@Param("offset") int offset, @Param("limit") int limit);

    int addOrder(
            @Param("item_id") int itemId,
            @Param("account_id") int accountId,
            @Param("item_number") int itemNumber,
            @Param("item_price") double itemPrice,
            @Param("total_price") double totalPrice
    );

    int updateOrderStar(@Param("id") int id, @Param("star") int star);

    int updateOrderRemark(@Param("id") int id, @Param("remark") String remark);

    int updateOrderStatus(@Param("id") int id, @Param("order_status") int orderStatus);

    List<Order> getHistoryOrder(@Param("offset") int offset, @Param("limit") int limit);

    int delOrder(@Param("id") int id);

    StoreStar getStoreStar(@Param("store_id") int storeId);
}
