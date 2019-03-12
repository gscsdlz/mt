package com.mt.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {
    public static String dateNow() {
        Date now = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return format.format(now);
    }
}
