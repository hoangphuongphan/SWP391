/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.CurrentShop;
import Model.Shop;
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
public class ShopDao {
    private Connection con;
    Database instance;

    public ShopDao() {
        instance = Database.getInstance();
        con = instance.getCon();
    }
    
    public ArrayList<Shop> searchShop(String search){
        ArrayList<Shop> shops = new ArrayList<>();
        String query = "SELECT * FROM Shop join Account on Shop.AccountID = Account.AccountID WHERE Name LIKE ?";
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, "%"+search+"%");
            ResultSet rs = st.executeQuery();
            while(rs.next())
                shops.add(new Shop(rs.getInt("ShopID"), rs.getString("Name"), rs.getString("Location"), rs.getString("Phone"), rs.getString("ShopImage"),
                        rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"), rs.getString("ShopEmail"), rs.getInt("Status")));
        } catch (SQLException ex) {
            Logger.getLogger(ShopDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return shops;
    }
    
    public Shop getShopByID(int ID){
        String query = "select * from Shop as A join Account as C on A.AccountID = C.AccountID where A.ShopID = ?";
        Shop shop = null;
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                shop = new Shop(rs.getInt("ShopID"), rs.getString("Name"), rs.getString("Location"), rs.getString("Phone"), rs.getString("ShopImage"),
                        rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"), rs.getString("ShopEmail"), rs.getInt("Status"));
        } catch (SQLException ex) {
            Logger.getLogger(ShopDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return shop;
    }
    
    public Shop getShopByUsername(String username) {
        String query = "select * from Shop as A join Account as C on A.AccountID = C.AccountID where C.Username = ?";
        Shop shop = null;
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                shop = new Shop(rs.getInt("ShopID"), rs.getString("Name"), rs.getString("Location"), rs.getString("Phone"), rs.getString("ShopImage"),
                        rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"), rs.getString("ShopEmail"), rs.getInt("Status"));
        } catch (SQLException ex) {
            Logger.getLogger(ShopDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return shop;
    }
    
    public boolean UpdateShop(Shop shop){
        if(shop == null)
            shop = CurrentShop.getInstance();
        String query = "update Shop set Name = ?, Phone = ?, Location = ?, ShopImage = ?, ShopEmail = ?, Status = ? where ShopID = ?";
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, shop.getName());
            st.setString(2, shop.getPhone());
            st.setString(3, shop.getLocation());
            st.setString(4, shop.getImgurl());
            st.setString(5, shop.getEmail());
            st.setInt(6, shop.getStatus());
            st.setInt(7, shop.getShopID());
            return st.execute();
        }catch (SQLException ex) {
            Logger.getLogger(ShopDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
