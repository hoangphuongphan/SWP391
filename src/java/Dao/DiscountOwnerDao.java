/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Discount;
import Model.DiscountOwner;
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
public class DiscountOwnerDao {
    private Connection con;
    Database instance;

    public DiscountOwnerDao() {
            instance = Database.getInstance();
            con = instance.getCon();
    }
    
    public DiscountOwner getDiscountOwner(int id){
        String query = "select * from Food where UserID = ?";
        DiscountOwner dis = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                dis = new DiscountOwner(new UsersAct().getUserByID(id), new DiscountDao().getDiscountByID(rs.getInt("DiscountID")));
        } catch (SQLException ex) {
            Logger.getLogger(DiscountDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return dis;
    }
}
