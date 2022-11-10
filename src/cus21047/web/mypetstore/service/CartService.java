package cus21047.web.mypetstore.service;




import cus21047.web.mypetstore.domain.Cart;
import cus21047.web.mypetstore.persistence.CartDao;
import cus21047.web.mypetstore.persistence.impl.CartDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

public class CartService  {
   private CartDao cartDao;

   public CartService(){
       cartDao = new CartDaoImpl();
   }

   public List<Cart> getCartList(String username){
       return cartDao.getCartList(username);
   }

    public Cart getCart(String itemId,String username){
        return cartDao.getCart(itemId,username);
    }

    public void addCart(String itemId, String username, String productId, BigDecimal listprice){
       cartDao.InsterToCart(itemId,username,productId,listprice);
    }
    public void DeleteCart(String itemId, String username){
       cartDao.DeleteCart(itemId,username);
    }



}
