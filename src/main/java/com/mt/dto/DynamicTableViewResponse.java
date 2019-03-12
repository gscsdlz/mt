package com.mt.dto;

import com.fasterxml.jackson.databind.ObjectMapper;

public class DynamicTableViewResponse<T> {
    private boolean status;
    private String info;
    private int totalPage;
    private int pageSize;
    private int currPage;
    private T data;

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public void setData(T data) {
        this.data = data;
    }

    public boolean isStatus() {
        return status;
    }

    public String getInfo() {
        return info;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getCurrPage() {
        return currPage;
    }

    public T getData() {
        return data;
    }

    @Override
    public String toString() {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(this);
        } catch (Exception e) {
            return "";
        }
    }
}
