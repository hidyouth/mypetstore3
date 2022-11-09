package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private static final String LOGIN_FORM = "/WEB-INF/jsp/account/login.jsp";
    private  String username;
    private  String password;

    private String loginMsg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");
        //校验用户输入的正确性
        if(!validate()){
            req.setAttribute("loginMsg",loginMsg);
            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
        }else {
            AccountService accountService = new AccountService();
            Account loginAccount = accountService.getAccount(username,password);
            if(loginAccount == null){
                this.loginMsg = "用户名或密码错误";
                req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
            }else{
                HttpSession session = req.getSession();
                session.setAttribute("loginAccount",loginAccount);
                resp.sendRedirect("mainForm");
                //在post方法中使用send，也会用post请求

            }

        }


    }
    private boolean validate(){
        if(this.username == null ||this.username.equals("")){
            this.loginMsg = "用户名不能为空";
            return false;
        }
        if(this.password == null ||this.password.equals("")){
            this.loginMsg = "密码不能为空";
            return false;
        }
        return true;
    }
}
