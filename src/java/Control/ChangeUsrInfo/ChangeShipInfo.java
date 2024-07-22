/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.ChangeUsrInfo;

import Dao.ShipperDao;
import Dao.UserDao;
import Model.CurrentShipper;
import Model.Shipper;
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
public class ChangeShipInfo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String displayName = request.getParameter("displayName");
        String phone = request.getParameter("phone");
        String vehicleId = request.getParameter("VehicleID");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        ShipperDao dao = new ShipperDao();
        Shipper current = CurrentShipper.getInstance();
        current.setName(displayName);
        current.setPhone(phone);
        current.setVehicleID(vehicleId);
        dao.updateShipper(null);
        response.sendRedirect("Shipper/Home.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
