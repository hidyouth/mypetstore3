package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.service.RecordService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ClearRecordServlet extends HttpServlet {

        private static final String RECORD_FORM="/WEB-INF/jsp/record/record.jsp";
        private String userid;

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            Account loginAccount = (Account) session.getAttribute("loginAccount");
            if(loginAccount == null) {
                resp.sendRedirect("loginForm");
            }else{
                RecordService userService = new RecordService();
                this.userid = loginAccount.getUsername();
                userService.DeleteRecord(userid);
                session.setAttribute("recordList" , userService.getRecordList(userid));
                req.getRequestDispatcher(RECORD_FORM).forward(req,resp);
            }

        }


    }