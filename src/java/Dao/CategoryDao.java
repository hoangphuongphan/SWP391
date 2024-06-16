/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Category;

public class CategoryDao {
    private Connection con;
    Database instance;

    public CategoryDao() {
        instance = Database.getInstance();
        con = instance.getCon();
    }
    
    // Phương thức để lấy danh sách loại món ăn từ cơ sở dữ liệu
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String query = "SELECT CateName FROM Category";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String cateName = rs.getString("CateName");
                Category category = new Category(cateName); // Tạo đối tượng Category từ dữ liệu trong ResultSet
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
}
