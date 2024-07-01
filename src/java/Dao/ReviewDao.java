/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Rate;
import Model.Review;
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
public class ReviewDao {
    private Connection con;
    Database instance;

    public ReviewDao() {
        instance = Database.getInstance();
        con = instance.getCon();
    }
    
    public Review getReviewByRate(int RateID){
        String query = "select * from Review where RateID = ?";
        Review rv = null;
        try{
            PreparedStatement pre = con.prepareStatement(query);
            pre.setInt(1, RateID);
            ResultSet rs = pre.executeQuery();
            if(rs.next())
                rv = new Review(rs.getInt("ReviewID"), rs.getInt("FoodID"), rs.getInt("UserID"), RateID, rs.getString("content"));
        } catch (SQLException ex) {
            Logger.getLogger(ReviewDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rv;
    }
    
    public boolean createReview(Review review){
        String query = "insert into Review values(?,?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, review.getFood().getID());
            st.setInt(2, review.getUser().getID());
            st.setInt(3, review.getRate().getRateID());
            st.setString(4, review.getContent());
            return st.execute();
        }catch (SQLException ex) {
            Logger.getLogger(ReviewDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
