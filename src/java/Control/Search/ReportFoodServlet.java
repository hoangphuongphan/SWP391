package Control.Search;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


/**
 *
 * @author Admin
 */
import Dao.ReportDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReportFoodServlet extends HttpServlet {

    private ReportDAO reportDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        reportDAO = new ReportDAO(); // Khởi tạo DAO
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Hiển thị form báo cáo món ăn
        request.getRequestDispatcher("/reportFoodForm.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Xử lý khi người dùng gửi báo cáo món ăn
        int userID = Integer.parseInt(request.getParameter("userID"));
        int foodID = Integer.parseInt(request.getParameter("foodID"));
        String content = request.getParameter("content");

        // Thêm báo cáo vào cơ sở dữ liệu
        boolean success = reportDAO.addFoodReport(userID, foodID, content);

        if (success) {
            // Nếu thêm thành công, chuyển hướng về trang chủ hoặc trang thông báo thành công
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            // Nếu thất bại, hiển thị thông báo lỗi hoặc xử lý tương ứng
            request.setAttribute("errorMessage", "Đã có lỗi xảy ra khi thêm báo cáo.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
