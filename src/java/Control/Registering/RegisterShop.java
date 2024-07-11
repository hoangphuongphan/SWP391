/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Registering;

import Control.Generator;
import Dao.AccountsDao;
import Dao.ShopDao;
import Dao.UserDao;
import Dao.WalletDao;
import Model.Account;
import Model.Shop;
import Model.User;
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
public class RegisterShop extends HttpServlet {

     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(((String)session.getAttribute("OTP")).equals(req.getParameter("trueOTP")) ){
//        AccountsDao Adao = new AccountsDao();
//        UserDao Udao = new UserDao();
//        Account acc = new Account((String) session.getAttribute("username"), (String) session.getAttribute("password"), "User");
//        User user = new User(acc.getUsername(), acc.getPassword(), (String) session.getAttribute("email"), (String) session.getAttribute("phone"), Generator.getInstance().getNewDisplayName());
//        Adao.Create(acc, "User");
//        acc = Adao.getAccountByUsername(acc.getUsername());
//        Udao.Create(user, acc.getAccountID());
            AccountsDao aDao = new AccountsDao();
            ShopDao sDao = new ShopDao();
            WalletDao wDao = new WalletDao();
            Account acc = new Account((String) session.getAttribute("username"), (String) session.getAttribute("password"), "Shop");
            aDao.Create(acc, "Shop");
            Shop shop = new Shop((String) session.getAttribute("location"), (String) session.getAttribute("phone"), (String) session.getAttribute("email"),
                    (String) session.getAttribute("username"), (String) session.getAttribute("password"), "Shop");
            sDao.CreateShop(shop);
            wDao.CreateWallet(sDao.getShopByUsername(acc.getUsername()).getShopID(), "Shop");
            
        }
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.removeAttribute("email");
        session.removeAttribute("phone");
        session.removeAttribute("OTP");
        session.removeAttribute("location");
        resp.sendRedirect("Login/Login.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
