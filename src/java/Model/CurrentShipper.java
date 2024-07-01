/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phoan
 */
public class CurrentShipper {
    private static Shipper instance;
    
    public static void initialize(Shipper ship){
        CurrentShipper.instance = ship;
    }
    
    public static Shipper getInstance(){
        return instance;
    }
    
    public static void delet(){
        CurrentShipper.instance = null;
    }
}
