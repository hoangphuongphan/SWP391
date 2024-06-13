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
    private int OrderID;
    private User user;
    private HashMap<Integer,Integer> order;
    private Date time;
    private String status;

    public Order(User user) {
        this.user = user;
        this.order = Cart.getInstance().getCart();
        this.time = null;
        this.status = "Cooking";
    }

    public Order(int OrderID, User user, HashMap<Integer, Integer> order, Date time, String status) {
        this.OrderID = OrderID;
        this.user = user;
        this.order = order;
        this.time = time;
        this.status = status;
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

    @Override
    public String toString() {
        return OrderID + "\n" + time;
    }
}
