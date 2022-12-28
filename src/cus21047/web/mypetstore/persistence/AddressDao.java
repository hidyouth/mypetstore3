package cus21047.web.mypetstore.persistence;

import cus21047.web.mypetstore.domain.Address;

import java.util.List;

public interface AddressDao {
    List<Address> getAddressListByUsername(String username);
    void AddAddress(String username,String name,String province,String city,String district,String address);
    void DleteAddress(String username);
}
