package Control.Search;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Dao.CategoryDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Dao.FoodDao; // Import FoodDao
import Dao.ShopDao;
import Model.Food; // Import Food
import Model.Shop;
import java.util.ArrayList;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search-words");
        String cateInput = request.getParameter("category");
        int cate = 0;
        if(cateInput!= null){
            cate = Integer.parseInt(cateInput);
        }
        
        // Gọi phương thức tìm kiếm từ FoodDao
        FoodDao dao = new FoodDao();
        ShopDao sDao = new ShopDao();
        ArrayList<Food> NameSearch = dao.searchFood(search);
        ArrayList<Food> CateSearch = dao.searchFoodByCate(cate);
        ArrayList<Food> searchList;
        ArrayList<Shop> ShopsearchList = sDao.searchShop(search);
        if(search != null &&search.length()>0){
            searchList = NameSearch;
        }else if(cate != 0){
            searchList = CateSearch;
        }else{
            searchList = new ArrayList<>();
            for(Food food : CateSearch){
                if(CateSearch.contains(food))
                    searchList.add(food);
            }
        }
        
        // Chuyển hướng đến trang hiển thị kết quả tìm kiếm
        request.setAttribute("searchResults", searchList);
        request.setAttribute("ShopList", ShopsearchList);
        request.getRequestDispatcher("Home/searchResults.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
    
}
