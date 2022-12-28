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
import java.util.List;

public class ProductInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        CatalogService catalogService = new CatalogService();
        resp.setContentType("text/json");
        List<Item> items = catalogService.getItemListByProduct(productId);
        String result = JSON.toJSONString(items);
        PrintWriter out = resp.getWriter();
        out.println(result);
    }
}
