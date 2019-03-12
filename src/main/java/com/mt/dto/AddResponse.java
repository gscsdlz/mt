package com.mt.dto;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

class AddError {
    private int index;
    private String info;

    public AddError() {

    }

    public AddError(int index, String info) {
        this.index = index;
        this.info = info;
    }

    public String getInfo() {
        return info;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getIndex() {
        return index;
    }
}

public class AddResponse extends NormalResponse {
    private Map<Integer, String> errors;

    public void setErrors(Map<Integer, String> errors) {
        this.errors = errors;
    }

    public List<AddError> getErrors() {
        List<AddError> res = new ArrayList<>();

        for (Integer key : errors.keySet()) {
            res.add(new AddError(key, errors.get(key)));
        }
        return res;
    }
}
