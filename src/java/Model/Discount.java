/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.sql.Date;
/**
 *
 * @author phoan
 */
public class Discount {
    private int ID;
    private String name,offer;
    private Date valid,expired;

    public Discount(int ID, String name, String offer, Date valid, Date expired) {
        this.ID = ID;
        this.name = name;
        this.offer = offer;
        this.valid = valid;
        this.expired = expired;
    }

    public Discount(String name, String offer, Date expired) {
        this.name = name;
        this.offer = offer;
        this.expired = expired;
    }

    public int getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public double getOffer() {
        if(offer.endsWith("%"))
            return (double) Double.parseDouble(offer.split("%")[0])/100;
        return Double.parseDouble(offer);
    }

    public Date getExpired() {
        return expired;
    }

    public Date getValid() {
        return valid;
    }
}
