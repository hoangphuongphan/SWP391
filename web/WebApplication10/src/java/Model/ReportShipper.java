/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class ReportShipper {
     private int reportShipperID;
    private int userID;
    private int shipperID;
    private String content;

    public ReportShipper(int reportShipperID, int userID, int shipperID, String content) {
        this.reportShipperID = reportShipperID;
        this.userID = userID;
        this.shipperID = shipperID;
        this.content = content;
    }

    public int getReportShipperID() {
        return reportShipperID;
    }

    public void setReportShipperID(int reportShipperID) {
        this.reportShipperID = reportShipperID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getShipperID() {
        return shipperID;
    }

    public void setShipperID(int shipperID) {
        this.shipperID = shipperID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    
}
