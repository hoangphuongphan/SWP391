/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Food;
import java.sql.Connection;
import java.util.List;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class FoodAct {

    private Connection con;
    Database instance;

    public List<Food> get5RandomItems() {
        String sql = "select top 5 * from Food order by newid()";
        List<Food> ffl = null;
        try {
            PreparedStatement pstm = con.prepareCall(sql);
            ffl = new ArrayList<>();
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int fId = rs.getInt(2);
                int sId = rs.getInt(1);
                int cId = rs.getInt(3);
                double p = rs.getDouble(4);
                String fI = rs.getString(5);
                ffl.add(new Food(fId, sId, cId, cId, fI));
            }
            return ffl;
        } catch (SQLException e) {
        }
        return null;
    }
    
    public List<Food> get5NewItems() {
        String sql = "select top 5 * from Food order by foodid desc";
        List<Food> nfl = null;
        try {
            PreparedStatement pstm = con.prepareCall(sql);
            nfl = new ArrayList<>();
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int fId = rs.getInt(2);
                int sId = rs.getInt(1);
                int cId = rs.getInt(3);
                double p = rs.getDouble(4);
                String fI = rs.getString(5);
                nfl.add(new Food(fId, sId, cId, cId, fI));
            }
            return nfl;
        } catch (SQLException e) {
        }
        return null;
    }
}
