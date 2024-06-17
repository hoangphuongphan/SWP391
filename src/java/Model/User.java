/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Control.Generator;
import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author phoan
 */
public class User extends Account{
    private String email, phone, name, location;
    private int ID;

    public User( String username, String password, String email, String phone, String name) {
        super(username, password,"User");
        this.email = email;
        this.phone = phone;
        this.name = name;
    }
    
    public User( String username, String password, String email, String phone, String name, String location, int ID) {
        super(username, password,"User");
        this.email = email;
        this.phone = phone;
        this.name = name;
        this.location = location;
        this.ID = ID;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getName() {
        return name;
    }

    public String getLocation() {
        return location;
    }

    public int getID() {
        return ID;
    }
}
