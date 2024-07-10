/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;


public class Category {
    private int CategoryID;
    private String name;

    public Category(int CategoryID, String name) {
        this.CategoryID = CategoryID;
        this.name = name;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
