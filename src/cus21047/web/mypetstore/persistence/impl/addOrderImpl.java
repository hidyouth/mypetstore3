package cus21047.web.mypetstore.persistence.impl;

import cus21047.web.mypetstore.persistence.DBUtil;
import cus21047.web.mypetstore.persistence.OrderDao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class addOrderImpl implements OrderDao {
    private static final String AddOrder = "insert INTO userorder(username,itemId,num,total_cost,address) VALUES(?,?,?,?,?)";

    @Override
    public void addOrder(String username, String itemId, int num, BigDecimal total_cost, String adress) {
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(AddOrder);
            pStatement.setString(1,username);
            pStatement.setString(2,itemId);
            pStatement.setInt(3,num);
            pStatement.setBigDecimal(4,total_cost);
            pStatement.setString(5,adress);
            pStatement.execute();

            DBUtil.closeStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        OrderDao orderDao = new addOrderImpl();
        BigDecimal bigDecimal =new BigDecimal(123);
        orderDao.addOrder("j2ee","2",2,bigDecimal,"asdwad");
        System.out.println("success");
    }
}
