package com.mt.dao;

import com.mt.entity.Item;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemDao {
    List<Item> getAllItemByStore(@Param("store_id") int storeId, @Param("offset") int offset, @Param("limit") int limit);

    List<Item> getAllItem(@Param("offset") int offset, @Param("limit") int limit);

    int updateItem(
            @Param("id") int id,
            @Param("item_name") String itemName,
            @Param("price") double price,
            @Param("item_img") String itemImg,
            @Param("inventory") int inventory,
            @Param("store_id") int storeId
    );

    int addItem(
            @Param("item_name") String itemName,
            @Param("store_id") int StoreId,
            @Param("price") double price,
            @Param("item_img") String itemImg,
            @Param("inventory") int inventory
    );

    int delItem(@Param("id") int id);

    List<Item> getHotItem(@Param("store_id") int storeId);

    List<Item> getAllItemByStoreWithoutPage(@Param("store_id") int storeId);

    Item getItemById(@Param("id") int id);

    int decreaseInventory(@Param("id") int id, @Param("gap") int gap);

    int increaseTotalSale(@Param("id") int id, @Param("gap") int gap);

    int countItem();
}
