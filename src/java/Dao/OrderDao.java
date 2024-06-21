/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Cart;
import Model.Discount;
import Model.Order;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phoan
 */
public class OrderDao {
    private Connection con;
    Database instance;

    public OrderDao() {
            instance = Database.getInstance();
            con = instance.getCon();
    }
    
    public ArrayList<Order> getOrderList(int UserID){
        ArrayList<Integer> IDs = getIDs(UserID);
        ArrayList<Order> Orders = new ArrayList<>();
        for(Integer ID : IDs){
            Orders.add(getOrderByID(UserID, ID));
        }
        return Orders;
    }
    
    private ArrayList<Integer> getIDs(int UserID){
        String query = "Select * from Orders where UserID = ?";
        ArrayList<Integer> IDs = new ArrayList<>();
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, UserID);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                IDs.add(rs.getInt("OrderID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return IDs;
    }
    
    public Order getOrderByID(int UserID, int OrderID){
        String query = "select * from Orders as A join OrdersDetail as B on A.OrderID = B.OrderID where UserID = ? AND A.OrderID = ?";
        HashMap<Integer,Integer> order = new HashMap<>();
        java.sql.Date date = null;
        String status = "";
        int ID = 0;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, UserID);
            st.setInt(2, OrderID);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                order.put(rs.getInt("FoodID"), rs.getInt("Amount"));
                date = rs.getDate("Time");
                status = rs.getString("Status");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Discount.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return new Order(OrderID,new UsersAct().getUserByID(UserID), order, date, status);
    }
    
    public void Create(User current,String location){
        String query = "insert into Orders(UserID,ShipLocation,Status) values (?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, current.getID());
            st.setString(2, location);
            st.setString(3, "Cooking");
            st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Discount.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void insertOrderDetais(int OrderID, int FoodID, int amount){
        String query = "insert into OrdersDetail values (?,?,?)";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, OrderID);
            st.setInt(2, FoodID);
            st.setInt(3, amount);
            st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Discount.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private int OrderID(int ID){
        String query = "select TOP 1 * from Orders where UserID = ? Order by OrderID desc";
        int order = 0;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                order = rs.getInt("OrderID");
        } catch (SQLException ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }
    
    public void createOrder(User current, String location, HashMap<Integer,Integer> items){
        HashMap<Integer,Integer> cart = items;
        Create(current, location);
        for(HashMap.Entry<Integer,Integer> entry : cart.entrySet()){
            insertOrderDetais(OrderID(current.getID()), entry.getKey(), entry.getValue());
        }
    }

}
