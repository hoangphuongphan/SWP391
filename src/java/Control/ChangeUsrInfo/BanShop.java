/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.ChangeUsrInfo;

import Dao.ShopDao;
import Model.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author phoan
 */
public class BanShop extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int ShopID = Integer.parseInt(req.getParameter("ShopID"));
        String action = req.getParameter("action");
        ShopDao dao = new ShopDao();
        Shop shop = dao.getShopByID(ShopID);
        if(action.equals("ban")){
            shop.setStatus(3);
        }else{
            shop.setStatus(2);
        }
        dao.UpdateShop(shop);
        resp.sendRedirect("Admin/Shops.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
