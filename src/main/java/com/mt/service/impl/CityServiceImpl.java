package com.mt.service.impl;

import com.mt.dao.CityDao;
import com.mt.entity.City;
import com.mt.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityServiceImpl implements CityService {
    @Autowired
    private CityDao cityDao;

    @Override
    public List<City> getAll() {
        return cityDao.getAllCity();
    }

    @Override
    public City getCityById(int id) {
        return cityDao.getCityById(id);
    }
}
