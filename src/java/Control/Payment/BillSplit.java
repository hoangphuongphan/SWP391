/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control.Payment;

import Model.Cart;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author phoan
 */
public class BillSplit {
    //split bill for each Shop
    public static ArrayList<HashMap<Integer,Integer>> SplitBill(){
        ArrayList<HashMap<Integer,Integer>> bills = new ArrayList<>();
        ArrayList<Integer> shopList = new ArrayList<>();
        HashMap<Integer,Integer> cart = Cart.getCart();
        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            if(!shopList.contains(entry.getKey())){
                shopList.add(entry.getKey());
                bills.add(new HashMap<>());
            }
        }
        
        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            bills.get(shopList.indexOf(entry.getKey())).put(entry.getKey(), entry.getValue());
        }
        return bills;
    }
}
