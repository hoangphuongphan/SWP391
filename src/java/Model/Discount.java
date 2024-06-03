/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phoan
 */
public class Discount {
    private int ID;
    private String name,offer;

    public Discount(int ID, String name, String offer) {
        this.ID = ID;
        this.name = name;
        this.offer = offer;
    }

    public Discount(String name, String offer) {
        this.name = name;
        this.offer = offer;
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
    
    
}
