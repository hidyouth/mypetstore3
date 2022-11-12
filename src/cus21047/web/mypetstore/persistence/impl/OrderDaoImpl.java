package cus21047.web.mypetstore.persistence.impl;

import cus21047.web.mypetstore.domain.Cart;
import cus21047.web.mypetstore.domain.Order;
import cus21047.web.mypetstore.persistence.DBUtil;
import cus21047.web.mypetstore.persistence.OrderDao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    private static final String AddOrder = "insert INTO userorder(username,itemId,num,total_cost,address) VALUES(?,?,?,?,?)";

    private static final String GetOrderList = "SELECT * FROM userorder WHERE username = ?";

    private static final String DeleteOrder = "DELETE FROM userorder WHERE id=?";

    @Override
    public void addOrder(String username, String itemId, int num, BigDecimal listprice, String adress) {
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(AddOrder);
            BigDecimal listprice1=listprice;
            BigDecimal totalcost=null;
            for(int i=0;i<num-1;i++){
                totalcost=listprice.add(listprice1);
            }

            pStatement.setString(1,username);
            pStatement.setString(2,itemId);
            pStatement.setInt(3,num);
            pStatement.setBigDecimal(4,totalcost);
            pStatement.setString(5,adress);
            pStatement.execute();

            DBUtil.closeStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> getOrderList(String username) {
        List<Order> orderList=new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();

            PreparedStatement pStatement = connection.prepareStatement(GetOrderList);
            pStatement.setString(1,username);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                order.setItemId(resultSet.getString(3));
                order.setNum(resultSet.getInt(4));
                order.setTotal_cost(resultSet.getBigDecimal(5));
                order.setAddress(resultSet.getString(6));
                orderList.add(order);

            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(pStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public void deleteOrder(int id) {
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(DeleteOrder);
            pStatement.setInt(1,id);
            pStatement.execute();

            DBUtil.closeStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        OrderDao orderDao = new OrderDaoImpl();
        BigDecimal bigDecimal =new BigDecimal(123);
        orderDao.deleteOrder(0);
        System.out.println("success");
    }
}
