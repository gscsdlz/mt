package com.mt.enums;

public enum Constellation {
    Constellation_0("未知"),
    Constellation_1("白羊座"),
    Constellation_2("金牛座"),
    Constellation_3("双子座"),
    Constellation_4("巨蟹座"),
    Constellation_5("狮子座"),
    Constellation_6("处女座"),
    Constellation_7("天秤座"),
    Constellation_8("天蝎座"),
    Constellation_9("射手座"),
    Constellation_10("摩羯座"),
    Constellation_11("水瓶座"),
    Constellation_12("双鱼座");

    private String name;
    Constellation(String n) {
        name = n;
    }

    public String toString() {
        return name;
    }

    public static String toString(int idx) {
        return Constellation.values()[idx].toString();
    }
}
