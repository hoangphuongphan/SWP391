/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Cart;

import Model.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;

/**
 *
 * @author phoan
 */
public class AdjustAmount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int FoodID = Integer.parseInt(req.getParameter("FoodID"));
        int amount = Integer.parseInt(req.getParameter("amount"));
        Cart cart = Cart.getInstance();
        int addedAmount = amount - Cart.getCart().get(FoodID);
        if(addedAmount+Cart.getCart().get(FoodID)>=0)
            cart.Add(FoodID, addedAmount);
        if(Cart.getCart().get(FoodID)==0)
            Cart.getInstance().Delete(FoodID);
        resp.sendRedirect("Home/Cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
