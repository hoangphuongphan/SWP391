/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Dao.FoodDao;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author phoan
 */
public class Cart {
    private static Cart instance;
    private static HashMap<Integer,Integer> cart;
    private static User owner;
    private static int total = 0;
    private Discount discount = null;
    private FoodDao dao = new FoodDao();

    private Cart() {
        cart = new HashMap<>();
        owner = CurrentUser.getCurrent();
    }

    public static Cart getInstance() {
        if(instance == null)
            instance = new Cart();
        return instance;
    }

    public static HashMap<Integer, Integer> getCart() {
        return cart;
    }
    
    public int getTotal(){
        if(discount!=null){
            if(discount.getOffer()<1)
                return (int) Math.round(total*(1-discount.getOffer()));
            return (int) Math.round(total - discount.getOffer());
        }
        return total;
    }
    
    public void Add(Integer foodID, int amount){
        if(cart.containsKey(foodID)){
            cart.put(foodID, cart.get(foodID) + amount);
        }else{
            cart.put(foodID, amount);
        }
        total += dao.getFoodByID(foodID).getPrice() * amount;
    }
    
    public void Delete(Integer foodID, int amount){
        if(cart.containsKey(foodID)){
            int defaultAmount = cart.get(foodID);
            if (defaultAmount > amount) {
                cart.put(foodID, defaultAmount - amount);
                total = total - ((int)dao.getFoodByID(foodID).getPrice() * amount);
            } else {
                total -= (int) dao.getFoodByID(foodID).getPrice()*cart.get(foodID);
                cart.remove(foodID);
            }
        }
    }
    
    public void setDiscount(Discount discount){
        this.discount = discount;
    }
    
    public boolean DeleteCart(){
        this.cart = null;
        this.instance = null;
        this.owner = null;
        this.total = 0;
        return cart == null && instance == null;
    }
}
