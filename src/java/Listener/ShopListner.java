/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Listener;

import Dao.Database;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
/**
 *
 * @author phoan
 */
public class ShopListner implements HttpSessionListener{
    private Thread listener;
    private static int Count;
    private String query = "select Count(*) as Lines from Orders";
    
    private int readNumber(){
        Connection con = Database.getInstance().getCon();
        try{
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if(rs.next())
                return rs.getInt("Lines");
        } catch (SQLException ex) {
            Logger.getLogger(ShopListner.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void sessionCreated(HttpSessionEvent se) {
        Count = readNumber();
        listener = new Thread(new BackgroundListener());
        listener.setDaemon(true);
        listener.start();
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        if(listener != null)
            listener.interrupt();
    }
    
    private static class BackgroundListener implements Runnable{

        @Override
        public void run() {
            while(!Thread.currentThread().isInterrupted()){
                try{
                    ShopListner listen = new ShopListner();
                    int temp = listen.readNumber();
                    if(temp!=ShopListner.Count){
                        ShopListner.Count = temp;
                        //then do what? notify?
                    }
                    Thread.sleep(500);
                }catch(Exception ex){
                    Thread.currentThread().interrupt();
                }
            }
        }
        
    }
}


