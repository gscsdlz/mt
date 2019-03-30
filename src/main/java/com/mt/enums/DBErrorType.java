package com.mt.enums;

public enum DBErrorType {
    SYSTEM_ERROR("数据库系统错误，请重试"),
    DUPLICATE_KEY("数据冲突");

    private final String message;

    DBErrorType(String mess) {
        message = mess;
    }

    public String toString() {
        return message;
    }

    public static String toString(int idx) {
        return OrderStatus.values()[idx].toString();
    }
}
