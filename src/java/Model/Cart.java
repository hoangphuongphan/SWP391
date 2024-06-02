/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author phoan
 */
public class Cart {
    private static Cart instance;
    private static HashMap<Food,Integer> cart;
    private static User owner;

    private Cart() {
        cart = new HashMap<>();
        owner = CurrentUser.getUser();
    }

    public static Cart getInstance() {
        if(instance == null)
            instance = new Cart();
        return instance;
    }

    public static HashMap<Food, Integer> getCart() {
        return cart;
    }
    
    public boolean Add(Food product, int amount){
        int defaultAmount = amount;
        if(cart.containsKey(product)){
            defaultAmount = cart.get(product) + amount;
            cart.put(product, cart.get(product) + amount);
        }else{
            cart.put(product, amount);
        }
        return defaultAmount == cart.get(product);
    }
    
    public boolean Delete(Food product, int amount){
        if(cart.containsKey(product)){
            int defaultAmount = cart.get(product);
            if (defaultAmount > amount) {
                cart.put(product, defaultAmount - amount);
            } else 
                cart.remove(product);
            return !cart.containsKey(product) || cart.get(product) == defaultAmount - amount;
        }
        return false;
    }
}
