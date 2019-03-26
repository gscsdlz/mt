package com.mt.service.impl;

import com.mt.dao.StoreDao;
import com.mt.entity.Store;
import com.mt.enums.DBErrorType;
import com.mt.exception.CustomException;
import com.mt.exception.DBSystemError;
import com.mt.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreDao store;

    @Override
    public List<Store> getStore(int page, int size) {
        List<Store> res = store.getAllStore();
        int l = (page - 1) * size;
        int r = page * size;
        //get [L, r)
        if (res.size() < l) {
            res.clear();
        } else if (res.size() < r) {
            r = res.size();
        }
        return res.subList(l, r);
    }

    @Override
    public boolean modifyStore(Store s) throws CustomException {
        try {
            return store.updateNewStore(s.getId(), s.getStoreName(), s.getStoreImg(), s.getCityId(), s.getTypeId()) > 0;
        } catch (Exception e) {
            throw new DBSystemError(DBErrorType.SYSTEM_ERROR);
        }
    }

    @Override
    public boolean addStore(Store s) {
        return store.addNewStore(s.getStoreName(), s.getStoreImg(), s.getCityId(), s.getTypeId()) > 0;
    }

    @Override
    public boolean delStore(int id) {
        int effRow = store.delStoreWithId(id);
        return effRow > 0;
    }
}
