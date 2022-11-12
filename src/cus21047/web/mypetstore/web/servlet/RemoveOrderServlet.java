package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.persistence.OrderDao;
import cus21047.web.mypetstore.persistence.impl.OrderDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RemoveOrderServlet extends HttpServlet {
    private static final String CART_FORM = "/WEB-INF/jsp/cart/cart.jsp";

    OrderDao orderDao = new OrderDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



       int id = Integer.parseInt(req.getParameter("id"));
       orderDao.deleteOrder(id);


        resp.sendRedirect("OrderForm");



    }
}
