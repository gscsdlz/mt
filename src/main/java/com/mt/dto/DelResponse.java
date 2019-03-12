package com.mt.dto;

import java.util.List;

public class DelResponse extends NormalResponse {
    private List<Integer> ids;

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }
}
