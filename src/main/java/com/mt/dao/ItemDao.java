package com.mt.dao;

import com.mt.entity.Item;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemDao {
    List<Item> getAllItem(@Param("store_id") int storeId, @Param("offset") int offset, @Param("limit") int limit);

    int updateItem(
            @Param("id") int id,
            @Param("item_name") String itemName,
            @Param("old_price") double oldPrice,
            @Param("price") double price,
            @Param("item_img") String itemImg
    );

    int addItem(
            @Param("item_name") String itemName,
            @Param("store_id") int StoreId,
            @Param("old_price") double oldPrice,
            @Param("price") double price,
            @Param("item_img") String itemImg
    );

    int delItem(@Param("id") int id);
}
