/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.CurrentShipper;
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
    
    public Shipper getBestFreeShipper(){
        String query = "select * from Shipper as A join Account as C on A.AccountID = C.AccountID where status = 1 Order by NewID()";
        Shipper shipper = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                shipper = new Shipper(rs.getInt("ShipperID"), rs.getString("Name"), rs.getString("Phone"), rs.getString("VehicleID"),
                        rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"), rs.getString("Avatar"), rs.getInt("status"));
        }catch (SQLException ex) {
            Logger.getLogger(ShipperDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return shipper;
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
                        rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"), rs.getString("Avatar"), rs.getInt("status"));
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
                        rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"), rs.getString("Avatar"), rs.getInt("status"));
        } catch (SQLException ex) {
            Logger.getLogger(ShipperDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return shipper;
    }
    
    public void updateShipper(Shipper ship){
        if(ship==null)
            ship = CurrentShipper.getInstance();
        String query = "update Shipper set Name = ?, Phone = ?, VehicleID = ?, Avatar = ?, status = ? where ShipperID = ?";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, ship.getName());
            st.setString(2, ship.getPhone());
            st.setString(3, ship.getVehicleID());
            st.setString(4, ship.getAvatar());
            st.setInt(5, ship.getStaus());
            st.setInt(6, ship.getID());
            st.execute();
        }catch (SQLException ex) {
            Logger.getLogger(ShipperDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
