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

/**
 *
 * @author phoan
 */
public class FoodDao {
    private Connection con;
    Database instance;

    public FoodDao() {
            instance = Database.getInstance();
            con = instance.getCon();
    }
    
    public ArrayList<Food> getFoodByShop(int ShopID){
        String query = "select * from Food where ShopID = ?";
        ArrayList<Food> foods = new ArrayList<>();
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, ShopID);
            ResultSet rs = st.executeQuery();
            while(rs.next())
                foods.add(new Food(rs.getString("Foodname"), rs.getString("FoodImage"), rs.getInt("FoodID"), rs.getInt("ShopID"), rs.getInt("CateID"), rs.getDouble("Price")));
        } catch (SQLException ex) {
            Logger.getLogger(Food.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return foods;
    }
    
    public Food getFoodByID(int id){
        String query = "select * from Food where FoodID = ?";
        Food food = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                food = new Food(rs.getString("Foodname"), rs.getString("FoodImage"), rs.getInt("FoodID"), rs.getInt("ShopID"), rs.getInt("CateID"), rs.getDouble("Price"));
        } catch (SQLException ex) {
            Logger.getLogger(Food.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return food;
    }
    
    public List<Food> get5RandomItems() {
        String sql = "select top 5 * from Food order by newid()";
        List<Food> ffl = null;
        try {
            PreparedStatement pstm = con.prepareCall(sql);
            ffl = new ArrayList<>();
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int fId = rs.getInt(2);
                int sId = rs.getInt(1);
                int cId = rs.getInt(3);
                int p = rs.getInt(4);
                String fIm = rs.getString(5);
                String fN = rs.getString(6);
                ffl.add(new Food(fN, fIm, fId, sId, cId, p));
            }
            return ffl;
        } catch (SQLException e) {
        }
        return null;
    }
    
    public List<Food> get5NewItems() {
        String sql = "select top 5 * from Food order by foodid desc";
        List<Food> nfl = null;
        try {
            PreparedStatement pstm = con.prepareCall(sql);
            nfl = new ArrayList<>();
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int fId = rs.getInt(2);
                int sId = rs.getInt(1);
                int cId = rs.getInt(3);
                int p = rs.getInt(4);
                String fIm = rs.getString(5);
                String fN = rs.getString(6);
                nfl.add(new Food(fN, fIm, fId, sId, cId, p));
            }
            return nfl;
        } catch (SQLException e) {
        }
        return null;
    }
}
