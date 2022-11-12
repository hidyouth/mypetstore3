package cus21047.web.mypetstore.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterFormServlet extends HttpServlet {

    @Override
    protected  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

//        HttpSession session = req.getSession();
//        User loginUser = (User) session.getAttribute("loginUser");
//        if(loginUser == null){
//            session.setAttribute("islogin","false");
//        }else
//        {
//            session.setAttribute("islogin","true");
//        }
        req.getRequestDispatcher("/WEB-INF/jsp/account/register.jsp").forward(req,resp);
    }
}
