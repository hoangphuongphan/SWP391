    <%-- 
    Document   : newjsp
    Created on : Jun 12, 2024, 6:34:19 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Food" %>
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
        if (searchResults != null && !searchResults.isEmpty()) {
            for (Food food : searchResults) {
        %>
        <div class="food-item">
            <h2><%= food.getName() %></h2>
            <p>Price: <%= food.getPrice() %></p>
            <!-- Hiển thị các thông tin khác về mỗi món ăn -->
        </div>
        <% 
            }
        } else {
        %>
        <p>No results found.</p>
        <% } %>
    </div>
</body>
</html>
