/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.ChangeUsrInfo;

import Dao.ShipperDao;
import Dao.ShopDao;
import Model.Shipper;
import Model.Shop;
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
public class BanShipper extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int ShopID = Integer.parseInt(req.getParameter("ShipID"));
        String action = req.getParameter("action");
        ShipperDao dao = new ShipperDao();
        Shipper ship = dao.getShipperByID(ShopID);
        if(action.equals("ban")){
            ship.setStaus(3);
        }else{
            ship.setStaus(2);
        }
        dao.updateShipper(ship);
        resp.sendRedirect("Admin/Shippers.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
