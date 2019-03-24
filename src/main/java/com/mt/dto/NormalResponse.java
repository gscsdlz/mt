package com.mt.dto;

import com.fasterxml.jackson.databind.ObjectMapper;

public class NormalResponse<T> {
    private boolean status;
    private String info;
    private T data;

    public NormalResponse() {
        this.status = true;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setInfo(String info) {
        this.setInfo(info, true);
    }

    public void setInfo(String info, boolean setStatus) {
        if (setStatus) {
            this.setStatus(false);
        }
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
