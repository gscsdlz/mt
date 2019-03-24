package com.mt.utils;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Map;

public class ParamUtils {
    private Map<String, Object> param;
    private ObjectMapper mapper;

    public ParamUtils(Map<String, Object> p) {
        this.param = p;
        mapper = new ObjectMapper();
    }

    public String getString(String key) {
        return getString(key, "");
    }

    public String getString(String key, String defaultVal) {
        if (param.get(key) == null) {
            return defaultVal;
        } else {
            return param.get(key).toString();
        }
    }

    public int getInteger(String key) {
        return getInteger(key, 0);
    }

    public int getInteger(String key, int defaultVal) {
        if (param.get(key) == null) {
            return defaultVal;
        } else {
            return Integer.parseInt(param.get(key).toString());
        }
    }

    public <T> T parseJson(String key, Class<T> valueType) {
        try {
            return mapper.readValue(this.getString(key, "{}"), valueType);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
