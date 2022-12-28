package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.domain.Cart;
import cus21047.web.mypetstore.domain.Item;
import cus21047.web.mypetstore.persistence.CartDao;
import cus21047.web.mypetstore.persistence.impl.CartDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RemoveCartItemServlet extends HttpServlet {

    private static final String ERROR_FORM = "/WEB-INF/jsp/common/error.jsp";
    private static final String CART_FORM = "/WEB-INF/jsp/cart/cart.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req. getSession();
        CartDao cartDao = new CartDaoImpl();
        Account account = (Account)session.getAttribute("loginAccount");

        String workingItemId = req.getParameter("workingItemId");


        cartDao.DeleteCart(workingItemId,account.getUsername());


        req.getRequestDispatcher(CART_FORM).forward(req, resp);

    }
}
















