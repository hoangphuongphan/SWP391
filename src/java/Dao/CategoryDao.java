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
import Model.Category;

public class CategoryDao {
    private Connection con;
    Database instance;

    public CategoryDao() {
        instance = Database.getInstance();
        con = instance.getCon();
    }
    
    // Phương thức để lấy danh sách loại món ăn từ cơ sở dữ liệu
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> categories = new ArrayList<>();
        String query = "SELECT * FROM Category";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                categories.add(new Category(rs.getInt("CateID"), rs.getString("Name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
    
    public Category getCateByName(String cateName){
        String query = "select * from Category where Name = ?";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, cateName);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                return new Category(rs.getInt("CateID"), cateName);
        }catch(Exception ex){
            
        }
        return null;
    }
}
