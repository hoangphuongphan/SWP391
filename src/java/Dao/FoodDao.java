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
}
