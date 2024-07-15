/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.LoggingIn;

import Dao.AccountsDao;
import Dao.AdminDao;
import Dao.FoodDao;
import Dao.ShipperDao;
import Dao.ShopDao;
import Dao.UserDao;
import Model.Account;
import Model.Admin;
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
        AdminDao dao = new AdminDao();
        Admin admin = dao.getAdminByCode(username);
        if(admin!=null){
            HttpSession session = req.getSession(true);
            resp.sendRedirect("Admin/Dashboard.jsp");
            session.setAttribute("Admin", true);
        }
        if(acc!= null && password.equals(acc.getPassword())){
            HttpSession session = req.getSession(true);
            switch (acc.getType()) {
                case 1:
                    User user = new UserDao().getUserByUsername(username);
                    if(user.getStatus()==1){
                        CurrentUser.initialize(user);
                        session.setAttribute("currentUser", user);
                        Cart.getInstance();
                        Wallet.initialize(user.getID(), "User");
                        Cart.getInstance().Add(1, 4);
                        Cart.getInstance().Add(2, 3);
                        req.getRequestDispatcher("ShowHome").forward(req, resp);
                    }else
                        resp.sendRedirect("/SWP391/Error.jsp?Error=Banned");
                    break;
                case 2:
                    Shop shop = new ShopDao().getShopByUsername(username);
                    if(shop.getStatus()<3){
                        session.setAttribute("currentShop", shop);
                        Wallet.initialize(shop.getShopID(), "Shop");
                        CurrentShop.initialize(shop);
                        req.getRequestDispatcher("ShowShopHome").forward(req, resp);
                    }else
                        resp.sendRedirect("/SWP391/Error.jsp?Error=Banned");
                    break;
                case 3:
                    Shipper ship = new ShipperDao().getShipperByUsername(username);
                    if(ship.getStaus()<3){
                        session.setAttribute("currentShipper", ship);
                        CurrentShipper.initialize(ship);
                        Wallet.initialize(ship.getID(), "Shipper");
                        req.getRequestDispatcher("ShowShipperHome").forward(req, resp);
                    }else
                        resp.sendRedirect("/SWP391/Error.jsp?Error=Banned");
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
