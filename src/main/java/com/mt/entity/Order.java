package com.mt.entity;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mt.enums.OrderStatus;

import java.util.List;

public class Order {
    private int id;
    private String items;
    private int accountId;
    private String username;
    private int storeId;
    private String storeName;
    private int orderStatus;
    private double totalPrice;
    private int star;
    private String remark;
    private String updatedAt;

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    private String createdAt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getStatus() {
        return OrderStatus.values()[this.orderStatus].toString();
    }

    public List<Item> getItemList() {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.readValue(items, new TypeReference<List<Item>>() {});
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getItemDetails() {
        List<Item> list = this.getItemList();
        StringBuilder res = new StringBuilder();
        for (Item item : list) {
            res.append(item.getItemName()).append(" ").append(item.getTotal()).append("份，共￥").append(item.getPrice() * item.getTotal()).append("\n");
        }
        return res.toString();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }
}
