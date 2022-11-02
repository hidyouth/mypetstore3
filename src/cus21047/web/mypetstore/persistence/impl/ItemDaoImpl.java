package cus21047.web.mypetstore.persistence.impl;

import cus21047.web.mypetstore.domain.Item;
import cus21047.web.mypetstore.persistence.DBUtil;
import cus21047.web.mypetstore.persistence.ItemDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ItemDaoImpl implements ItemDao {
    private static final String getItemListByProductString =
            "SELECT I.ITEMID,LISTPRICE,UNITCOST,SUPPLIER AS supplierId,I.PRODUCTID AS \"product.productId\",NAME AS \"product.name\"," +
                    "DESCN AS \"product.description\",CATEGORY AS \"product.categoryId\",STATUS," +
                    "ATTR1 AS attribute1,ATTR2 AS attribute2,ATTR3 AS attribute3,ATTR4 AS attribute4,ATTR5 AS attribute5" +
                    "FROM ITEM I, PRODUCT P WHERE P.PRODUCTID = I.PRODUCTID AND I.PRODUCTID = ?";
    private static final String getItemString =
            "SELECT I.ITEMID,LISTPRICE,UNITCOST,SUPPLIER AS supplierId,I.PRODUCTID AS \"product.productId\",NAME AS \"product.name\"," +
                    "DESCN AS \"product.description\",CATEGORY AS \"product.categoryId\",STATUS," +
                    "ATTR1 AS attribute1,ATTR2 AS attribute2,ATTR3 AS attribute3,ATTR4 AS attribute4,ATTR5 AS attribute5" +
                    "QTY AS quantity from ITEM I, INVENTORY V, PRODUCT P where P.PRODUCTID = I.PRODUCTID and I.ITEMID = V.ITEMID and I.ITEMID = ?";
    private static final String getInventoryQuantityString =
            "SELECT QTY AS value FROM INVENTORY WHERE ITEMID = ?";
    private static final String updateInventoryQuantityString =
            "UPDATE INVENTORY SET QTY = QTY - ? WHERE ITEMID = ?";


    @Override
    public void updateInventoryQuantity(Map<String, Object> param) {

        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(updateInventoryQuantityString);
            int n = pStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }


    }

    @Override
    public int getInventoryQuantity(String itemId) {
        int n = 0;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.
                    prepareStatement(getInventoryQuantityString);
            ResultSet resultSet = pStatement.executeQuery();
            resultSet.last();
            n = resultSet.getRow();//获得行数
        }catch (Exception e){
            e.printStackTrace();
        }

        return n;
    }

    @Override
    public List<Item> getItemListByProduct(String productId) {
        List<Item> items = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.
                    prepareStatement(getItemListByProductString);
            ResultSet resultSet = pStatement.executeQuery();
            while(resultSet.next()){
                Item item = new Item();
                item.setItemId(resultSet.getString(1));
                item.setProductId(resultSet.getString(2));
                item.setListPrice(resultSet.getBigDecimal(3));
                item.setUnitCost(resultSet.getBigDecimal(4));
                item.setSupplierId(resultSet.getByte(5));
                item.setStatus(resultSet.getString(6));
                item.setAttribute1(resultSet.getString(7));
                items.add(item);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e){
            e.printStackTrace();
        }
        return items;
    }

    @Override
    public Item getItem(String itemId) {
        Item item = new Item();
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(getItemString);
            ResultSet resultSet = pStatement.executeQuery();
            if(resultSet.next()){
                item = new Item();
                item.setItemId(resultSet.getString(1));
                item.setProductId(resultSet.getString(2));
                item.setListPrice(resultSet.getBigDecimal(3));
                item.setUnitCost(resultSet.getBigDecimal(4));
                item.setSupplierId(resultSet.getByte(5));
                item.setStatus(resultSet.getString(6));
                item.setAttribute1(resultSet.getString(7));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e){

        }
        return item;
    }
}
