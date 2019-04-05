package com.mt.enums;

public enum OrderStatus {
    INIT("用户创建订单"),
    PAYED("已完成支付"),
    MAKE("商家已接单"),
    SEND("订单已送出"),
    RECV("订单已签收"),
    DONE("订单已完成");

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
