package Dao;

import Model.User;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
/**
 *
 * @author phoan
 */
public class UsersAct {
    private Connection con;
    Database instance;

    public UsersAct() {
            instance = Database.getInstance();
            con = instance.getCon();
    }
    
    public User getUserByMail(String mail){
        String query = "Select * from Users where Email = ?";
        User user = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                user = new User(rs.getString("UserID"), rs.getString("Username"), rs.getString("PasswordHash"), rs.getString("Email"), rs.getString("DisplayName"), 
                        rs.getDate("CreatedAt"), rs.getString("Bio"), rs.getBoolean("IsPublisher"), rs.getBoolean("IsAdmin"), rs.getString("ProfilePicture"));
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return user;
    }
    
    public User getUserByUsername(String username) {
        String query = "Select * from Users where Username = ?";
        User user = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                user = new User(rs.getString("UserID"), rs.getString("Username"), rs.getString("PasswordHash"), rs.getString("Email"), rs.getString("DisplayName"), 
                        rs.getDate("CreatedAt"), rs.getString("Bio"), rs.getBoolean("IsPublisher"), rs.getBoolean("IsAdmin"), rs.getString("ProfilePicture"));
        } catch (SQLException ex) {
            Logger.getLogger(UsersAct.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return user;
        
    }
    
    public boolean Create(User user) {
        String query = "INSERT INTO Users (Username, PasswordHash, Email, DisplayName) " + "\n"
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pre = con.prepareStatement(query);
            pre.setString(1, user.getUsername());
            pre.setString(2, user.getPassword());
            pre.setString(3, user.getEmail());
            pre.setString(4, user.getDisplayName());
            int re = pre.executeUpdate();
            return re == 1? true : false;
        } catch (SQLException ex) {
            Logger.getLogger(UsersAct.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    public boolean UpdataePassword(String password, String gmail){
        String query = "update Users Set PasswordHash = ? where Email = ?";
        try{
            PreparedStatement pre = con.prepareStatement(query);
            pre.setString(1, password);
            pre.setString(2, gmail);
            int re = pre.executeUpdate();
            return re == 1? true : false;
        } catch (SQLException ex) {
            Logger.getLogger(UsersAct.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
