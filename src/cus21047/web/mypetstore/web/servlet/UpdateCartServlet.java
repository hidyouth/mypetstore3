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
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Objects;


public class UpdateCartServlet extends HttpServlet {

    private static final String CART_FORM = "/WEB-INF/jsp/cart/cart.jsp";
    CartDao cartDao = new CartDaoImpl();

    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        resp.setContentType("text/plain");
        resp.setHeader("Access-Control-Allow-Origin","*");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        Account loginAccount =(Account) session.getAttribute("loginAccount");
        String username = loginAccount.getUsername();
        String itemId = req.getParameter("itemId");
        String numString = req.getParameter("num");
        if(Objects.equals(numString, "")){
            numString="0";
        }
        int num = Integer.parseInt(numString);
        cartDao.UpdateCart(itemId,username,num);
        Cart cart=cartDao.getCart(itemId,username);
        BigDecimal a=cart.getTotal_cost();
        int b=cart.getNum();
        BigDecimal[]arr={a,BigDecimal.valueOf(b)};
        out.print(Arrays.toString(arr));
        }
}


























