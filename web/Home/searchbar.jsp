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
        <!-- Ph?n t�m ki?m theo t? kh�a -->
        <form action="SearchServlet" method="get">
            <input type="text" name="query" placeholder="T�m ki?m th?c ph?m...">
            <button type="submit">T�m ki?m</button>
        </form>
        
        <!-- Ph?n ch?n lo?i m�n ?n -->
        <form action="SearchServlet" method="get">
            <select name="category">
                <!-- Danh s�ch c�c lo?i m�n ?n s? ???c th�m b?ng m� Java trong servlet -->
            </select>
            <button type="submit">L?c</button>
        </form>
    </div>
    </body>
</html>
