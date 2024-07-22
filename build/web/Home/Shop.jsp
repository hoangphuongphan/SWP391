<%-- 
    Document   : Shop
    Created on : Jun 25, 2024, 12:07:47 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shop" %>
<%@page import="Model.Food" %>
<%@page import="Dao.ShopDao" %>
<%@page import="Dao.FoodDao" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Shop Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .profile {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .avatar img {
            width: 100%;
            border-radius: 8px;
            object-fit: cover;
        }
        .information h1, .information h2 {
            color: #333;
            text-align: center;
        }
        .information h2 {
            margin-top: 10px;
            font-size: 1.2em;
        }
        form {
            margin-top: 20px;
        }
        select, input[type="submit"] {
            margin-top: 10px;
            padding: 10px;
            font-size: 1em;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .food-list .box {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 15px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .food-list .box form input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .food-list .box form input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container">
    <div class="profile">
        <%  
            int ShopID = Integer.parseInt(request.getParameter("ShopID"));
            Shop shop = new ShopDao().getShopByID(ShopID);
            ArrayList<Food> foods = new FoodDao().getFoodByShop(shop.getShopID());
        %>
        <div class="avatar">
            <img src="<%=shop.getImgurl()%>" alt="Shop Image">
        </div>
        <div class="information">
            <h1><%=shop.getName()%></h1>
            <h2><%=shop.getLocation()%></h2>
            <h2><%=shop.getPhone()%></h2>
        </div>
        <form action="/SWP391/ReportShop">
            <input type="hidden" name="ShopID" value="<%=shop.getShopID()%>"/>
            <select name="content">
                <option value="scam" selected="true">The Shop was a scam</option>
                <option value="bad">The Food of shop went bad or was poisoned</option>
                <option value="late">My Food was delivered intentionally late</option>
            </select>
            <input type="submit" value="Report"/>
        </form>
        <div class="food-list">
            <% for(Food food : foods) { %>
                <div class="box">
                    <img src="<%=food.getImgurl()%>"
                                 alt="alt" class="img d-inline-block" />
                    <h3><%=food.getName()%></h3>
                    <p>Price: <%=food.getPrice()%></p>
                    <form action="/SWP391/ShowFood">
                        <input type="hidden" name="FoodID" value="<%=food.getID()%>">
                        <input type="submit" value="Food Information"/>
                    </form>
                </div>
            <% } %>
        </div>
    </div>
</div>
        <jsp:include page="homefooter.jsp"/>
</body>
</html>
