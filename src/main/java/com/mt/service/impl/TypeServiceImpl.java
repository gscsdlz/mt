package com.mt.service.impl;

import com.mt.dao.TypeDao;
import com.mt.entity.Type;
import com.mt.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeDao typeDao;

    public List<Type> getSubType(String mainType) {
        return typeDao.getAllSubType(mainType);
    }

    @Override
    public List<Type> getAllType() {
        return typeDao.getAllType();
    }

    @Override
    public List<Type> getAllMainType() {
        return typeDao.getAllMainType();
    }
}
