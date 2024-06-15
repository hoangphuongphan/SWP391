/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Dao.ReportDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReportShipperServlet extends HttpServlet {

    private ReportDAO reportDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        reportDAO = new ReportDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Hiển thị form báo cáo shipper
        request.getRequestDispatcher("/reportShipperForm.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý khi người dùng gửi báo cáo shipper
        int userID = Integer.parseInt(request.getParameter("userID"));
        int shipperID = Integer.parseInt(request.getParameter("shipperID"));
        String content = request.getParameter("content");

        // Thêm báo cáo vào cơ sở dữ liệu
        boolean success = reportDAO.addShipperReport(userID, shipperID, content);

        if (success) {
            // Chuyển hướng về trang chủ hoặc trang thông báo thành công
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            // Hiển thị thông báo lỗi nếu có lỗi xảy ra
            request.setAttribute("errorMessage", "Đã có lỗi xảy ra khi thêm báo cáo.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
