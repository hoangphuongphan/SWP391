/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phoan
 */
public class Cart {
    private static Cart instance;
    private List<Product> list;

    private Cart() {
        list = new ArrayList<>();
    }

    public static Cart getInstance() {
        if(instance == null)
            instance = new Cart();
        return instance;
    }

    public List<Product> getList() {
        return list;
    }
}
