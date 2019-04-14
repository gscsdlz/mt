package com.mt.service.impl;

import com.mt.dao.TypeDao;
import com.mt.entity.Type;
import com.mt.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
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

    @Override
    public List<Type> getTypeRefId(int typeId) {
        Type t = typeDao.getTypeById(typeId);
        return typeDao.getAllSubType(t.getMainType());
    }

    @Override
    public boolean addType(Type t) {
        try {
            return typeDao.addType(t.getMainType(), t.getTypeName()) > 0;
        } catch (DuplicateKeyException e) {
            return false;
        }
    }

    @Override
    public boolean updateType(Type t) {
        try {
            return typeDao.updateType(t.getId(), t.getMainType(), t.getTypeName()) > 0;
        } catch (DuplicateKeyException e) {
            return false;
        }
    }

    @Override
    public boolean delType(int typeId) {
        try {
            return typeDao.delType(typeId) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delMainType(String mainType) {
        try {
            return typeDao.delMainType(mainType) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
