/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Control.Generator;

/**
 *
 * @author phoan
 */
public class Shipper extends Account{
    private int ID, staus;
    private String name, phone, VehicleID, avatar, email;

    public Shipper(int ID, String name, String phone, String VehicleID, int id, String username, String password, String avatar, int status, String email) {
        super(id, username, password, "Shipper");
        this.ID = ID;
        this.name = name;
        this.phone = phone;
        this.VehicleID = VehicleID;
        this.avatar = avatar;
        this.staus = status;
        this.email = email;
    }

    public Shipper(String username, String password, String phone, String VehicleID,  String email) {
        super(username, password, "Shipper");
        this.name = Generator.getInstance().getNewDisplayName();
        this.phone = phone;
        this.VehicleID = VehicleID;
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setVehicleID(String VehicleID) {
        this.VehicleID = VehicleID;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public String getAvatar() {
        return avatar;
    }

    public int getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getVehicleID() {
        return VehicleID;
    }

    @Override
    public String toString() {
        return name + "\n" + phone + "\n" + VehicleID;
    }

    public int getStaus() {
        return staus;
    }

    public void setStaus(int staus) {
        this.staus = staus;
    }
}
