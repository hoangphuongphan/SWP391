/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Shop;
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
public class ShopDao {
    private Connection con;
    Database instance;

    public ShopDao() {
        instance = Database.getInstance();
        con = instance.getCon();
    }
    
    public Shop getShopByUsername(String username) {
        String query = "select * from Shop as A join ShopAccount as B on A.ShopID = B.ShopID join Account as C on B.AccountID = C.AccountID where C.Username = ?";
        Shop shop = null;
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                shop = new Shop(rs.getInt("ShopID"), rs.getString("Name"), rs.getString("Location"), rs.getString("Phone"), rs.getString("ShopImage"),
                        rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"));
        } catch (SQLException ex) {
            Logger.getLogger(ShopDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return shop;
    }
}
