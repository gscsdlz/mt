package com.mt.enums;

public enum DBErrorType {
    SYSTEM_ERROR(""),
    DUPLICATE_KEY("");

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
