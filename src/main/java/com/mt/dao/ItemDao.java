package com.mt.dao;

import com.mt.entity.Item;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemDao {
    List<Item> getAllItem(@Param("store_id") int storeId);
}
