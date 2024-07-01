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
    private int ShopID, status;
    private String Name,Location,Phone,imgurl,email;

    public Shop(int ShopID, String Name, String Location, String Phone, String imgurl, int id, String username, String password, String email,int status) {
        super(id, username, password, "Shop");
        this.ShopID = ShopID;
        this.Name = Name;
        this.Location = Location;
        this.Phone = Phone;
        this.imgurl = imgurl;
        this.email = email;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }
    
    public String getEmail() {
        return email;
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

    public void setEmail(String email) {
        this.email = email;
    }
    

    public void setShopID(int ShopID) {
        this.ShopID = ShopID;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
