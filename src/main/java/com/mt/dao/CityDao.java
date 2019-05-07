package com.mt.dao;

import com.mt.entity.City;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CityDao {
    List<City> getAllCity();

    City getCityById(@Param("id") int id);
}
