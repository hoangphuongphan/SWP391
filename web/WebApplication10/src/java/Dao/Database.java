/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phoan
 */
public class Database {
    private static Database instance;
    private Connection con = null ;

    private Database() {
        String serverName = "sun-phan";
        String databaseName = "Foodpal";
        String url = "jdbc:sqlserver://" + serverName + ";databaseName=" + databaseName + ";encrypt=false";
        String username = "sa";
        String password = "sa";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
            con= (Connection) DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getCon() {
        return con;
    }

    public static Database getInstance() {
        if(instance == null)
            instance = new Database();
        return instance;
    }
    
}