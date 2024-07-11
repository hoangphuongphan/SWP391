/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Registering;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author phoan
 */
public class ConfirmShopEmail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        session.setAttribute("username", req.getParameter("username"));
        session.setAttribute("password", req.getParameter("password"));
        session.setAttribute("email", req.getParameter("email"));
        session.setAttribute("phone", req.getParameter("phone"));
        session.setAttribute("location", req.getParameter("location"));
        if(req.getParameter("location").equals("empty"))
            resp.sendRedirect("Login/ShopRegister.jsp");
        req.getRequestDispatcher("SendOTPShop").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
