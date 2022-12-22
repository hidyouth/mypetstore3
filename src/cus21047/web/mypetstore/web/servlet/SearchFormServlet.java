package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Product;
import cus21047.web.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class SearchFormServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CatalogService catalogService = new CatalogService();
        String keyword = req.getParameter("keyword");
        List<Product> products = catalogService.searchProductList(keyword);
        HttpSession session = req.getSession();
        session.setAttribute("searchproduct",products);

    }
}
