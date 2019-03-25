package com.mt.service.impl;

import com.mt.dao.AccountDao;
import com.mt.entity.Account;
import com.mt.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;

    @Override
    public List<Account> getAllAccount(int pri, int page, int size) {
        return null;
    }

    @Override
    public boolean addAccount(Account account) {
        return false;
    }

    @Override
    public boolean updateAccount(Account account) {
        return false;
    }

    @Override
    public boolean delAccount(int id) {
        return false;
    }

    @Override
    public Account getAccountByUserName(String username) {
        return null;
    }

    @Override
    public Account getAccountById(int id) {
        return null;
    }
}
