package com.mt.dto;

public class PaginationResponse<T> extends NormalResponse<T> {
    private int totalPage;
    private int currPage;
    private int pageSize;

    public PaginationResponse() {
        super();
        totalPage = 1;
        currPage = 1;
        pageSize = 15;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrPage() {
        return currPage;
    }

    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
