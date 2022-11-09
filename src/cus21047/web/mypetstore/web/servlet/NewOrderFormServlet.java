package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class NewOrderFormServlet extends HttpServlet {

    private static final String NEW_OEDER_FORM = "/WEB-INF/jsp/order/neworder.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account loginAccount = (Account) session.getAttribute("loginAccount");
        if(loginAccount == null){
            resp.sendRedirect("loginForm");
        }else{
            req.getRequestDispatcher(NEW_OEDER_FORM).forward(req,resp);
        }
    }
}
