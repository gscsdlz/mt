package com.mt.service;

import com.mt.entity.City;

import java.util.List;

public interface CityService {
    List<City> getAll();

    City getCityById(int id);

    List<City> getProvince();
}
