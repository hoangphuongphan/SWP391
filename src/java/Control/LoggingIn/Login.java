/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.LoggingIn;

import Dao.FoodDao;
import Dao.UsersAct;
import Model.Cart;
import Model.CurrentUser;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author phoan
 */
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = new UsersAct().getUserByUsername(username);
        FoodDao dao = new FoodDao();
        if(user!= null && password.equals(user.getPassword())){
            HttpSession session = req.getSession(true);
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            session.setAttribute("currentUser", CurrentUser.getCurrent(session));
            Cart cart = Cart.getInstance();
            cart.Add(dao.getFoodByID(1), 1);
            req.getRequestDispatcher("ShowHome").forward(req, resp);
        }else
            resp.sendRedirect("Login/Login.jsp");   
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);  
    }
}
