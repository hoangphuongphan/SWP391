<%-- 
    Document   : searchbar
    Created on : Jun 16, 2024, 1:40:32?PM
    Author     : Admin
--%>

<!DOCTYPE html>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Category" %>
<%@page import="Dao.CategoryDao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="SWP391/Home/css/style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<Category> cates = new CategoryDao().getAllCategories();
        %>
        <div class="search-container">
        <!-- Ph?n tìm ki?m theo t? khóa -->
        <form action="/SWP391/SearchServlet" method="get">
            <input type="text" name="search-words" placeholder="Find your favourite food and restaurent">
            <button type="submit">Tìm ki?m</button>
        </form>
        
        <!-- Ph?n ch?n lo?i món ?n -->
        <form action="/SWP391/SearchServlet" method="get">
            <select name="category">
                <option value="0">Category</option>
                <!-- Danh sách các lo?i món ?n s? ???c thêm b?ng mã Java trong servlet -->
                <%for(Category cate : cates){%>
                    <option value="<%=cate.getCategoryID()%>"><%=cate.getName()%></option>
                <%}%>
            </select>
            <button type="submit">L?c</button>
        </form>
    </div>
    </body>
</html>
