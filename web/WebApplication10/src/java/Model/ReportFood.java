/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class ReportFood {
    private int reportFoodID;
    private int userID;
    private int foodID;
    private String content;

    public ReportFood(int reportFoodID, int userID, int foodID, String content) {
        this.reportFoodID = reportFoodID;
        this.userID = userID;
        this.foodID = foodID;
        this.content = content;
    }

    public ReportFood() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getReportFoodID() {
        return reportFoodID;
    }

    public void setReportFoodID(int reportFoodID) {
        this.reportFoodID = reportFoodID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
 
    
    
}
