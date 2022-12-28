package cus21047.web.mypetstore.web.servlet;


import com.alibaba.fastjson.JSON;
import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.domain.Address;
import cus21047.web.mypetstore.persistence.AddressDao;
import cus21047.web.mypetstore.persistence.impl.AdressDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class GetAddessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account loginAccount = (Account) session.getAttribute("loginAccount");
        if(loginAccount == null){
            resp.setContentType("text/plain");
            PrintWriter out = resp.getWriter();
            out.print("No Login");
        }else{
            AddressDao addressDao = new AdressDaoImpl();
            List<Address> addressList = addressDao.getAddressListByUsername(loginAccount.getUsername());
            String result = JSON.toJSONString(addressList);
            resp.setContentType("text/json");
            PrintWriter writer = resp.getWriter();
            writer.print(result);
        }
    }
}
