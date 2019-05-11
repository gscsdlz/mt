package com.mt.service;

import com.mt.entity.Account;
import com.mt.enums.AccountType;
import com.mt.enums.AccountUpdateOption;
import com.mt.exception.CustomException;

import java.util.List;

public interface AccountService {
    List<Account> getAllAccount(AccountType pri, int page, int size);

    boolean addAccount(Account account) throws CustomException;

    boolean updateAccount(Account account, AccountUpdateOption op);

    boolean delAccount(int id);

    Account getAccountByUserName(String username);

    Account getAccountById(int id);

    boolean updateRecentCity(int id, int recentCity);

    List<String> groupByMonth(String lastTime);
}
