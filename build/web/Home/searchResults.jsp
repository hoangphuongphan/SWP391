    <%-- 
    Document   : newjsp
    Created on : Jun 12, 2024, 6:34:19 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Food" %>
<%@page import="Model.Shop" %>
<%@page  import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Search Results</h1>
    <div id="search-results">
        <% 
        List<Food> searchResults = (List<Food>) request.getAttribute("searchResults");
        List<Shop> ShopSearch = (List<Shop>) request.getAttribute("ShopList");
        if (searchResults != null && !searchResults.isEmpty()) {
            for (Food food : searchResults) {
        %>
        <div class="food-item">
            <h2><%= food.getName() %></h2>
            <p>Price: <%= food.getPrice() %></p>
            <!-- Hiển thị các thông tin khác về mỗi món ăn -->
            <form action="/SWP391/ShowFood">
                                <input type="hidden" name="FoodID" value="<%=food.getID()%>">
                                <input type="submit" value="Food Information"/>
                            </form>
        </div>
            
            <%}%>
        <% 
            }
            if(ShopSearch !=null && !ShopSearch.isEmpty()){
                for(Shop shop : ShopSearch){%>
                <div class="shop-item">
            <h2><%= shop.getName() %></h2>
            <p>Price: <%= shop.getLocation() %></p>
            <!-- Hiển thị các thông tin khác về mỗi món ăn -->
            <form action="/SWP391/ShowShop">
                                <input type="hidden" name="ShopID" value="<%=shop.getShopID()%>">
                                <input type="submit" value="Shop Information"/>
                            </form>
        </div>
                <%}}%>
    </div>
</body>
</html>
