/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.LoggingIn;

import Dao.AccountsDao;
import Dao.FoodDao;
import Dao.ShipperDao;
import Dao.ShopDao;
import Dao.UserDao;
import Model.Account;
import Model.Cart;
import Model.CurrentShipper;
import Model.CurrentShop;
import Model.CurrentUser;
import Model.Food;
import Model.Shipper;
import Model.Shop;
import Model.User;
import Model.Wallet;
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
        Account acc = new AccountsDao().getAccountByUsername(username);
        if(acc!= null && password.equals(acc.getPassword())){
            HttpSession session = req.getSession(true);
            switch (acc.getType()) {
                case 1:
                    User user = new UserDao().getUserByUsername(username);
                    CurrentUser.initialize(user);
                    session.setAttribute("currentUser", user);
                    Cart.getInstance();
                    Wallet.initialize(user.getID(), "User");
                    Cart.getInstance().Add(1, 4);
                    Cart.getInstance().Add(2, 3);
                    req.getRequestDispatcher("ShowHome").forward(req, resp);
                    break;
                case 2:
                    Shop shop = new ShopDao().getShopByUsername(username);
                    session.setAttribute("currentShop", shop);
                    Wallet.initialize(shop.getShopID(), "Shop");
                    CurrentShop.initialize(shop);
                    req.getRequestDispatcher("ShowShopHome").forward(req, resp);
                    break;
                case 3:
                    Shipper ship = new ShipperDao().getShipperByUsername(username);
                    session.setAttribute("currentShipper", ship);
                    CurrentShipper.initialize(ship);
                    Wallet.initialize(ship.getID(), "Shipper");
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
