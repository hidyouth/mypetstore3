package cus21047.web.mypetstore.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VerificationServlet extends HttpServlet {
    private static final String LOGIN_FORM = "/WEB-INF/jsp/account/login.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String VerificationCode = createCode();
        //生成一个长度为5的验证码
        req.setAttribute("VerificationCode",VerificationCode);
        req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
    }

    String createCode() {
        String Code="";
        char[] codeList = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        for(int i=0;i<5;i++){
            int charNum = (int)(Math.random()*62);
            Code+=codeList[charNum];
        }
        return Code;
    }
}

