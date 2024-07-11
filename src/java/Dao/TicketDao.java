/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Ticket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author phoan
 */
public class TicketDao {
    private Connection con;
    Database instance;

    public TicketDao() {
        instance = Database.getInstance();
        con = instance.getCon();
    }
    
    public boolean createTicket(Ticket ticket){
        String query = "insert into Ticket values (?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, ticket.getUser().getID());
            st.setString(2, ticket.getSubject());
            st.setString(3, ticket.getContent());
            return st.execute();
        } catch (SQLException ex) {
            Logger.getLogger(TicketDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
