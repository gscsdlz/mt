package com.mt.service;

import com.mt.entity.Item;

import java.util.List;

public interface ItemService {
    List<Item> getItem(int page, int size, int storeId);

    boolean delItem(int itemId);

    boolean addItem(Item item);

    boolean modifyItem(Item item);

    List<Item> getHotItem(int storeId);
}
