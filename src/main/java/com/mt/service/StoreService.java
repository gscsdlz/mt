package com.mt.service;

import com.mt.entity.Store;

import java.util.List;

public interface StoreService {
    List<Store> getStore(int page, int size);

    Boolean modifyStore(Store store);

    Boolean addStore(Store store);

    Boolean delStore(int id);
}
