package com.mt.service;

import com.mt.entity.Account;

import java.util.List;

public interface AccountService {
    List<Account> getAllAccount(int pri, int page, int size);

    boolean addAccount(Account account);

    boolean updateAccount(Account account);

    boolean delAccount(int id);

    Account getAccountByUserName(String username);

    Account getAccountById(int id);
}
