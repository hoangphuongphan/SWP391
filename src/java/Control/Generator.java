/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Control;

import java.util.Random;

/**
 *
 * @author phoan
 */
public class Generator {
    private static Generator instance;
    private Generator() {
    }
    
    public String getOTP() {
        int OTP =  new Random().nextInt(999999);
        return String.format("%06d", OTP);
    }
    
    public String getNewDisplayName() {
        long ID = new Random().nextLong(999999999);
        return "user" + ID;
    }

    public static Generator getInstance() {
        if(instance == null)
            instance = new Generator();
        return instance;
    }
}
