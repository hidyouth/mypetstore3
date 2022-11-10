package cus21047.web.mypetstore.persistence;

import java.math.BigDecimal;

public interface OrderDao {
    void addOrder(String username, String itemId, int num, BigDecimal total_cost,String adress);
}
