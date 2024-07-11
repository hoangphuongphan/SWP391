/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Support;

import Dao.ReportDao;
import Model.CurrentUser;
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
public class ReportShipper extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int ShipID = Integer.parseInt(req.getParameter("ShipID"));
        String content = req.getParameter("content");
        ReportDao dao = new ReportDao();
        dao.addShipperReport(CurrentUser.getCurrent().getID(), ShipID, content);
        resp.sendRedirect("Home/Shipper.jsp?ShipperID="+ShipID);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
