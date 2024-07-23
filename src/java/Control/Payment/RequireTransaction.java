/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Payment;

import Dao.OrderDao;
import Dao.WalletDao;
import Model.Order;
import Model.Wallet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author phoan
 */
public class RequireTransaction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        OrderDao dao = new OrderDao();
        WalletDao wdao = new WalletDao();
        Order order = dao.getOrderByID(Integer.parseInt(req.getParameter("orderID")));
        
        //handle transaction
        int amount = (int) Math.round((double)((order.getTotal() * 95) / 100));
        int ship = (int) Math.round((double)((order.getTotal() * 2) / 100));
        Wallet shopWallet = wdao.getWalletByID(order.getShop().getShopID(), "Shop");
        Wallet shipWallet = wdao.getWalletByID(order.getShipper().getID(), "Shipper");
        Wallet adminBank = wdao.getWalletByID(0, "admin");
        shopWallet.add(amount);
        shipWallet.add(ship);
        adminBank.add((amount*-1)+(ship*-1));
        wdao.UpdateAmount(0, "admin", adminBank);
        wdao.UpdateAmount(shipWallet.getUserID(), "Shipper", shipWallet);
        wdao.UpdateAmount(shopWallet.getUserID(), "Shop", shopWallet);
        
        
        //delete needed transaction order
        ArrayList<Order> list = (ArrayList<Order>) session.getAttribute("CurrentOrders");
        list.remove(order);
        session.setAttribute("CurrentOrders", list);
        resp.sendRedirect("Home/Order.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
