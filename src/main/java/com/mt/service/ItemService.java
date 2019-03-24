package com.mt.service;

import com.mt.entity.Item;

import java.util.List;

public interface ItemService {
    List<Item> getItem(int page, int size, int storeId);

    boolean delItem(int itemId);

    int addItem(Item item);

    int modifyItem(Item item);

}
