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
    
    public ArrayList<Food> searchFood(String search){
        String query = "select * from Food where Foodname like ? and Status = 1";
        ArrayList<Food> foods = new ArrayList<>();
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, "%"+search+"%");
            ResultSet rs = st.executeQuery();
            while(rs.next())
                foods.add(new Food(rs.getString("Foodname"), rs.getString("FoodImage"), rs.getInt("FoodID"), rs.getInt("ShopID"), rs.getInt("CateID"), rs.getDouble("Price")));
        } catch (SQLException ex) {
            Logger.getLogger(Food.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return foods;
    }
    
    public ArrayList<Food> searchFoodByCate(int CateID){
        String query = "select * from Food where CateID = ? and Status = 1";
        ArrayList<Food> foods = new ArrayList<>();
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, CateID);
            ResultSet rs = st.executeQuery();
            while(rs.next())
                foods.add(new Food(rs.getString("Foodname"), rs.getString("FoodImage"), rs.getInt("FoodID"), rs.getInt("ShopID"), rs.getInt("CateID"), rs.getDouble("Price")));
        } catch (SQLException ex) {
            Logger.getLogger(Food.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return foods;
    }
    
    public ArrayList<Food> getFoodByShop(int ShopID){
        String query = "select * from Food where ShopID = ? AND Status = 1";
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
    
    public void createFood(Food food){
        String query = "insert into Food(ShopID,CateID,Price,FoodImage,Foodname) values (?,?,?,?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, food.getShopID());
            st.setInt(2, food.getCateID());
            st.setDouble(3, food.getPrice());
            st.setString(4, food.getImgurl());
            st.setString(5, food.getName());
            st.setInt(6, 1);
            st.execute();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteFood(int FoodID){
        String query = "Update Food set Status = 2 where FoodID = ?";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, FoodID);
            st.execute();
        }catch (SQLException ex) {
            Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void updateRate(Food oldFood, Food newFood){
        String query = "Update RateFood set FoodID = ? where FoodID = ?";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, newFood.getID());
            st.setInt(2, oldFood.getID());
            st.execute();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void updateReview(Food oldFood, Food newFood){
        String query = "Update Review set FoodID = ? where FoodID = ?";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, newFood.getID());
            st.setInt(2, oldFood.getID());
            st.execute();
        } catch (SQLException ex) {
            Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private Food getUpdatedFood(Food food){
        String query = "select * from Food where ShopID = ? and CateID = ? and Price = ? and  Foodname = ? and Status = 1";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, food.getShopID());
            st.setInt(2, food.getCateID());
            st.setDouble(3, food.getPrice());
            st.setString(4, food.getName());
            ResultSet rs = st.executeQuery();
            if(rs.next())
            return new Food(rs.getString("Foodname"), rs.getString("FoodImage"), rs.getInt("FoodID"), rs.getInt("ShopID"), rs.getInt("CateID"), rs.getDouble("Price"));
        } catch (SQLException ex) {
            Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void updateFood(Food food){
        deleteFood(food.getID());
        String query = "Insert into Food(ShopID,CateID,Price,FoodImage,Foodname,Status) values (?,?,?,?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, food.getShopID());
            st.setInt(2, food.getCateID());
            st.setDouble(3, food.getPrice());
            st.setString(4, food.getImgurl());
            st.setString(5, food.getName());
            st.setInt(6, 1);
            st.execute();
        }catch (SQLException ex) {
            Logger.getLogger(FoodDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        Food newFood = getUpdatedFood(food);
        updateRate(food, newFood);
        updateReview(food, newFood);
    }
}
