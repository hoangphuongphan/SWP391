/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phoan
 */
public class Shop extends Account{
    private int ShopID;
    private String Name,Location,Phone,imgurl;

    public Shop(int ShopID, String Name, String Location, String Phone, String imgurl, int id, String username, String password) {
        super(id, username, password, "Shop");
        this.ShopID = ShopID;
        this.Name = Name;
        this.Location = Location;
        this.Phone = Phone;
        this.imgurl = imgurl;
    }

    public int getShopID() {
        return ShopID;
    }

    public String getName() {
        return Name;
    }

    public String getLocation() {
        return Location;
    }

    public String getPhone() {
        return Phone;
    }

    public String getImgurl() {
        return imgurl;
    }
}
