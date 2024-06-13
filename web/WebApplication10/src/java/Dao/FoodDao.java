/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Dao;

import Model.Food;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FoodDao {
    private Connection con;
    Database instance;

    public FoodDao() {
        instance = Database.getInstance();
        con = instance.getCon();
    }

    public Food getFoodByID(int id) {
        String query = "SELECT * FROM Food WHERE FoodID = ?";
        Food food = null;
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                food = new Food(
                        rs.getString("Name"), // Đảm bảo rằng tên cột trong cơ sở dữ liệu khớp với tên cột bạn đang lấy
                        rs.getString("FoodImage"),
                        rs.getInt("FoodID"),
                        rs.getInt("ShopID"),
                        rs.getInt("CateID"),
                        rs.getDouble("Price")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return food;
    }

    // Tìm kiếm thức ăn theo tên
    public List<Food> searchFoodByName(String name) {
        String query = "SELECT * FROM Food WHERE Name LIKE ?";
        List<Food> foodList = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, "%" + name + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Food food = new Food(
                        rs.getString("Name"),
                        rs.getString("FoodImage"),
                        rs.getInt("FoodID"),
                        rs.getInt("ShopID"),
                        rs.getInt("CateID"),
                        rs.getDouble("Price")
                );
                foodList.add(food);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return foodList;
    }

    // Tìm kiếm thức ăn theo loại
    public List<Food> searchFoodByCategory(int cateID) {
        String query = "SELECT * FROM Food WHERE CateID = ?";
        List<Food> foodList = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, cateID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Food food = new Food(
                        rs.getString("Name"),
                        rs.getString("FoodImage"),
                        rs.getInt("FoodID"),
                        rs.getInt("ShopID"),
                        rs.getInt("CateID"),
                        rs.getDouble("Price")
                );
                foodList.add(food);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return foodList;
    }
    public List<Food> searchFoodByNameAndCategory(String name, int cateID) {
    String query = "SELECT * FROM Food WHERE Name LIKE ? AND CateID = ?";
    List<Food> foodList = new ArrayList<>();
    try {
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, "%" + name + "%");
        st.setInt(2, cateID);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Food food = new Food(
                    rs.getString("Name"),
                    rs.getString("FoodImage"),
                    rs.getInt("FoodID"),
                    rs.getInt("ShopID"),
                    rs.getInt("CateID"),
                    rs.getDouble("Price")
            );
            foodList.add(food);
        }
    } catch (SQLException ex) {
        Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return foodList;
}
}
