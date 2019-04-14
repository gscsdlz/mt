package com.mt.entity;

import java.math.BigDecimal;

public class StoreStar {
    private double avgStar;
    private int totalRemark;
    private double avgPrice;

    public double getAvgStar() {
        BigDecimal b = new BigDecimal(avgStar);
        return b.setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    public void setAvgStar(double avgStar) {
        this.avgStar = avgStar;
    }

    public int getTotalRemark() {
        return totalRemark;
    }

    public void setTotalRemark(int totalRemark) {
        this.totalRemark = totalRemark;
    }

    public int getAvgPrice() {
        return (int) avgPrice;
    }

    public void setAvgPrice(double avgPrice) {
        this.avgPrice = avgPrice;
    }
}
