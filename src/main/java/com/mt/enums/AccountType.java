package com.mt.enums;

public enum AccountType {
    SUPER_ADMIN("超级管理员"),
    ADMIN("管理员"),
    USER("普通用户");

    private String typeName;
    AccountType(String name) {
        typeName = name;
    }

    public String toString() {
        return typeName;
    }

    public static String toString(int idx) {
        return AccountType.values()[idx].toString();
    }
}
