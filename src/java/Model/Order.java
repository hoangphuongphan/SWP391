/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.util.HashMap;

/**
 *
 * @author phoan
 */
public class Order {
    private int OrderID, total;
    private User user;
    private Shop shop;
    private Shipper shipper;
    private HashMap<Integer,Integer> order;
    private Date time;
    private String status;
    private String shipLocation;

    public Order(User user, Shop shop, HashMap<Integer,Integer> items, int total, String shipLocation, Shipper shipper) {
        this.user = user;
        this.order = items;
        this.time = null;
        this.status = "Cooking";
        this.shop = shop;
        this.total = total;
        this.shipLocation = shipLocation;
        this.shipper = shipper;
    }

    public Order(int OrderID, User user, HashMap<Integer, Integer> order, Date time, String status, Shop shop, int total, String shipLocation, Shipper shipper) {
        this.OrderID = OrderID;
        this.user = user;
        this.order = order;
        this.time = time;
        this.status = status;
        this.shop = shop;
        this.total = total;
        this.shipLocation = shipLocation;
        this.shipper = shipper;
    }

    public Shipper getShipper() {
        return shipper;
    }

    public String getShipLocation() {
        return shipLocation;
    }
    
    public int getTotal() {
        return total;
    }

    public Shop getShop() {
        return shop;
    }

    public User getUser() {
        return user;
    }

    public HashMap<Integer, Integer> getOrder() {
        return order;
    }

    public Date getTime() {
        return time;
    }

    public int getOrderID() {
        return OrderID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return OrderID + "\n" + time;
    }
}
