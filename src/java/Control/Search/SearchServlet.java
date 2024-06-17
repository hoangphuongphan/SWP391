package Control.Search;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Dao.FoodDao; // Import FoodDao
import Dao.FoodSearchDao;
import Model.Food; // Import Food

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tham số query và category từ request
        String query = request.getParameter("query");
        String category = request.getParameter("category");
        
        // Gọi phương thức tìm kiếm từ FoodDao
        FoodSearchDao foodDao = new FoodSearchDao();
        List<Food> searchResults;
        if (query != null && !query.isEmpty() && category != null && !category.isEmpty()) {
            // Nếu cả hai tham số query và category đều có
            searchResults = foodDao.searchFoodByNameAndCategory(query, Integer.parseInt(category));
        } else if (query != null && !query.isEmpty()) {
            // Nếu chỉ có tham số query
            searchResults = foodDao.searchFoodByName(query);
        } else if (category != null && !category.isEmpty()) {
            // Nếu chỉ có tham số category
            searchResults = foodDao.searchFoodByCategory(Integer.parseInt(category));
        } else {
            // Nếu không có tham số nào được truyền
            searchResults = null;
        }
        
        // Chuyển hướng đến trang hiển thị kết quả tìm kiếm
        request.setAttribute("searchResults", searchResults);
        request.getRequestDispatcher("searchResults.jsp").forward(request, response);
    }
}
