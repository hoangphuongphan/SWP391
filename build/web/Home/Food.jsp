<%-- 
    Document   : Food
    Created on : Jun 25, 2024, 1:32:29 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Food" %>
<%@page import="Dao.FoodDao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%Food food = new FoodDao().getFoodByID(Integer.parseInt(request.getParameter("FoodID")));%>
        <div class="container">
            <div class="logo">
                <img src="<%=food.getImgurl()%>" alt="alt"/>
            </div>
            <div class="information">
                <h1><%=food.getName()%></h1>
                <h2><%=food.getPrice()%></h2>
            </div>
        </div>
    </body>
</html>
