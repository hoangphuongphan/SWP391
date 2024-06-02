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
        String query = "select * from Users as A join UserAccount as B on A.UserID = B.UserID join Account as C on B.AccountID = C.AccountID where Email = ?";
        User user = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                user = new User(rs.getString("Username"), rs.getString("Password"), rs.getString("email"), rs.getString("Phone"), rs.getString("Name"), rs.getString("location")
                        , rs.getInt("UserID"));
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return user;
    }
    
    public User getUserByUsername(String username) {
        String query = "select * from Users as A join UserAccount as B on A.UserID = B.UserID join Account as C on B.AccountID = C.AccountID where Username = ?";
        User user = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                user = new User(rs.getString("Username"), rs.getString("Password"), rs.getString("email"), rs.getString("Phone"), rs.getString("Name"), rs.getString("location")
                        , rs.getInt("UserID"));
        } catch (SQLException ex) {
            Logger.getLogger(UsersAct.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return user;
        
    }
    
    public boolean Create(User user) {
        String query = "INSERT INTO Users (Name, Phone, Email) " + "\n"
                + "VALUES (?, ?, ?)";
        try {
            PreparedStatement pre = con.prepareStatement(query);
            pre.setString(1, user.getName());
            pre.setString(2, user.getPhone());
            pre.setString(3, user.getEmail());
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
