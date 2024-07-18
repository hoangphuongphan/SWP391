/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Payment;

import Control.StatusChecking;
import Dao.OrderDao;
import Dao.ShipperDao;
import Dao.WalletDao;
import Model.Cart;
import Model.CurrentUser;
import Model.Order;
import Model.Shop;
import Model.User;
import Model.Wallet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author phoan
 */
public class order extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            HttpSession session = req.getSession();
        User current = (User) session.getAttribute("currentUser");
        OrderDao dao = new OrderDao();
        WalletDao wDao = new WalletDao();
        Wallet wallet = Wallet.getInstance();
        HashMap<Integer,HashMap<Integer,Integer>> bills = BillSplit.SplitBill();
        int amount = Integer.parseInt(req.getParameter("total"));
        String location = req.getParameter("location");
        ArrayList<Integer> unavails = StatusChecking.unavilShops(bills);
        if(location.length() < 5)
            resp.sendRedirect("/SWP391/Home/Cart.jsp?error=Location is empty");
        else if(amount < wallet.getAmount()){
            if(unavails.size()<1){
                for(HashMap.Entry<Integer,HashMap<Integer,Integer>> bill : bills.entrySet()){
                    dao.createOrder(location, bill.getKey(),bill.getValue(), new ShipperDao().getBestFreeShipper());
                }
                wallet.add(amount*-1);
                wDao.UpdateAmount(-1,"User",null);
                Wallet wallet2 = wDao.getWalletByID(0, "admin");
                wallet2.add(amount);
                wDao.UpdateAmount(0, "admin", wallet2);
                Cart.getInstance().DeleteCart();
                Wallet.initialize(current.getID(), "User");
            }else{
                resp.sendRedirect("/SWP391/Home/Cart.jsp?error=There are shops not available");
            }
        }else{
            resp.sendRedirect("/SWP391/Home/Cart.jsp?error=Wallet not having enough");
        }
        session.setAttribute("CurrentOrders", new OrderDao().getLatest(current.getID(), "User", bills.size()));
        resp.sendRedirect("/SWP391/ShowOrders");
        }catch (Exception ex) {
            resp.sendRedirect("/SWP391/Error.jsp?error=CannotOrder");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
