package com.mt.dao;

import com.mt.entity.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeDao {
    List<Type> getAllSubType(@Param("main_type") String mainType);
    List<Type> getAllType();
    List<Type> getAllMainType();
}
