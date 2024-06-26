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
public class UserDao {

    private Connection con;
    Database instance;

    public UserDao() {
        instance = Database.getInstance();
        con = instance.getCon();
    }
    
    public User getUserByID(int id){
        String query = "select * from Users as A join Account as B on B.AccountID = A.AccountID where A.UserID = ?";
        User user = null;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                user = new User(rs.getString("Username"), rs.getString("Password"), rs.getString("email"), rs.getString("Phone"), rs.getString("Name"), rs.getString("location")
                        , rs.getInt("UserID"));
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return user;
    }
    
    public User getUserByMail(String mail){
        String query = "select * from Users as A  join Account as C on A.AccountID = C.AccountID where Email = ?";
        User user = null;
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                user = new User(rs.getString("Username"), rs.getString("Password"), rs.getString("email"), rs.getString("Phone"), rs.getString("Name"), rs.getString("location")
                        , rs.getInt("UserID"));
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return user;
    }

    public User getUserByUsername(String username) {
        String query = "select * from Users as A join Account as C on A.AccountID = C.AccountID where Username = ?";
        User user = null;
        try {
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                user = new User(rs.getString("Username"), rs.getString("Password"), rs.getString("email"), rs.getString("Phone"), rs.getString("Name"), rs.getString("location")
                        , rs.getInt("UserID"));
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
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
            return re == 1 ? true : false;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean UpdataePassword(String password, String gmail) {
        String query = "update Users Set PasswordHash = ? where Email = ?";
        try {
            PreparedStatement pre = con.prepareStatement(query);
            pre.setString(1, password);
            pre.setString(2, gmail);
            int re = pre.executeUpdate();
            return re == 1 ? true : false;
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean UpdateProfile(String uN, String dN, String p, String loc) {
        String querry = "Update Users set DisplayName=?, Phone=?, Location=? where UserID=?";
        try {
            PreparedStatement pre = con.prepareStatement(querry);
            pre.setString(1, dN);
            pre.setString(2, p);
            pre.setString(3, loc);
            pre.setString(4, uN);
            int result = pre.executeUpdate();
            return result == 1;
        } catch (SQLException e) {
            return false;
        }
    }
}
