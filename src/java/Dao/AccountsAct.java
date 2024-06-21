/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Account;
import Model.User;
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
public class AccountsAct {
    private Connection con;
    Database instance;

    public AccountsAct() {
            instance = Database.getInstance();
            con = instance.getCon();
    }
    
    public boolean Create(User user, String type) {
        String query = "INSERT INTO Account (Username, Password, Type) " + "\n"
                + "VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = con.prepareStatement(query);
            pre.setString(1, user.getUsername());
            pre.setString(2, user.getPassword());
            pre.setString(3, type);
            int re = pre.executeUpdate();
            return re == 1? true : false;
        } catch (SQLException ex) {
            Logger.getLogger(UsersAct.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public Account getAccountByUsername(String username){
        String query = "select * from Account where Username = ?";
        Account acc = null;
        try{
            PreparedStatement pre = con.prepareStatement(query);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if(rs.next())
            acc = new Account(rs.getInt("AccountID"), rs.getString("Username"), rs.getString("Password"), rs.getString("Type"));
        } catch (SQLException ex) {
            Logger.getLogger(AccountsAct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }
}
