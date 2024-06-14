/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Food;
import Model.Wallet;
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
public class WalletDao {
    private Connection con;
    Database instance;

    public WalletDao() {
            instance = Database.getInstance();
            con = instance.getCon();
    }
    
    public Wallet getWalletByID(int UserID){
        String query = "select * from Wallet where UserID = ?";
        Wallet wallet = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                wallet = new Wallet(UserID, rs.getInt("Amount"));
        } catch (SQLException ex) {
            Logger.getLogger(WalletDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return wallet;
    }
    
    public void UpdateAmount(int UserID){
        Wallet wallet = Wallet.getInstance(UserID);
        String query = "update Wallet set Amount = ? where UserID = ?";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, wallet.getAmount());
            st.setInt(2, UserID);
            st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(WalletDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
