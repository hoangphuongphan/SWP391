/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phoan
 */
public class Food {
    private String name,imgurl;
    private int ID,ShopID,CateID;
    private double price;

    public Food(String name, String imgurl, int ID, int ShopID, int CateID, double price) {
        this.name = name;
        this.imgurl = imgurl;
        this.ID = ID;
        this.ShopID = ShopID;
        this.CateID = CateID;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public String getImgurl() {
        return imgurl;
    }

    public int getID() {
        return ID;
    }

    public int getShopID() {
        return ShopID;
    }

    public int getCateID() {
        return CateID;
    }

    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "name: " + name + " price: " + price;
    }
}
