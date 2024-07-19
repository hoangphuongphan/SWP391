<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Food" %>
<%@page import="Model.Shop" %>
<%@page import="java.util.List" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        .search-results {
            margin: 20px;
        }
        .food-item, .shop-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }
        .food-item h2, .shop-item h2 {
            font-size: 1.5em;
            color: #333;
        }
        .food-item p, .shop-item p {
            color: #666;
        }
        .food-item form, .shop-item form {
            margin-top: 10px;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <div class="container search-results">
        <h1 class="mb-4">Search Results</h1>
        <div class="row">
            <%
                List<Food> searchResults = (List<Food>) request.getAttribute("searchResults");
                List<Shop> ShopSearch = (List<Shop>) request.getAttribute("ShopList");
                if (searchResults != null && !searchResults.isEmpty()) {
                    for (Food food : searchResults) {
            %>
            <div class="col-md-4">
                <div class="food-item">
                    <h2><%= food.getName() %></h2>
                    <p>Price: <%= food.getPrice() %></p>
                    <form action="/SWP391/ShowFood">
                        <input type="hidden" name="FoodID" value="<%=food.getID()%>">
                        <button type="submit" class="btn-custom">Food Information</button>
                    </form>
                </div>
            </div>
            <%}} 
                if(ShopSearch != null && !ShopSearch.isEmpty()){
                    for(Shop shop : ShopSearch){ %>
            <div class="col-md-4">
                <div class="shop-item">
                    <h2><%= shop.getName() %></h2>
                    <p>Location: <%= shop.getLocation() %></p>
                    <form action="/SWP391/ShowShop">
                        <input type="hidden" name="ShopID" value="<%=shop.getShopID()%>">
                        <button type="submit" class="btn-custom">Shop Information</button>
                    </form>
                </div>
            </div>
            <%}} %>
        </div>
    </div>
</body>
</html>
