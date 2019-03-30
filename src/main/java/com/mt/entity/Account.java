package com.mt.entity;

import com.mt.enums.AccountType;

public class Account {
    private int id;
    private String username;
    private String password;
    private int pri;
    private int recentCity;
    private String accountImg;
    private int sex;
    private String date;
    private String bobby;
    private int constellation;
    private String more;
    private int disabled;
    private String createdAt;
    private String updatedAt;

    public int getDisabled() {
        return disabled;
    }

    public String getDisabledStr() {
        if (disabled == 0) {
            return "正常使用";
        } else {
            return "禁用";
        }
    }

    public String getPriStr() {
        return AccountType.toString(pri);
    }

    public void setDisabled(int disabled) {
        this.disabled = disabled;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPri() {
        return pri;
    }

    public void setPri(int pri) {
        this.pri = pri;
    }

    public int getRecentCity() {
        return recentCity;
    }

    public void setRecentCity(int recentCity) {
        this.recentCity = recentCity;
    }

    public String getAccountImg() {
        return accountImg;
    }

    public void setAccountImg(String accountImg) {
        this.accountImg = accountImg;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getBobby() {
        return bobby;
    }

    public void setBobby(String bobby) {
        this.bobby = bobby;
    }

    public int getConstellation() {
        return constellation;
    }

    public void setConstellation(int constellation) {
        this.constellation = constellation;
    }

    public String getMore() {
        return more;
    }

    public void setMore(String more) {
        this.more = more;
    }

    public String getCreatedAt() {
        return createdAt.substring(0, 19);
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt.substring(0, 19);
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
}
