/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Account;
import Model.Rate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phoan
 */
public class RateDao {
    private Connection con;
    Database instance;

    public RateDao() {
            instance = Database.getInstance();
            con = instance.getCon();
    }
    
    public ArrayList<Rate> getRateByFood(int FoodID){
        String query = "select * from RateFood where FoodID = ?";
        ArrayList<Rate> rates = new ArrayList<>();
        try{
            PreparedStatement pre = con.prepareStatement(query);
            pre.setInt(1, FoodID);
            ResultSet rs = pre.executeQuery();
            while(rs.next())
                rates.add(new Rate(rs.getInt("RateID"), rs.getInt("FoodID"), rs.getInt("UserID"), rs.getInt("Rate")));
        } catch (SQLException ex) {
            Logger.getLogger(RateDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rates;
    }
    
    public Rate getRateByID(int RateID){
        String query = "select * from RateFood where RateID = ?";
        Rate rate = null;
        try{
            PreparedStatement pre = con.prepareStatement(query);
            pre.setInt(1, RateID);
            ResultSet rs = pre.executeQuery();
            if(rs.next())
                rate = new Rate(rs.getInt("RateID"), rs.getInt("FoodID"), rs.getInt("UserID"), rs.getInt("Rate"));
        } catch (SQLException ex) {
            Logger.getLogger(RateDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rate;
    }
    
    public boolean createRate (Rate rate){
        String query = "insert into RateFood values(?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, rate.getFood().getID());
            st.setInt(2, rate.getUser().getID());
            st.setInt(3, rate.getRate());
            return st.execute();
        }catch (SQLException ex) {
            Logger.getLogger(RateDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public Rate getLatestRate(int FoodID, int UserID){
       String query = "select * from RateFood where FoodID = ? AND UserID = ? order by RateID desc";
        Rate rate = null;
        try{
            PreparedStatement pre = con.prepareStatement(query);
            pre.setInt(1, FoodID);
            pre.setInt(2, UserID);
            ResultSet rs = pre.executeQuery();
            if(rs.next())
                rate = new Rate(rs.getInt("RateID"), rs.getInt("FoodID"), rs.getInt("UserID"), rs.getInt("Rate"));
        } catch (SQLException ex) {
            Logger.getLogger(RateDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rate;
    }
}
