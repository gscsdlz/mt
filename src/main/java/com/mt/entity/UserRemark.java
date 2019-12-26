package com.mt.entity;

import com.mt.utils.DateTime;

import java.util.Date;

public class UserRemark {
    private String accountImg;
    private String username;
    private int star;
    private String remark;
    private String createdAt;

    public String getAccountImg() {
        return accountImg;
    }

    public void setAccountImg(String accountImg) {
        this.accountImg = accountImg;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCreatedAt() {
        String date = createdAt.substring(0, 10);
        String[] dates = date.split("-");
        return dates[0] + "年" + dates[1] + "月" + dates[2] + "日";
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
