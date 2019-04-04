package com.mt.service.impl;

import com.mt.dao.AccountDao;
import com.mt.entity.Account;
import com.mt.enums.AccountType;
import com.mt.enums.AccountUpdateOption;
import com.mt.enums.DBErrorType;
import com.mt.exception.CustomException;
import com.mt.exception.DBSystemError;
import com.mt.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;

    @Override
    public List<Account> getAllAccount(AccountType pri, int page, int size) {
        if (pri.ordinal() == 0) {
            return accountDao.getAllAccountByPri(AccountType.USER.ordinal(), (page - 1) * size, size);
        } else {
            List<Account> l1 = accountDao.getAllAccountByPri(AccountType.SUPER_ADMIN.ordinal(), (page - 1) * size, size);
            List<Account> l2 = accountDao.getAllAccountByPri(AccountType.ADMIN.ordinal(), (page - 1) * size, size);
            l1.addAll(l2);
            return l1;
        }

    }

    @Override
    public boolean addAccount(Account account) throws CustomException {
        try {
            return accountDao.addAccount(account.getUsername(), account.getPri(), account.getDisabled(), account.getPassword()) > 0;
        } catch (DuplicateKeyException e) {
            throw new DBSystemError(DBErrorType.DUPLICATE_KEY);
        }
    }

    @Override
    public boolean updateAccount(Account account, AccountUpdateOption op) {
        if (op == AccountUpdateOption.UPDATE_PASSWORD) {
            return accountDao.updatePassword(account.getId(), account.getPassword()) > 0;
        } else if (op == AccountUpdateOption.UPDATE_ADMIN_INFO) {
            return accountDao.updateAdmin(account.getId(), account.getPri(), account.getDisabled(), account.getUsername()) > 0;
        }
        return false;
    }

    @Override
    public boolean delAccount(int id) {
        return accountDao.delAccount(id) > 0;
    }

    @Override
    public Account getAccountByUserName(String username) {
        return accountDao.getAccountByName(username);
    }

    @Override
    public Account getAccountById(int id) {
        return accountDao.getAccountById(id);
    }
}
