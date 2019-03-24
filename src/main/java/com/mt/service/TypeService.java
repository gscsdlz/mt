package com.mt.service;

import com.mt.entity.Type;

import java.util.List;

public interface TypeService {
    List<Type> getSubType(String mainType);

    List<Type> getAllType();

    List<Type> getAllMainType();
}
