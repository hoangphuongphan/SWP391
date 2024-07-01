/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author phoan
 */
public class Account {
    private int AccountID;
    private String username,password,type;

    public Account(int AccountID, String username, String password, String type) {
        this.AccountID = AccountID;
        this.username = username;
        this.password = password;
        this.type = type;
    }

    public Account(String username, String password, String type) {
        this.username = username;
        this.password = password;
        this.type = type;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getType() {
        switch (type) {
            case "User":
                return 1;
            case "Shop":
                return 2;
            case "Shipper":
                return 3;
            default:
                return 0;
        }
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
