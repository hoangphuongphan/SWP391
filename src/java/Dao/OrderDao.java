/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Cart;
import Model.CurrentUser;
import Model.Discount;
import Model.Order;
import Model.Shop;
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
    
    public boolean deleteOrders(int OrderID){
        String query = "Update Orders set Status = ? where OrderID = ?";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, "Denied");
            st.setInt(2, OrderID);
            return st.execute();
        }catch (SQLException ex) {
            Logger.getLogger(OrderDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    public ArrayList<Order> getOrderList(int UserID, String type){
        ArrayList<Integer> IDs = getIDs(UserID, type);
        ArrayList<Order> Orders = new ArrayList<>();
        for(Integer ID : IDs){
            Orders.add(getOrderByID(ID));
        }
        return Orders;
    }
    
    private ArrayList<Integer> getIDs(int UserID, String type){
        String query ;
        switch (type) {
            case "User":
                query = "Select * from Orders where UserID = ? AND Status <> ?"; 
                break;
            case "Shop":
                query = "select * from Orders where ShopID = ? AND Status <> ?";
                break;
            case "Shipper":
                query = "";
                break;
            default:
                return null;
        }
        ArrayList<Integer> IDs = new ArrayList<>();
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, UserID);
            st.setString(2, "Denied");
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
    
    public Order getOrderByID(int OrderID){
        String query = "select * from Orders as A join OrdersDetail as B on A.OrderID = B.OrderID where A.OrderID = ?";
        HashMap<Integer,Integer> order = new HashMap<>();
        java.sql.Date date = null;
        String status = "";
        int ID = 0;
        int UserID = 0, ShopID = 0;
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, OrderID);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                order.put(rs.getInt("FoodID"), rs.getInt("Amount"));
                date = rs.getDate("Time");
                status = rs.getString("Status");
                UserID = rs.getInt("UserID");
                ShopID = rs.getInt("ShopID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Discount.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return new Order(OrderID,new UserDao().getUserByID(UserID), order, date, status, new ShopDao().getShopByID(ShopID));
    }
    
    public void Create(String location,  int ShopID){
        String query = "insert into Orders(UserID,ShipLocation,Status,ShopID) values (?,?,?,?)";
        User current = CurrentUser.getCurrent();
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setInt(1, current.getID());
            st.setString(2, location);
            st.setString(3, "Cooking");
            st.setInt(4, ShopID);
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
    
    public void createOrder(String location, int ShopID, HashMap<Integer,Integer> cart){
        Create(location, ShopID);
        for(HashMap.Entry<Integer,Integer> entry : cart.entrySet()){
            insertOrderDetais(OrderID(CurrentUser.getCurrent().getID()), entry.getKey(), entry.getValue());
        }
    }

}
