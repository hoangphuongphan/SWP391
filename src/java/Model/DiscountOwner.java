/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phoan
 */
public class DiscountOwner {
    private User owner;
    private Discount discount;

    public DiscountOwner(User owner, Discount discount) {
        this.owner = owner;
        this.discount = discount;
    }

    public Discount getDiscount() {
        return discount;
    }

    public User getOwner() {
        return owner;
    }
}
