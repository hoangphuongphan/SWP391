/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Forgetting;

import Control.Generator;
import Model.Email;
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
public class SendOTPForget extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String OTP = Generator.getInstance().getOTP();
        Email mail = new Email(req.getParameter("email"), "Your OTP is " + OTP, "Authentication");
        mail.run();
        HttpSession session = req.getSession(true);
        session.setAttribute("email", req.getParameter("email"));
        session.setAttribute("trueOTP", OTP);
        resp.sendRedirect("Login/ForgetVerify.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
