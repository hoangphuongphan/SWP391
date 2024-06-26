/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control.Payment;

import Dao.FoodDao;
import Dao.ShopDao;
import Model.Cart;
import Model.Food;
import Model.Shop;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author phoan
 */
public class BillSplit {
    //split bill for each Shop
    public static HashMap<Integer,HashMap<Integer,Integer>> SplitBill(){
        FoodDao dao = new FoodDao();
        ShopDao sdao = new ShopDao();
        HashMap<Integer,HashMap<Integer,Integer>> list = new HashMap<>();
        for(HashMap.Entry<Integer,Integer> item : Cart.getCart().entrySet()){
            Food food = dao.getFoodByID(item.getKey());
            Shop shop = sdao.getShopByID(food.getShopID());
            if(list.get(shop.getShopID()) == null)
                list.put(shop.getShopID(), new HashMap<>());
            list.get(shop.getShopID()).put(food.getID(), item.getValue());
        }
        return list;
    }
}
