/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control;

import Dao.ShopDao;
import Model.Shop;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author phoan
 */
public class StatusChecking {
    public static ArrayList<Integer> unavilShops(HashMap<Integer,HashMap<Integer,Integer>> bills){
        ArrayList<Integer> unavail = new ArrayList<>();
        for(HashMap.Entry<Integer,HashMap<Integer,Integer>> entry : bills.entrySet()){
            Shop shop = new ShopDao().getShopByID(entry.getKey());
            if(shop.getStatus()!=1)
                unavail.add(entry.getKey());
        }
        return unavail;
    }
}
