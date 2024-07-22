/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.ChangeUsrInfo;

import Dao.AccountsDao;
import Model.Account;
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
public class UpdatePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String oldP = req.getParameter("oldPassword");
        String newP = req.getParameter("newPassword");
        Account acc;
        String returnPage = "";
        if(session.getAttribute("currentUser")!=null){
            acc = (Account) session.getAttribute("currentUser");
            returnPage = "/SWP391/Home/menu.jsp";
        }else if (session.getAttribute("currentShop")!=null){
            acc = (Account) session.getAttribute("currentShop");
            returnPage = "/SWP391/Shop/Home.jsp";
        }else{
            acc = (Account) session.getAttribute("currentShipper");
            returnPage = "/SWP391/Shipper/Home.jsp";
        }
        if(oldP.equals(acc.getPassword())){
            acc.setPassword(newP);
            new AccountsDao().UpdateAccount(acc);
        }
        resp.sendRedirect(returnPage);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
