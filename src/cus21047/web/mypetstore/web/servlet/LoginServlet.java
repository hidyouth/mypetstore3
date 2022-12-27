package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.persistence.RecordDao;
import cus21047.web.mypetstore.persistence.impl.RecordDaoImpl;
import cus21047.web.mypetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LoginServlet extends HttpServlet {

    private static final String LOGIN_FORM = "/WEB-INF/jsp/account/login.jsp";
    private String username;
    private String password;
    private String VerificationCode;
    private String Verification;
    private String loginMsg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");
        this.VerificationCode = req.getParameter("VerificationCode");
        this.Verification = req.getParameter("Verification");
        //校验用户输入的正确性
        if(!validate()){
            req.setAttribute("loginMsg",loginMsg);
            req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
        }else {
            AccountService accountService = new AccountService();
            Account loginAccount = accountService.getAccount(username,password);
            if(loginAccount == null){
                this.loginMsg = "用户名或密码错误";
                req.setAttribute("loginMsg",loginMsg);
                req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
            }else{
                if(this.VerificationCode.equals(this.Verification)){
                    HttpSession session = req.getSession();
                    session.setAttribute("loginAccount",loginAccount);
                    SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
                    Date date = new Date(System.currentTimeMillis());
                    RecordDao userService = new RecordDaoImpl();
                    userService.InsertToRecord(username,"登录"+" -----------------------------"+formatter.format(date),0);
                    resp.sendRedirect("mainForm");
                }else{
                    this.loginMsg = "验证码错误";
                    req.setAttribute("loginMsg",loginMsg);
                    req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
                }

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
        if(this.VerificationCode == null ||this.VerificationCode.equals("")){
            this.loginMsg = "验证码不能为空";
            return false;
        }
        return true;
    }


}

