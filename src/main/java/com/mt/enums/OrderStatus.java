package com.mt.enums;

public enum OrderStatus {
    INIT(""),
    WAIT_PAY(""),
    PAYED(""),
    SEND(""),
    RECV(""),
    DONE("");

    private final String message;

    OrderStatus(String mess) {
        message = mess;
    }

    public String toString() {
        return message;
    }

    public static String toString(int idx) {
        return OrderStatus.values()[idx].toString();
    }
}
