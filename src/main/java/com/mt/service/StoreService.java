package com.mt.service;

import com.mt.entity.Store;
import com.mt.enums.StoreFetchOrder;
import com.mt.exception.CustomException;

import java.util.List;

public interface StoreService {
    List<Store> getStore(int page, int size);

    boolean modifyStore(Store store) throws CustomException;

    boolean addStore(Store store);

    boolean delStore(int id);

    List<Store> getAllStoreName();

    List<Store> searchStoreName(String storeName);

    List<Store> fetchStore(int typeId, int cityId, String special, StoreFetchOrder orderBy, int page, int size);

    List<Store> getHotStore(int cityId, int size);

    List<String> getAllSpecial(int cityId);
}
