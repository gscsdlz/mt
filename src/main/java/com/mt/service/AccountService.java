package com.mt.service;

import com.mt.entity.Account;

import java.util.List;

public interface AccountService {
    Account getUserByUsername(String username);

    int addUser(String username, String password, int act);

    int countJoin(int accountId);

    int disable(int accountId, int disable);

    int resetPassword(int accountId);

    List<Account> getAllUser();
}
