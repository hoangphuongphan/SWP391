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
    private int UserID, amount;
    private static Wallet instance;

    public Wallet(int UserID, int amount) {
        this.UserID = UserID;
        this.amount = amount;
    }

    public int getUserID() {
        return UserID;
    }

    public int getAmount() {
        return amount;
    }

    public static Wallet getInstance(int UserID) {
        if(instance == null)
            instance = new WalletDao().getWalletByID(UserID);
        return instance;
    }

    public void add(int amount){
        this.amount += amount;
    }
}
