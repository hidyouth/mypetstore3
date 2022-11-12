package cus21047.web.mypetstore.service;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.persistence.AccountDao;
import cus21047.web.mypetstore.persistence.impl.AccountDaoImpl;

public class AccountService {
    private AccountDao accountDao;
    public AccountService(){
        this.accountDao = new AccountDaoImpl();
    }
    public Account getAccount(String username, String password) {
        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        return accountDao.getAccountByUsernameAndPassword(account);
    }
    public Account getAccountByUsername(String username){
        return accountDao.getAccountByUsername(username);
    }
    public void insterAccount(Account account){
        accountDao.insertAccount(account);
    }
    public void insterSingon(Account account){
        accountDao.insertSignon(account);
    }
}
