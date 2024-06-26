/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.CurrentUser;
import Model.User;
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
    
    public void CreateWallet(int ID, String type){
        int wt = 0;
        String query = "Insert into Wallet values (???)";
        switch (type) {
            case "User":
                wt = 1;
                break;
            case "Shop":
                wt = 2;
                break;
            case "Shipper":
                wt = 3;
        }
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, ID);
            st.setInt(2, 0);
            st.setInt(3, wt);
            st.execute();
        }catch (SQLException ex) {
            Logger.getLogger(WalletDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Wallet getWalletByID(int ID, String type){
        int wt = 0;
        String query = "Select * from Wallet where UserID = ? AND Type = ?";
        switch (type) {
            case "User":
                wt = 1;
                break;
            case "Shop":
                wt = 2;
                break;
            case "Shipper":
                wt = 3;
        }
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, ID);
            st.setInt(2, wt);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                return new Wallet(ID, rs.getInt("Amount"), wt);
        }catch (SQLException ex) {
            Logger.getLogger(WalletDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void UpdateAmount(User user, Wallet wallet){
        if(user == null)
            user = CurrentUser.getCurrent();
        if(wallet == null)
            wallet = Wallet.getInstance();
        String query = "update Wallet set Amount = ? where UserID = ? and Type = ?";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, wallet.getAmount());
            st.setInt(2, user.getID());
            st.setInt(3, user.getType());
            st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(WalletDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
