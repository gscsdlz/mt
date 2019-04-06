package com.mt.enums;

public enum Sex {
    Sex_None("未知"),
    Sex_Female("女"),
    Sex_Male("男");

    private final String message;

    Sex(String mess) {
        message = mess;
    }

    public String toString() {
        return message;
    }

    public static String toString(int idx) {
        return Sex.values()[idx].toString();
    }
}
