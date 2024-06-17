/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

/**
 *
 * @author Admin
 */


import Model.ReportFood;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {

    private Connection con;

    public ReportDAO() {
        // Lấy kết nối từ Database singleton
        this.con = Database.getInstance().getCon();
    }

    // Phương thức để thêm báo cáo món ăn
    public boolean addFoodReport(int userID, int foodID, String content) {
        String query = "INSERT INTO ReportFood (UserID, FoodID, content) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, userID);
            pstmt.setInt(2, foodID);
            pstmt.setString(3, content);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Phương thức để thêm báo cáo cửa hàng
    public boolean addShopReport(int userID, int shopID, String content) {
        String query = "INSERT INTO ReportShop (UserID, ShopID, content) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, userID);
            pstmt.setInt(2, shopID);
            pstmt.setString(3, content);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Phương thức để thêm báo cáo shipper
    public boolean addShipperReport(int userID, int shipperID, String content) {
        String query = "INSERT INTO ReportShipper (UserID, ShipperID, content) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, userID);
            pstmt.setInt(2, shipperID);
            pstmt.setString(3, content);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Phương thức để lấy danh sách các báo cáo món ăn
    public List<ReportFood> getAllFoodReports() {
        List<ReportFood> reports = new ArrayList<>();
        String query = "SELECT * FROM ReportFood";
        try (PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                ReportFood report = new ReportFood();
                report.setReportFoodID(rs.getInt("ReportFoodID"));
                report.setUserID(rs.getInt("UserID"));
                report.setFoodID(rs.getInt("FoodID"));
                report.setContent(rs.getString("content"));
                // Lấy thêm thông tin khác nếu cần
                reports.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reports;
    }

    // Các phương thức khác như update, delete có thể được thêm vào tương tự
}
