<%-- 
    Document   : CreateFood
    Created on : Jun 28, 2024, 12:56:39 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Category" %>
<%@page import="Dao.CategoryDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Create Food</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <style>
            .container {
                margin-top: 20px;
            }
            form {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                font-weight: bold;
            }
            .form-group img {
                display: block;
                margin-top: 10px;
            }
            .btn-primary {
                background-color: #9299ff;
                border: none;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <%
            ArrayList<Category> cates = new CategoryDao().getAllCategories();
        %>
        <div class="container">
            <h1>Create Food</h1>
            <form action="/SWP391/CreateFood" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="uploadImage">Food Image</label>
                    <img src="" id="uploadPreview" style="width: 100px; height: 100px;" class="img-thumbnail" />
                    <input id="uploadImage" type="file" name="myPhoto" class="form-control-file" onchange="PreviewImage();" />
                </div>
                <div class="form-group">
                    <label for="FoodName">Food Name</label>
                    <input type="text" name="FoodName" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="Price">Price</label>
                    <input type="text" name="Price" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="Category">Category</label>
                    <select name="Category" class="form-control">
                        <% for (Category cate : cates) { %>
                            <option value="<%=cate.getCategoryID()%>"><%=cate.getName()%></option>
                        <% } %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Create</button>
            </form>
        </div>

        <script>
            function PreviewImage() {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

                oFReader.onload = function (oFREvent) {
                    document.getElementById("uploadPreview").src = oFREvent.target.result;
                };
            }
        </script>
    </body>
</html>
