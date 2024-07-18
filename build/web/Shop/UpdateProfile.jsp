<%-- 
    Document   : UpdateProfile
    Created on : Jun 26, 2024, 3:09:34 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shop" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 20px;
            max-width: 500px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        #uploadPreview {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <%
            Shop shop = (Shop) session.getAttribute("currentShop");
        %>
    <jsp:include page="navbar.jsp"/>
    <div class="container">
        <h1>Update Profile</h1>
        <form action="/SWP391/ChangeShopInfo" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="myPhoto">Shop Logo:</label><br>
                <img src="<%=shop.getImgurl()%>" id="uploadPreview" style="width: 100px; height: 100px;" /><br>
                <input id="uploadImage" type="file" name="myPhoto" onchange="previewImage();" accept="image/*"><br>
            </div>
            <div class="form-group">
                <label for="Name">Name:</label>
                <input type="text" id="Name" name="Name" class="form-control" value="<%=shop.getName()%>" required>
            </div>
            <div class="form-group">
                <label for="Location">Location:</label>
                <input type="text" id="Location" name="Location" class="form-control" value="<%=shop.getLocation()%>" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <script>
        function previewImage() {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById("uploadPreview").src = e.target.result;
            };
            reader.readAsDataURL(document.getElementById("uploadImage").files[0]);
        }
    </script>
</body>
</html>
