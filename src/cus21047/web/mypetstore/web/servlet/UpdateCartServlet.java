package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.domain.Cart;
import cus21047.web.mypetstore.domain.CartItem;
import cus21047.web.mypetstore.persistence.CartDao;
import cus21047.web.mypetstore.persistence.impl.CartDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;



public class UpdateCartServlet extends HttpServlet {

    private static final String CART_FORM = "/WEB-INF/jsp/cart/cart.jsp";
    CartDao cartDao = new CartDaoImpl();

    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String itemId = req.getParameter("itemId");
        HttpSession session = req.getSession();
        Account loginAccount =(Account) session.getAttribute("loginAccount");
        String username = loginAccount.getUsername();
        String numString = req.getParameter("num");
        int num = Integer.parseInt(numString);
        cartDao.UpdateCart(itemId,username,num);


        resp.sendRedirect("cartForm");
    }
}


























