package cus21047.web.mypetstore.persistence;


import cus21047.web.mypetstore.domain.Cart;

import java.math.BigDecimal;
import java.util.List;

public interface CartDao {
    List<Cart> getCartList(String username);

    Cart getCart(String itemId,String username);

    void InsterToCart(String itemId, String username, String productId, BigDecimal lastprice);

}
