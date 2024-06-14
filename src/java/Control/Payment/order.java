/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Payment;

import Dao.OrderDao;
import Dao.WalletDao;
import Model.Cart;
import Model.CurrentUser;
import Model.Wallet;
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
public class order extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDao dao = new OrderDao();
        Wallet wallet = Wallet.getInstance(CurrentUser.getCurrent(req.getSession()).getID());
        int amount = Integer.parseInt(req.getParameter("total"));
        wallet.add(amount*-1);
        new WalletDao().UpdateAmount(CurrentUser.getCurrent(req.getSession()).getID());
        dao.createOrder(CurrentUser.getCurrent(req.getSession()), "Ha noi");
        Cart.getInstance().DeleteCart();
        resp.sendRedirect("/SWP391/ShowOrders");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
