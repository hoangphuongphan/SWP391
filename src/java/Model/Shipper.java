/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phoan
 */
public class Shipper extends Account{
    private int ID;
    private String name, phone, VehicleID;

    public Shipper(int ID, String name, String phone, String VehicleID, int id, String username, String password) {
        super(id, username, password, "Shipper");
        this.ID = ID;
        this.name = name;
        this.phone = phone;
        this.VehicleID = VehicleID;
    }

    public Shipper(String username, String password, String name, String phone, String VehicleID) {
        super(username, password, "Shipper");
        this.name = name;
        this.phone = phone;
        this.VehicleID = VehicleID;
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
}
