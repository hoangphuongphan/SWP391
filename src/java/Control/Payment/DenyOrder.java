/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Payment;

import Dao.FoodDao;
import Dao.OrderDao;
import Dao.UserDao;
import Dao.WalletDao;
import Model.Order;
import Model.Wallet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author phoan
 */
public class DenyOrder extends HttpServlet {
    
    public static void main(String[] args) {
//        OrderDao dao = new OrderDao();
//        Order order = dao.getOrderByID(3);
        Wallet wallet = new WalletDao().getWalletByID(1, "User");
        wallet.add(100000);
        new WalletDao().UpdateAmount(new UserDao().getUserByID(1), wallet);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //return user money and set order status to denied
        int orderID = Integer.parseInt(req.getParameter("orderID"));
        OrderDao dao = new OrderDao();
        dao.deleteOrders(orderID);
        Order order = dao.getOrderByID(orderID);
        Wallet wallet = new WalletDao().getWalletByID(order.getUser().getID(), "User");
        wallet.add(getTotal(order));
        new WalletDao().UpdateAmount(order.getUser(), wallet);
        resp.sendRedirect("Shop/Home.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    private static int getTotal(Order order){
        int total = 0;
        for(HashMap.Entry<Integer,Integer> item : order.getOrder().entrySet()){
            total += (new FoodDao().getFoodByID(item.getKey()).getPrice()*item.getValue());
        }
        return total;
    }

}
