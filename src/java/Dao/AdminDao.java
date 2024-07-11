/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author phoan
 */
public class AdminDao {
    private Connection con;

    public AdminDao() {
        // Lấy kết nối từ Database singleton
        this.con = Database.getInstance().getCon();
    }
    
    public Admin getAdminByCode(String loginCode){
        String query = "select * from Admin where LoginCode = ?";
        try{
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, loginCode);
            ResultSet rs = st.executeQuery();
            if(rs.next())
                return new Admin(rs.getInt("AdminID"), rs.getString("Name"), loginCode);
        }catch (Exception ex){
        }
        return null;
    }
}
