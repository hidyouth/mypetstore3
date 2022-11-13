package cus21047.web.mypetstore.persistence.impl;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.persistence.AccountDao;
import cus21047.web.mypetstore.persistence.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDaoImpl implements AccountDao {
    private static final String GET_ACCOUNT_BY_USERNAME_AND_PASSWORD=
            "SELECT " +
                    "SIGNON.USERNAME," +
                    "ACCOUNT.EMAIL,ACCOUNT.FIRSTNAME,ACCOUNT.LASTNAME,ACCOUNT.STATUS," +
                    "ACCOUNT.ADDR1 AS address1,ACCOUNT.ADDR2 AS address2," +
                    "ACCOUNT.CITY,ACCOUNT.STATE,ACCOUNT.ZIP,ACCOUNT.COUNTRY,ACCOUNT.PHONE " +
                    "FROM ACCOUNT,SIGNON " +
                    "WHERE ACCOUNT.USERID = ? AND SIGNON.PASSWORD = ? " +
                    "AND SIGNON.USERNAME = ACCOUNT.USERID ";
    private static final String GET_ACCOUNT_BY_USERNAME =
            "SELECT "+
                    "SIGNON.USERNAME,"+
                    "ACCOUNT.EMAIL,"+
                    "ACCOUNT.FIRSTNAME,"+
                    "ACCOUNT.LASTNAME,"+
                    "ACCOUNT.STATUS,"+
                    "ACCOUNT.ADDR1 AS address1,"+
                    "ACCOUNT.ADDR2 AS address2,"+
                    "ACCOUNT.CITY,"+
                    "ACCOUNT.STATE,"+
                    "ACCOUNT.ZIP,"+
                    "ACCOUNT.COUNTRY,"+
                    "ACCOUNT.PHONE "+
                    "FROM ACCOUNT, SIGNON "+
                    "WHERE ACCOUNT.USERID = ?"+
                    "AND SIGNON.USERNAME = ACCOUNT.USERID ";
    private static final String INSTER_ACCOUNT =
            "INSERT INTO ACCOUNT" +
                    "(USERID,EMAIL, FIRSTNAME, LASTNAME, STATUS, ADDR1, ADDR2, CITY,STATE, ZIP, COUNTRY, PHONE)" +
                    " VALUES" +
                    "(?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String INSTER_SINGON =
            "INSERT INTO SIGNON (PASSWORD,USERNAME)" +
                    " VALUES (?, ?)";
    private static final String UPDATE_ACCOUNT=
            "UPDATE ACCOUNT SET\n" +
                    "      EMAIL = ?,\n" +
                    "      FIRSTNAME = ?,\n" +
                    "      LASTNAME = ?,\n" +
                    "      STATUS = ?,\n" +
                    "      ADDR1 = ?,\n" +
                    "      ADDR2 = ?,\n" +
                    "      CITY = ?,\n" +
                    "      STATE = ?,\n" +
                    "      ZIP = ?,\n" +
                    "      COUNTRY = ?,\n" +
                    "      PHONE = ?\n" +
                    "    WHERE USERID = ?";


    @Override
    public Account getAccountByUsername(String username) {
        Account accountResult = null;
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.
                    prepareStatement(GET_ACCOUNT_BY_USERNAME);
            pStatement.setString(1,username);

            ResultSet resultSet = pStatement.executeQuery();
            if(resultSet.next()){
                accountResult = this.resultSetToAccount(resultSet);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return accountResult;
    }

    @Override
    public Account getAccountByUsernameAndPassword(Account account) {
        Account accountResult = null;
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.
                    prepareStatement(GET_ACCOUNT_BY_USERNAME_AND_PASSWORD);
            pStatement.setString(1,account.getUsername());
            pStatement.setString(2,account.getPassword());
            ResultSet resultSet = pStatement.executeQuery();
            if(resultSet.next()){
                accountResult = this.resultSetToAccount(resultSet);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return accountResult;
    }

    private Account resultSetToAccount(ResultSet resultSet) throws Exception{
        Account account = new Account();
        account.setUsername(resultSet.getString("username"));
//        account.setPassword(resultSet.getString("password"));
        account.setEmail(resultSet.getString("email"));
        account.setFirstName(resultSet.getString("firstName"));
        account.setLastName(resultSet.getString("lastName"));
        account.setStatus(resultSet.getString("status"));
        account.setAddress1(resultSet.getString("address1"));
        account.setAddress2(resultSet.getString("address2"));
        account.setCity(resultSet.getString("city"));
        account.setState(resultSet.getString("state"));
        account.setZip(resultSet.getString("zip"));
        account.setCountry(resultSet.getString("country"));
        account.setPhone(resultSet.getString("phone"));
//        account.setFavouriteCategoryId(resultSet.getString("favouriteCategoryId"));
//        account.setLanguagePreference(resultSet.getString("languagePreference"));
//        account.setListOption(resultSet.getInt("listOption") == 1);
//        account.setBannerOption(resultSet.getInt("bannerOption") == 1);
//        account.setBannerName(resultSet.getString("bannerName"));
        return account;
    }

    @Override
    public void insertAccount(Account account) {
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.
                    prepareStatement(INSTER_ACCOUNT);
            pStatement.setString(1,account.getUsername());
            pStatement.setString(2,account.getEmail());
            pStatement.setString(3,account.getFirstName());
            pStatement.setString(4,account.getLastName());
            pStatement.setString(5,account.getStatus());
            pStatement.setString(6,account.getAddress1());
            pStatement.setString(7,account.getAddress2());
            pStatement.setString(8,account.getCity());
            pStatement.setString(9,account.getState());
            pStatement.setString(10,account.getZip());
            pStatement.setString(11,account.getCountry());
            pStatement.setString(12,account.getPhone());
            pStatement.execute();
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void insertProfile(Account account) {

    }

    @Override
    public void insertSignon(Account account) {
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.
                    prepareStatement(INSTER_SINGON);
            pStatement.setString(1,account.getPassword());
            pStatement.setString(2,account.getUsername());
            pStatement.execute();
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateAccount(Account account) {
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.
                    prepareStatement(UPDATE_ACCOUNT);

            pStatement.setString(1,account.getEmail());
            pStatement.setString(2,account.getFirstName());
            pStatement.setString(3,account.getLastName());
            pStatement.setString(4,account.getStatus());
            pStatement.setString(5,account.getAddress1());
            pStatement.setString(6,account.getAddress2());
            pStatement.setString(7,account.getCity());
            pStatement.setString(8,account.getState());
            pStatement.setString(9,account.getZip());
            pStatement.setString(10,account.getCountry());
            pStatement.setString(11,account.getPhone());
            pStatement.setString(12,account.getUsername());
            pStatement.execute();
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateProfile(Account account) {

    }

    @Override
    public void updateSignon(Account account) {

    }

//    public static void main(String[] args) {
//        AccountDao accountDao = new AccountDaoImpl();
//        Account account = new Account();
//        account.setUsername("j2ee");
//        account.setPassword("j2ee");
//        Account result = accountDao.getAccountByUsernameAndPassword(account);
//        System.out.println("success");
//    }
public static void main(String[] args) {
    AccountDao accountDao = new AccountDaoImpl();
    Account account = new Account();
    account.setPassword("j2ee");
    account.setUsername("jee");

    account.setEmail("1");
    account.setFirstName("1");
    account.setLastName("1");
    account.setStatus("1");
    account.setAddress1("1");
    account.setAddress2("1");
    account.setCity("1");
    account.setState("1");
    account.setZip("1");
    account.setCountry("1");
    account.setPhone("1");

   Account account1 = accountDao.getAccountByUsername("1");
    System.out.println();
}
}
