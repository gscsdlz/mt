package com.mt.dto;

import com.fasterxml.jackson.databind.ObjectMapper;

public class NormalResponse {
    private boolean status;
    private String info;

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public boolean isStatus() {
        return status;
    }

    public String getInfo() {
        return info;
    }

    @Override
    public String toString() {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(this);
        } catch (Exception e) {
            return "";
        }
    }
}
