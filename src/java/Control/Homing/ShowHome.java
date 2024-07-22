/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.Homing;

import Dao.FoodDao;
import Dao.ShopDao;
import Model.Food;
import Model.MenuFood;
import Model.Shop;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author phoan
 */
public class ShowHome extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FoodDao fa = new FoodDao();
        ShopDao sd = new ShopDao();
        List<MenuFood> nfl = fa.get5NewItems();
        List<MenuFood> ffl = fa.get5RandomItems();
        List<MenuFood> hrl = fa.getHighRatingsFood();
        List<MenuFood> all = fa.getAll();
        List<Shop> asl = sd.get5Shops();
        req.setAttribute("nfl", nfl);
        req.setAttribute("ffl", ffl);
        req.setAttribute("hrl", hrl);
        req.setAttribute("all", all);
        req.getRequestDispatcher("Home/menu.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
