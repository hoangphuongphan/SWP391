/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control.FoodCRUD;

import Dao.FoodDao;
import Dao.ShopDao;
import Model.Food;
import Model.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;

/**
 *
 * @author phoan
 */
@MultipartConfig(maxFileSize = 1024*1024*10, maxRequestSize = 1024*1024*50)
public class ChangeFoodInfo extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            HttpSession session = req.getSession();
            FoodDao dao = new FoodDao();
            Shop shop = (Shop) session.getAttribute("currentShop");
            Food food = dao.getFoodByID(Integer.parseInt(req.getParameter("FoodID")));
            String img = food.getImgurl();
            Part part = req.getPart("myPhoto");
            String realPath = "C:\\FU\\SWP391\\SWP391\\web\\Shop\\FoodImage";
            String filename = Path.of(part.getSubmittedFileName()).toString().toString();
            if(part.getSize()!=0){
                if(!Files.exists(Path.of(realPath))){
                    Files.createDirectories(Path.of(realPath));
                }
                part.write(realPath + "/"+filename);
                img = "FoodImage"+ "\\"+filename;
            }
            food.setName(req.getParameter("Name"));
            food.setImgurl(img);
            food.setPrice(Double.parseDouble(req.getParameter("Price")));
            food.setCateID(Integer.parseInt(req.getParameter("Category")));
            dao.updateFood(food);
            resp.sendRedirect("Shop/Profile.jsp");
        }catch(Exception e){
            resp.getWriter().print(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
