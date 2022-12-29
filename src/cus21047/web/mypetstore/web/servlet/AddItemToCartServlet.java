package cus21047.web.mypetstore.web.servlet;

import cus21047.web.mypetstore.domain.Account;
import cus21047.web.mypetstore.domain.Cart;
import cus21047.web.mypetstore.domain.Item;
import cus21047.web.mypetstore.persistence.ItemDao;
import cus21047.web.mypetstore.persistence.RecordDao;
import cus21047.web.mypetstore.persistence.impl.ItemDaoImpl;
import cus21047.web.mypetstore.persistence.impl.RecordDaoImpl;
import cus21047.web.mypetstore.service.CartService;
import cus21047.web.mypetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AddItemToCartServlet extends HttpServlet {
    private static final String CART_FORM = "/WEB-INF/jsp/cart/cart.jsp";
    private static final String ITEM_FORM = "/WEB-INF/jsp/catalog/item.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String workingItemId = req.getParameter("workingItemId");
        CartService cartService = new CartService();
        ItemDao itemDao = new ItemDaoImpl();
        HttpSession session = req.getSession();
        Account loginAccount = (Account) session.getAttribute("loginAccount");


        if(loginAccount == null){
            resp.setContentType("text/plain");
            PrintWriter out = resp.getWriter();
            out.print("No Login");
        }else{
            /*HttpSession session = req.getSession();
            session.setAttribute("loginAccount",loginAccount);*/
            String username = loginAccount.getUsername();
            Cart cart = cartService.getCart(workingItemId,username);
            Item item = itemDao.getItem(workingItemId);
            String productId = item.getProduct().getName();
            String desc = item.getProduct().getDescription();
            BigDecimal listprice = item.getListPrice();
            BigDecimal total_cost = item.getListPrice();
            String productid = item.getProduct().getProductId();
            //如果购物车中没有这个商品，就加到购物车中
            if(cart == null){
                cartService.addCart(workingItemId,desc,username,productId,listprice,total_cost,productid);
                RecordDao userService = new RecordDaoImpl();
                SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
                Date date = new Date(System.currentTimeMillis());
                userService.InsertToRecord(loginAccount.getUsername(),"加入购物车"+workingItemId+" -----------------------------"+formatter.format(date),0);
                resp.setContentType("text/plain");
                PrintWriter out = resp.getWriter();
                out.print("success");
            }else{
                resp.setContentType("text/plain");
                PrintWriter out = resp.getWriter();
                out.print("Exist");
            }
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

//        if(cart == null){
//            cart = new Cart();
//        }
//
//        if (cart.containsItemId(workingItemId)) {
//            cart.incrementQuantityByItemId(workingItemId);
//        } else {
//            CatalogService catalogService = new CatalogService();
//            boolean isInStock = catalogService.isItemInStock(workingItemId);
//            Item item = catalogService.getItem(workingItemId);
//            cart.addItem(item, isInStock);
//        }
//
//        session.setAttribute("cart", cart);
        //req.getRequestDispatcher(CART_FORM).forward(req, resp);
}

