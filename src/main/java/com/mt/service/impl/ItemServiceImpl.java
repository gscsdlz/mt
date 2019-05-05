package com.mt.service.impl;

import com.mt.dao.ItemDao;
import com.mt.entity.Item;
import com.mt.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemDao itemDao;

    @Override
    public List<Item> getItem(int page, int size, int storeId) {
        if (storeId == 0) {
            return itemDao.getAllItem((page - 1) * size, size);
        } else {
            return itemDao.getAllItemByStore(storeId, (page - 1) * size, size);
        }
    }

    @Override
    public boolean delItem(int itemId) {
        return itemDao.delItem(itemId) > 0;
    }

    @Override
    public boolean addItem(Item item) {
        return itemDao.addItem(item.getItemName(), item.getStoreId(), item.getPrice(), item.getItemImg(), item.getInventory()) > 0;
    }

    @Override
    public boolean modifyItem(Item item) {
        return itemDao.updateItem(item.getId(), item.getItemName(), item.getPrice(), item.getItemImg(), item.getInventory(), item.getStoreId()) > 0;
    }

    @Override
    public List<Item> getHotItem(int storeId) {
        return itemDao.getHotItem(storeId);
    }

    @Override
    public List<Item> getAllItem(int storeId) {
        return itemDao.getAllItemByStoreWithoutPage(storeId);
    }
}
