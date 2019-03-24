package com.mt.dao;

import com.mt.entity.Store;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreDao {
    List<Store> getAllStore();

    int delStoreWithId(@Param("id") int id);

    int addNewStore(
            @Param("store_name") String storeName,
            @Param("store_img") String storeImg,
            @Param("city_id") int cityId,
            @Param("type_id") int typeId
    );

    int updateNewStore(
            @Param("id") int id,
            @Param("store_name") String storeName,
            @Param("store_img") String storeImg,
            @Param("city_id") int cityId,
            @Param("type_id") int typeId
    );
}
