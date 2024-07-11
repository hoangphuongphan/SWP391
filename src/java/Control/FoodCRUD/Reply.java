/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.FoodCRUD;

import Dao.RateDao;
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
public class Reply extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int RateID = Integer.parseInt(req.getParameter("RateID"));
        int FoodID = Integer.parseInt(req.getParameter("FoodID"));
        String reply = req.getParameter("reply");
        RateDao dao = new RateDao();
        dao.replyRate(RateID, reply);
        resp.sendRedirect("Shop/Food.jsp?FoodID="+FoodID);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
