/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Payment;

import Dao.OrderDao;
import Dao.ShipperDao;
import Model.CurrentShipper;
import Model.Order;
import Model.Shipper;
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
public class shipperDone extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderID = Integer.parseInt(req.getParameter("orderID"));
        Order order = new OrderDao().getOrderByID(orderID);
        order.setStatus("Done");
        new OrderDao().updateOrder(order);
        Shipper current = CurrentShipper.getInstance();
        current.setStaus(1);
        new ShipperDao().updateShipper(current);
        resp.sendRedirect("Shipper/Home.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
