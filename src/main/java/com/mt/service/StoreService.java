package com.mt.service;

import com.mt.entity.Store;

import java.util.List;

public interface StoreService {
    List<Store> getStore(int page, int size);

    boolean modifyStore(Store store);

    boolean addStore(Store store);

    boolean delStore(int id);
}
