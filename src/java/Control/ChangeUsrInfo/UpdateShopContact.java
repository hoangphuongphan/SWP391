/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.ChangeUsrInfo;

import Dao.ShopDao;
import Model.CurrentShop;
import Model.Shop;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
public class UpdateShopContact extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Shop current = CurrentShop.getInstance();
        String email = req.getParameter("Email");
        String phone = req.getParameter("Phone");
        current.setPhone(phone);
        current.setEmail(email);
        ShopDao dao = new ShopDao();
        dao.UpdateShop(current);
        resp.sendRedirect("/SWP391/Shop/Home.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
