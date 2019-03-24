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
        return null;
    }

    @Override
    public boolean delItem(int itemId) {
        return false;
    }

    @Override
    public int addItem(Item item) {
        return 0;
    }

    @Override
    public int modifyItem(Item item) {
        return 0;
    }
}
