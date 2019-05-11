package com.mt.dao;

import com.mt.entity.Store;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StoreDao {
    List<Store> getAllStore(@Param("offset") int offset, @Param("limit") int limit);

    List<Store> getAllStoreName();

    List<Store> getAllStoreByName(@Param("store_name") String storeName, @Param("offset") int offset, @Param("limit") int limit);

    int delStoreWithId(@Param("id") int id);

    int addNewStore(
            @Param("store_name") String storeName,
            @Param("store_img") String storeImg,
            @Param("city_id") int cityId,
            @Param("type_id") int typeId,
            @Param("show_index") int showIndex,
            @Param("store_phone") String storePhone,
            @Param("address") String address,
            @Param("work_time") String workTime,
            @Param("special") String special
    );

    int updateNewStore(
            @Param("id") int id,
            @Param("store_name") String storeName,
            @Param("store_img") String storeImg,
            @Param("city_id") int cityId,
            @Param("type_id") int typeId,
            @Param("show_index") int showIndex,
            @Param("store_phone") String storePhone,
            @Param("address") String address,
            @Param("work_time") String workTime,
            @Param("special") String special
    );

    List<Store> getHotStore(@Param("city_id") int cityId, @Param("limit") int limit);

    List<Store> getShowIndex(@Param("city_id") int cityId, @Param("limit") int limit);

    List<Store> getAllStoreByCity(@Param("city_id") int cityId);

    List<String> getAllSpecial(@Param("city_id") int cityId);

    Store getStoreById(@Param("id") int id);

    int countStore();
}
