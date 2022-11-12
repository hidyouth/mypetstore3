package cus21047.web.mypetstore.persistence;

import cus21047.web.mypetstore.domain.Order;

import java.math.BigDecimal;
import java.util.List;

public interface OrderDao {
    void addOrder(String username, String itemId, int num, BigDecimal total_cost,String adress);

    List<Order> getOrderList(String username);

    void deleteOrder(int id);
}
