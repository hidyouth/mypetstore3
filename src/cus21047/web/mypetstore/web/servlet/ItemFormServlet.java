package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.domain.Item;
import cus21047.web.mypetstore.domain.Product;
import cus21047.web.mypetstore.service.CatalogService;
import cus21047.web.mypetstore.service.RecordService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ItemFormServlet extends HttpServlet {
    private CatalogService catalogService;
    private  String userid;

    private static final String ITEM_FORM = "/WEB-INF/jsp/catalog/item.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String itemId = req.getParameter("itemId");
        catalogService = new CatalogService();
        Item item = catalogService.getItem(itemId);
        Product product = item.getProduct();

        HttpSession session = req.getSession();
        Account loginAccount = (Account) session.getAttribute("loginAccount");
        if (loginAccount != null) {
            RecordService userService = new RecordService();
            this.userid = loginAccount.getUsername();
            userService.InsertToRecord(userid,itemId);
        }
            session.setAttribute("product", product);
            session.setAttribute("item", item);
            req.getRequestDispatcher(ITEM_FORM).forward(req, resp);

    }
}
