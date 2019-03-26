package com.mt.service;

import com.mt.entity.Store;
import com.mt.exception.CustomException;
import com.mt.exception.DBSystemError;

import java.util.List;

public interface StoreService {
    List<Store> getStore(int page, int size);

    boolean modifyStore(Store store) throws CustomException;

    boolean addStore(Store store);

    boolean delStore(int id);
}
