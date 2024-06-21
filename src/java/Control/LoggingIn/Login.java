/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.LoggingIn;

import Dao.AccountsAct;
import Dao.FoodDao;
import Dao.ShipperDao;
import Dao.ShopDao;
import Dao.UsersAct;
import Model.Account;
import Model.Cart;
import Model.CurrentUser;
import Model.Food;
import Model.Shipper;
import Model.Shop;
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
        Account acc = new AccountsAct().getAccountByUsername(username);
        if(acc!= null && password.equals(acc.getPassword())){
            HttpSession session = req.getSession(true);
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            switch (acc.getType()) {
                case "User":
                    User user = new UsersAct().getUserByUsername(username);
                    session.setAttribute("currentUser", CurrentUser.getCurrent(session));
                    req.getRequestDispatcher("ShowHome").forward(req, resp);
                    break;
                case "Shop":
                    Shop shop = new ShopDao().getShopByUsername(username);
                    session.setAttribute("currentShop", shop);
                    req.getRequestDispatcher("ShowShopHome").forward(req, resp);
                    break;
                case "Shipper":
                    Shipper ship = new ShipperDao().getShipperByUsername(username);
                    session.setAttribute("currentShipper", ship);
                    req.getRequestDispatcher("ShowShipperHome").forward(req, resp);
                    break;
                default:
                    resp.sendRedirect("Login/Login.jsp");
            }
        }else
            resp.sendRedirect("Login/Login.jsp");   
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);  
    }
}
