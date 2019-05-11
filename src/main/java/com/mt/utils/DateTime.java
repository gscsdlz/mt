package com.mt.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {

    public static String dateNow() {
        Date now = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(now);
    }

    public static String toDate(int ts) {
        Date d = new Date((long) ts * 1000);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(d);
    }

    public static int currTs() {
        Date d = new Date();
        return (int) (d.getTime() / 1000);
    }
}
