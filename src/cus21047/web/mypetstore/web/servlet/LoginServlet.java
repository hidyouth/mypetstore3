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
        //У���û��������ȷ��
        if(!validate()){
            req.setAttribute("loginMsg",loginMsg);
            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
        }else {
            AccountService accountService = new AccountService();
            Account loginAccount = accountService.getAccount(username,password);
            if(loginAccount == null){
                this.loginMsg = "�û������������";
                req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
            }else{
                HttpSession session = req.getSession();
                session.setAttribute("loginAccount",loginAccount);
                resp.sendRedirect("mainForm");
                //��post������ʹ��send��Ҳ����post����

            }

        }


    }
    private boolean validate(){
        if(this.username == null ||this.username.equals("")){
            this.loginMsg = "�û�������Ϊ��";
            return false;
        }
        if(this.password == null ||this.password.equals("")){
            this.loginMsg = "���벻��Ϊ��";
            return false;
        }
        return true;
    }
}