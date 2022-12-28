package cus21047.web.mypetstore.web.servlet;

import com.alibaba.fastjson.JSON;
import cus21047.web.mypetstore.domain.Item;
import cus21047.web.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ItemTypeChangeServlet extends HttpServlet {
    CatalogService catalogService = new CatalogService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        Item item = catalogService.getItem(type);
        String result = JSON.toJSONString(item);
        resp.setContentType("text/json");
        PrintWriter out = resp.getWriter();
        out.println(result);
    }
}
