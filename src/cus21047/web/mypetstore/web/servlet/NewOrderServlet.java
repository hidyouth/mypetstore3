package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.persistence.OrderDao;
import cus21047.web.mypetstore.persistence.impl.OrderDaoImpl;
import cus21047.web.mypetstore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;

public class NewOrderServlet extends HttpServlet {
    private static final String MAIN_FORM = "/WEB-INF/jsp/catalog/main.jsp";
    OrderDao orderDao = new OrderDaoImpl();
    CartService cartService = new CartService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account loginAccount = (Account) session.getAttribute("loginAccount");
        String username = loginAccount.getUsername();
        String itemId = req.getParameter("itemId");
        String adress = req.getParameter("adress");
        String numString = req.getParameter("num");
        int num = Integer.parseInt(numString);
        String cost = req.getParameter("listprice");
        BigDecimal listprice = new BigDecimal(cost);

        orderDao.addOrder(username,itemId,num,listprice,adress);
        cartService.DeleteCart(itemId,username);

        req.getRequestDispatcher(MAIN_FORM).forward(req,resp);

    }
}
