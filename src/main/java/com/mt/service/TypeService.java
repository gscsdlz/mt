package com.mt.service;

import com.mt.entity.Type;

import java.util.List;

public interface TypeService {
    List<Type> getSubType(String mainType);

    List<Type> getAllType();

    List<Type> getAllMainType();

    List<Type> getTypeRefId(int typeId);

    boolean addType(Type t);

    boolean updateType(Type t);

    boolean delType(int typeId);

    boolean delMainType(String mainType);
}
