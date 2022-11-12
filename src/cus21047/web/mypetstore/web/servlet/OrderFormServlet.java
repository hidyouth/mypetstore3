package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.domain.Order;
import cus21047.web.mypetstore.persistence.OrderDao;
import cus21047.web.mypetstore.persistence.impl.OrderDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class OrderFormServlet extends HttpServlet {
    private static final String ORDER_FORM = "/WEB-INF/jsp/cart/order.jsp";
    private static final String LOGIN_FORM = "/WEB-INF/jsp/account/login.jsp";
    OrderDao orderDao = new OrderDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account loginAccount = (Account)session.getAttribute("loginAccount");
        if(loginAccount == null){
            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
        }else{
        String username = loginAccount.getUsername();
        List<Order> orderList =orderDao.getOrderList(username);
        session.setAttribute("orderList",orderList);
        req.getRequestDispatcher(ORDER_FORM).forward(req,resp);
        }
    }
}
