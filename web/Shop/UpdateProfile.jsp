<%-- 
    Document   : UpdateProfile
    Created on : Jun 26, 2024, 3:09:34 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shop" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Shop shop = (Shop) session.getAttribute("currentShop");
        %>
        <form action="/SWP391/ChaneShopInfo" method="post" enctype="multipart/form-data">
            <img src="<%=shop.getImgurl()%>" id="uploadPreview" style="width: 100px; height: 100px;" />
            <input id="uploadImage" type="file" name="myPhoto" onchange="PreviewImage();" /><br>
            <label>Name:</label>
            <input name="Name" value="<%=shop.getName()%>"/><br>
            <label>Location</label>
            <input name="Location" value ="<%=shop.getLocation()%>"/><br>
            <input type="submit" value="submit"/>
        </form>
        <script type="text/javascript">

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
