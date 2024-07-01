/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Dao.FoodDao;
import Dao.UserDao;

/**
 *
 * @author phoan
 */
public class Rate {
    private int RateID,Rate;
    private Food food;
    private User user;

    public Rate(int RateID, int FoodID, int UserID, int Rate) {
        this.RateID = RateID;
        this.food = new FoodDao().getFoodByID(Rate);
        this.user = new UserDao().getUserByID(UserID);
        this.Rate = Rate;
    }
    
    public Rate( int FoodID, int UserID, int Rate) {
        this.food = new FoodDao().getFoodByID(Rate);
        this.user = new UserDao().getUserByID(UserID);
        this.Rate = Rate;
    }

    public int getRateID() {
        return RateID;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getRate() {
        return Rate;
    }

    public void setRate(int Rate) {
        this.Rate = Rate;
    }
    
    
}
