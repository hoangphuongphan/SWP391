/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Dao.WalletDao;

/**
 *
 * @author phoan
 */
public class Wallet {
    private int UserID, amount, Type;
    private static Wallet instance;

    public Wallet(int UserID, int amount,int Type) {
        this.UserID = UserID;
        this.amount = amount;
    }
    
    public static void initialize(int UserID, String type){
        instance = new WalletDao().getWalletByID(UserID, type);
    }

    public int getUserID() {
        return UserID;
    }

    public int getAmount() {
        return amount;
    }
    
    public String getType(){
        switch(Type){
            case 1:
                return "User";
            case 2:
                return "Shop";
            case 3:
                return "Shipper";
            default:
                return null;
        }
    }

    public static Wallet getInstance() {
        return instance;
    }

    public void add(int amount){
        this.amount += amount;
    }
}
