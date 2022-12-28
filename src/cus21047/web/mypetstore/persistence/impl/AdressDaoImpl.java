package cus21047.web.mypetstore.persistence.impl;

import cus21047.web.mypetstore.domain.Address;
import cus21047.web.mypetstore.persistence.AddressDao;
import cus21047.web.mypetstore.persistence.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdressDaoImpl implements AddressDao {
    static final String GetAdressListByUsername = "SELECT * FROM address WHERE username=?";
    static final String addAdress = "INSERT INTO address(username,name,province,city,district,address) VALUES(?,?,?,?,?,?)";

    @Override
    public List<Address> getAddressListByUsername(String username) {
        List<Address> addressList = new ArrayList<>();
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection
                    .prepareStatement(GetAdressListByUsername);
            pStatement.setString(1, username);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()){
                Address address = new Address();
                address.setId(resultSet.getInt(1));
                address.setUsername(resultSet.getString(2));
                address.setName(resultSet.getString(3));
                address.setProvince(resultSet.getString(4));
                address.setCity(resultSet.getString(5));
                address.setDistrict(resultSet.getString(6));
                address.setAddress(resultSet.getString(7));
                addressList.add(address);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return addressList;
    }

    @Override
    public void AddAddress(String username, String name, String province, String city, String district, String address) {
        Address address1 = new Address();
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection
                    .prepareStatement(addAdress);
            pStatement.setString(1, username);
            pStatement.setString(2, name);
            pStatement.setString(3, province);
            pStatement.setString(4, city);
            pStatement.setString(5, district);
            pStatement.setString(6, address);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()){

                address1.setId(resultSet.getInt(1));
                address1.setUsername(resultSet.getString(2));
                address1.setName(resultSet.getString(3));
                address1.setProvince(resultSet.getString(4));
                address1.setCity(resultSet.getString(5));
                address1.setDistrict(resultSet.getString(6));
                address1.setAddress(resultSet.getString(7));

            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void DleteAddress(String username) {

    }
}
