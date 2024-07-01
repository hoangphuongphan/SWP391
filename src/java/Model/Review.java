/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Dao.FoodDao;
import Dao.RateDao;
import Dao.UserDao;

/**
 *
 * @author phoan
 */
public class Review {
    private int ReviewID;
    private Food food;
    private User user;
    private Rate rate;
    private String content;

    public Review(int ReviewID, int foodID, int userID, int rateID, String content) {
        this.ReviewID = ReviewID;
        this.food = new FoodDao().getFoodByID(foodID);
        this.user = new UserDao().getUserByID(userID);
        this.rate = new RateDao().getRateByID(rateID);
        this.content = content;
    }

    public int getReviewID() {
        return ReviewID;
    }

    public void setReviewID(int ReviewID) {
        this.ReviewID = ReviewID;
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

    public Rate getRate() {
        return rate;
    }

    public void setRate(Rate rate) {
        this.rate = rate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
