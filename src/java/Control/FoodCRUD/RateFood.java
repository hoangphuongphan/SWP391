/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.FoodCRUD;

import Dao.RateDao;
import Model.CurrentUser;
import Model.Rate;
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
public class RateFood extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int FoodID = Integer.parseInt(req.getParameter("FoodID"));
        int UserID = CurrentUser.getCurrent().getID();
        int rate = Integer.parseInt(req.getParameter("Rate"));
        Rate newR = new Rate(FoodID, UserID, rate);
        RateDao dao = new RateDao();
        dao.createRate(newR);
        String content = req.getParameter("content");
        if(content.length()>0)
            resp.sendRedirect("/SWP391/ReviewFood?FoodID="+FoodID+"&UserID="+UserID+"&content="+content+"&RateID="+dao.getLatestRate(FoodID, UserID));
        resp.sendRedirect("/SWP391/Home/Food.jsp?FoodID="+FoodID);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
