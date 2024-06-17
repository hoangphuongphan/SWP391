<%-- 
    Document   : searchbar
    Created on : Jun 16, 2024, 1:40:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="search-container">
        <!-- Phần tìm kiếm theo từ khóa -->
        <form action="SearchServlet" method="get">
            <input type="text" name="query" placeholder="Tìm kiếm thực phẩm...">
            <button type="submit">Tìm kiếm</button>
        </form>
        
        <!-- Phần chọn loại món ăn -->
        <form action="SearchServlet" method="get">
            <select name="category">
                <!-- Danh sách các loại món ăn sẽ được thêm bằng mã Java trong servlet -->
            </select>
            <button type="submit">Lọc</button>
        </form>
    </div>
    </body>
</html>
