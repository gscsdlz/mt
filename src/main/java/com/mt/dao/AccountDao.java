package com.mt.dao;

import com.mt.entity.Account;
import com.mt.utils.ParamUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountDao {

    List<Account> getAllAccountByPri(@Param("pri") int pri, @Param("offset") int offset, @Param("limit") int limit);

    int addAccount(
            @Param("username") String username,
            @Param("pri") int pri,
            @Param("disabled") int disabled,
            @Param("password") String password
    );

    int updatePassword(
            @Param("id") int id,
            @Param("password") String password
    );

    int updateAdmin(
            @Param("id") int id,
            @Param("pri") int pri,
            @Param("disabled") int disabled,
            @Param("username") String username
    );

    int delAccount(@Param("id") int id);

    Account getAccountById(@Param("id") int id);

    Account getAccountByName(@Param("username") String username);

    int updateDisabled(@Param("id") int id, @Param("disabled") int disabled);
}
