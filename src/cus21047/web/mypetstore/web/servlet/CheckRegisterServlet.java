package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.service.AccountService;
import cus21047.web.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CheckRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        AccountService accountService = new AccountService();
        Account account = accountService.getAccountByUsername(username);
        if(account == null){
            resp.setContentType("text/plain");
            PrintWriter out = resp.getWriter();
            out.print("Not Exist");
        }else{
            resp.setContentType("text/plain");
            PrintWriter out = resp.getWriter();
            out.print("Exist");
        }
    }
}
