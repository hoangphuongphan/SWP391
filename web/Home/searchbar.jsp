<%-- 
    Document   : searchbar
    Created on : Jun 16, 2024, 1:40:32?PM
    Author     : Admin
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="SWP391/Home/css/style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="search-container">
        <!-- Ph?n tìm ki?m theo t? khóa -->
        <form action="SearchServlet" method="get">
            <input type="text" name="query" placeholder="Tìm ki?m th?c ph?m...">
            <button type="submit">Tìm ki?m</button>
        </form>
        
        <!-- Ph?n ch?n lo?i món ?n -->
        <form action="SearchServlet" method="get">
            <select name="category">
                <!-- Danh sách các lo?i món ?n s? ???c thêm b?ng mã Java trong servlet -->
            </select>
            <button type="submit">L?c</button>
        </form>
    </div>
    </body>
</html>
