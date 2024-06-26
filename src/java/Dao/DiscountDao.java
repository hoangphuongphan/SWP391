/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Discount;
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
public class DiscountDao {
    private Connection con;
    Database instance;

    public DiscountDao() {
            instance = Database.getInstance();
            con = instance.getCon();
    }
    
    public ArrayList<Discount> getDiscountByUserID(int id){
        String query = "select * from Discount as A join DiscountOwner as B on A.DiscountID = B.DiscountID where UserID = ?";
        ArrayList<Discount> list = new ArrayList<>();
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next())
                list.add(new Discount(rs.getInt("DiscountID"), rs.getString("DiscountName"), rs.getString("offer"), rs.getDate("ValidDate"), rs.getDate("ExpiredDate"),rs.getInt("stock")));
        } catch (SQLException ex) {
            Logger.getLogger(Discount.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return list;
    }
    
    public Discount getDiscountByID(int id){
        String query = "select * from Discount as A join DiscountOwner as B on A.DiscountID = B.DiscountID where A.DiscountID = ?";
        
        Discount dis = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                dis = new Discount(rs.getInt("DiscountID"), rs.getString("DiscountName"), rs.getString("Offer"), rs.getDate("ValidDate"), rs.getDate("ExpiredDate"), rs.getInt("stock"));
        } catch (SQLException ex) {
            Logger.getLogger(Discount.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return dis;
    }
}
