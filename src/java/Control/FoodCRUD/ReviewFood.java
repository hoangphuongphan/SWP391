/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.FoodCRUD;

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
public class ReviewFood extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int FoodID = Integer.parseInt(req.getParameter("FoodID"));
        int UserID = Integer.parseInt(req.getParameter("UserID"));
        int RateID = Integer.parseInt(req.getParameter("RateID"));
        String content = req.getParameter("content");
        resp.sendRedirect("/SWP391/Home/Food.jsp?FoodID="+FoodID);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
