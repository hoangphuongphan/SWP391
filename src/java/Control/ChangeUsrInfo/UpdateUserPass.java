/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.ChangeUsrInfo;

import Dao.AccountsDao;
import Dao.UserDao;
import Model.Account;
import Model.CurrentUser;
import Model.User;
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
public class UpdateUserPass extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oldPass = req.getParameter("oldPass");
        String newPass = req.getParameter("newPass");
        User current = CurrentUser.getCurrent();
        AccountsDao dao = new AccountsDao();
        Account acc = dao.getAccountByUsername((String) req.getSession().getAttribute("username"));
        acc.setPassword(newPass);
        if(oldPass.equals(current.getPassword())){
            dao.UpdateAccount(acc);
        }
        resp.sendRedirect("/SWP391/Home/profile.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
