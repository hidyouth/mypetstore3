package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.domain.Cart;
import cus21047.web.mypetstore.domain.Item;
import cus21047.web.mypetstore.persistence.ItemDao;
import cus21047.web.mypetstore.persistence.RecordDao;
import cus21047.web.mypetstore.persistence.impl.ItemDaoImpl;
import cus21047.web.mypetstore.persistence.impl.RecordDaoImpl;
import cus21047.web.mypetstore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NewOrderFormServlet extends HttpServlet {

    private static final String NEW_OEDER_FORM = "/WEB-INF/jsp/order/neworder.jsp";
    CartService cartService =new CartService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account loginAccount = (Account) session.getAttribute("loginAccount");
        if(loginAccount == null){
            resp.sendRedirect("loginForm");
        }else{
            String itemId = req.getParameter("itemId");
            String username = loginAccount.getUsername();
            Cart cart = cartService.getCart(itemId,username);
            if(cart == null){
                ItemDao itemDao = new ItemDaoImpl();
                Item item = itemDao.getItem(itemId);
                session.setAttribute("itemId",item.getItemId());
                session.setAttribute("num",1);
                session.setAttribute("listprice",item.getListPrice());
            }else {
                session.setAttribute("itemId",cart.getItemId());
                session.setAttribute("num",cart.getNum());
                session.setAttribute("listprice",cart.getListprice());
            }
            RecordDao userService = new RecordDaoImpl();
            SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
            Date date = new Date(System.currentTimeMillis());
            userService.InsertToRecord(loginAccount.getUsername(),"下单"+itemId+" -----------------------------"+formatter.format(date),0);


            req.getRequestDispatcher(NEW_OEDER_FORM).forward(req,resp);
        }
    }
}
