/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phoan
 */
public class CurrentShop {
    private static Shop instance;
    
    public static void initialize(Shop shop){
        CurrentShop.instance = shop;
    }
    
    public static Shop getInstance(){
        return instance;
    }
    
    public static void delet(){
        CurrentShop.instance = null;
    }
}
