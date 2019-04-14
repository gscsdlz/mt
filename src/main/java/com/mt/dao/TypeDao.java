package com.mt.dao;

import com.mt.entity.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeDao {
    List<Type> getAllSubType(@Param("main_type") String mainType);

    List<Type> getAllType();

    List<Type> getAllMainType();

    Type getTypeById(@Param("id") int id);

    int addType(@Param("main_type") String mainType, @Param("type_name") String typeName);

    int updateType(@Param("id") int id, @Param("main_type") String mainType, @Param("type_name") String typeName);

    int delType(@Param("id") int id);

    int delMainType(@Param("main_type") String mainType);
}
