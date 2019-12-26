package com.mt.service.impl;

import com.mt.dao.OrderDao;
import com.mt.dao.StoreDao;
import com.mt.entity.Store;
import com.mt.enums.DBErrorType;
import com.mt.enums.StoreFetchOrder;
import com.mt.exception.CustomException;
import com.mt.exception.DBSystemError;
import com.mt.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreDao store;

    @Autowired
    private OrderDao orderDao;

    @Override
    public List<Store> getStore(int page, int size) {
        return store.getAllStore((page - 1) * size, size);
    }

    @Override
    public boolean modifyStore(Store s) throws CustomException {
        try {
            return store.updateNewStore(s.getId(), s.getStoreName(), s.getStoreImg(), s.getCityId(), s.getTypeId(), s.getShowIndex(), s.getStorePhone(), s.getAddress(), s.getWorkTime(), s.getSpecial()) > 0;
        } catch (Exception e) {
            throw new DBSystemError(DBErrorType.SYSTEM_ERROR);
        }
    }

    @Override
    public boolean addStore(Store s) {
        return store.addNewStore(s.getStoreName(), s.getStoreImg(), s.getCityId(), s.getTypeId(), s.getShowIndex(), s.getStorePhone(), s.getAddress(), s.getWorkTime(), s.getSpecial()) > 0;
    }

    @Override
    public boolean delStore(int id) {
        int effRow = store.delStoreWithId(id);
        return effRow > 0;
    }

    @Override
    public List<Store> getAllStoreName() {
        return store.getAllStoreName();
    }

    @Override
    public List<Store> searchStoreName(String storeName, int page, int size) {
        List<Store> res = store.getAllStoreByName("%" + storeName + "%", (page - 1) * size, size);
        for (Store s : res) {
            s.setStoreStar(orderDao.getStoreStar(s.getId()));
        }
        return res;
    }

    @Override
    public List<Store> fetchStore(int typeId, int cityId, String special, StoreFetchOrder orderBy, int page, int size) {
        List<Store> tmp = store.getAllStoreByCity(cityId);
        List<Store> res = new ArrayList<>();

        if (typeId == 0 && special.equals("all")) {
            res = tmp;
        } else if (typeId != 0 && special.equals("all")) {
            for (Store s : tmp) {
                if (s.getTypeId() == typeId) {
                    res.add(s);
                }
            }
        } else if (typeId == 0) {
            for (Store s : tmp) {
                if (s.getSpecial().equals(special)) {
                    res.add(s);
                }
            }
        } else {
            for (Store s : tmp) {
                if (s.getSpecial().equals(special) && s.getTypeId() == typeId) {
                    res.add(s);
                }
            }
        }
        for (Store s : res) {
            s.setStoreStar(orderDao.getStoreStar(s.getId()));
        }

        switch (orderBy) {
            case ORDER_BY_DEFAULT:
                break;
            case ORDER_BY_REMARK:
                Collections.sort(res, new Comparator<Store>() {
                    @Override
                    public int compare(Store o1, Store o2) {
                        return o1.getStoreStar().getTotalRemark() - o2.getStoreStar().getTotalRemark();
                    }
                });
                break;
            case ORDER_BY_PRICE_UP:
                Collections.sort(res, new Comparator<Store>() {
                    @Override
                    public int compare(Store o1, Store o2) {
                        return (int) (o1.getStoreStar().getAvgPrice() - o2.getStoreStar().getAvgPrice());
                    }
                });
                break;
            case ORDER_BY_PRICE_DOWN:
                Collections.sort(res, new Comparator<Store>() {
                    @Override
                    public int compare(Store o1, Store o2) {
                        return (int) (o2.getStoreStar().getAvgPrice() - o1.getStoreStar().getAvgPrice());
                    }
                });
                break;
        }
        if ((page - 1) * size >= res.size()) {
            return null;
        } else {
            if (page * size + 1 > res.size()) {
                return res.subList((page - 1) * size, res.size());
            }
            return res.subList((page - 1) * size, page * size);
        }
    }

    @Override
    public List<Store> getHotStore(int cityId, int size) {
        List<Store> res = store.getHotStore(cityId, size);
        for (Store s : res) {
            s.setStoreStar(orderDao.getStoreStar(s.getId()));
        }
        return res;
    }

    @Override
    public List<Store> getShowIndex(int cityId, int size) {
        List<Store> res = store.getShowIndex(cityId, size);
        for (Store s : res) {
            s.setStoreStar(orderDao.getStoreStar(s.getId()));
        }
        return res;
    }

    @Override
    public List<String> getAllSpecial(int cityId) {
        return store.getAllSpecial(cityId);
    }

    @Override
    public Store getStoreById(int storeId) {
        Store s = store.getStoreById(storeId);
        s.setStoreStar(orderDao.getStoreStar(s.getId()));
        return s;
    }

    @Override
    public int countStore() {
        return store.countStore();
    }
}
