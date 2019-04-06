package com.mt.entity;

import com.mt.enums.AccountType;
import com.mt.enums.Constellation;
import com.mt.enums.Sex;

public class Account {
    private int id;
    private String username;
    private String password;
    private int pri;
    private int recentCity;
    private String city;
    private String accountImg;
    private int sex;
    private String birth;
    private String hobby;
    private int constellation;
    private int disabled;
    private String createdAt;
    private String updatedAt;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

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

    public String getSexStr() {
        return Sex.toString(sex);
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getConstellationStr() {
        return Constellation.toString(constellation);
    }

    public int getConstellation() {
        return constellation;
    }

    public void setConstellation(int constellation) {
        this.constellation = constellation;
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
