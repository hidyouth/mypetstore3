package cus21047.web.mypetstore.persistence.impl;


import cus21047.web.mypetstore.domain.Cart;
import cus21047.web.mypetstore.domain.Cart;
import cus21047.web.mypetstore.persistence.CartDao;
import cus21047.web.mypetstore.persistence.DBUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDaoImpl implements CartDao {
    private static final String GetCartList = "SELECT * FROM cart WHERE username = ?";

    private static final String GetCart = "SELECT * FROM cart WHERE username=? and itemId= ?";

    private static final String AddCart = "insert INTO cart(username,itemId,productId,num,total_cost) VALUES(?,?,?,?,?)" ;


    //这个函数是寻找购物车中所有商品的
    @Override
    public  List<Cart> getCartList(String username) {
        List<Cart> cartList = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnectionCartAndOrder();

            PreparedStatement pStatement = connection.prepareStatement(GetCartList);
            pStatement.setString(1,username);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                Cart cart = new Cart();
                cart.setUsername(resultSet.getString(1));
                cart.setItemId(resultSet.getString(2));
                cart.setProductId(resultSet.getString(3));
                cart.setNum(resultSet.getInt(4));
                cart.setTotal_cost(resultSet.getBigDecimal(5));
                cartList.add(cart);

            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(pStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartList;
    }

    @Override
    public Cart getCart(String itemId, String username) {
        Cart cart = null;
        try {
            Connection connection = DBUtil.getConnectionCartAndOrder();

            PreparedStatement pStatement = connection.prepareStatement(GetCart);
            pStatement.setString(1, username);
            pStatement.setString(2, itemId);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()) {
                cart = new Cart();
                cart.setUsername(resultSet.getString(1));
                cart.setItemId(resultSet.getString(2));
                cart.setProductId(resultSet.getString(3));
                cart.setNum(resultSet.getInt(4));
                cart.setTotal_cost(resultSet.getBigDecimal(5));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(pStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cart;
    }

    @Override
    public void InsterToCart(String itemId, String username, String productId, BigDecimal listprice) {
        try{
            Connection connection = DBUtil.getConnectionCartAndOrder();
            PreparedStatement pStatement = connection.prepareStatement(AddCart);
            pStatement.setString(1,username);
            pStatement.setString(2,itemId);
            pStatement.setString(3,productId);
            pStatement.setInt(4,1);
            pStatement.setBigDecimal(5,listprice);
            pStatement.execute();

            DBUtil.closeStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        CartDao cartDao = new CartDaoImpl();
        List<Cart> cartList = new ArrayList<>();
        cartList= cartDao.getCartList("j2ee");
        Cart cart = cartDao.getCart("EST-18","j2ee");
        System.out.println("success");
    }

}


//    private static final String GetCartList="SELECT * FROM ?_cart";
//    @Override
//    public List<Cart> getCartList(String username) {
//        List<Cart> cartList =new ArrayList<>();
//
//
//        try{
//                Connection connection = DBUtil.getConnectionCartAndOrder();
//                Statement statement = connection.createStatement();
//                ResultSet resultSet = statement.executeQuery(GetCartList);
//                while(resultSet.next()){
//                    Category category = new Category();
//                    Cart cart =new Cart();
//                    cart.setProductId(resultSet.getString(1));
//                    cart.setCategory(resultSet.getString(2));
//
//
//                    cartList.add(cart);
//
//                }
//                DBUtil.closeResultSet(resultSet);
//                DBUtil.closeStatement(statement);
//                DBUtil.closeConnection(connection);
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//
//        return null;
//    }
//
//    @Override
//    public Cart getCartList(String productId) {
//        return null;
//    }

