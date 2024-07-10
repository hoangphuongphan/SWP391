/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Shipper;
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
public class ShipperDao {
    private Connection con;
    Database instance;

    public ShipperDao() {
        instance = Database.getInstance();
        con = instance.getCon();
    }
    
    public Shipper getShipperByUsername(String username) {
        String query = "select * from Shipper as A join Account as C on A.AccountID = C.AccountID where C.Username = ?";
        Shipper shipper = null;
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                shipper = new Shipper(rs.getInt("ShipperID"), rs.getString("Name"), rs.getString("Phone"), rs.getString("VehicleID"),
                        rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"));
        } catch (SQLException ex) {
            Logger.getLogger(ShipperDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return shipper;
    }
    
    public Shipper getShipperByID(int ShipperID){
        String query = "select * from Shipper as A join Account as C on A.AccountID = C.AccountID where A.ShipperID = ?";
        Shipper shipper = null;
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, ShipperID);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                shipper = new Shipper(rs.getInt("ShipperID"), rs.getString("Name"), rs.getString("Phone"), rs.getString("VehicleID"),
                        rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"));
        } catch (SQLException ex) {
            Logger.getLogger(ShipperDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return shipper;
    }
}
