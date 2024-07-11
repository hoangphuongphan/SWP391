/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phoan
 */
public class Admin {
    private int ID;
    private String name,loginCode;

    public Admin(int ID, String name, String loginCode) {
        this.ID = ID;
        this.name = name;
        this.loginCode = loginCode;
    }

    public int getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public String getLoginCode() {
        return loginCode;
    }
}
