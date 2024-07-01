<%-- 
    Document   : CreateFood
    Created on : Jun 28, 2024, 12:56:39 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Category" %>
<%@page import="Dao.CategoryDao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ArrayList<Category> cates = new CategoryDao().getAllCategories();
        %>
        <form action="/SWP391/CreateFood" method="post" enctype="multipart/form-data">
            <label>Food Image</label>
            <img src="" id="uploadPreview" style="width: 100px; height: 100px;" /><br>
            <input id="uploadImage" type="file" name="myPhoto" onchange="PreviewImage();" /><br>
            <label>Food name</label>
            <input type="text" name="FoodName"><br>
            <label>Price</label>
            <input type="Price" name="Price"><br>
            <label>Category</label>
            <select name="Category">
                <%for(Category cate : cates){%>
                    <option value="<%=cate.getCategoryID()%>"><%=cate.getName()%></option>
                <%}%>
            </select><br>
            <input type="submit" value="Create">
        </form>
            <script>
                function PreviewImage() {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

                oFReader.onload = function (oFREvent) {
                    document.getElementById("uploadPreview").src = oFREvent.target.result;
                };
            };
            </script>
    </body>
</html>
