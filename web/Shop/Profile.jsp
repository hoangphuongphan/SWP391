<%-- 
    Document   : Profile
    Created on : Jun 26, 2024, 12:28:20 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shop" %>
<%@page import="Model.Food" %>
<%@page import="Dao.ShopDao" %>
<%@page import="Dao.FoodDao" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shop Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #343a40;
            font-family: Arial, sans-serif;
        }
        .container {
            margin: 20px auto;
            max-width: 800px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .avatar img {
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .information {
            margin-top: 20px;
        }
        .box {
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .food-list {
            margin-top: 20px;
        }
        .food-item {
            background-color: #f1f1f1;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .button-group {
            margin-top: 20px;
        }
        .button-group button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    
    <div class="container">
        <% Shop shop = (Shop) session.getAttribute("currentShop");
           ArrayList<Food> foods = new FoodDao().getFoodByShop(shop.getShopID());
        %>
        <div class="profile">
            <div class="avatar">
                <img src="<%= shop.getImgurl() %>" alt="Shop Avatar">
            </div>
            <div class="information">
                <h1><%= shop.getName() %></h1>
                <h2><%= shop.getLocation() %></h2>
                <h2><%= shop.getPhone() %></h2>
                <h2><%= shop.getEmail() %></h2>
            </div>
            
            <div class="food-list">
                <h3>Menu</h3>
                <button class="btn btn-primary mb-3" id="Createbtn_Click">Create Food</button>
                <% for (Food food : foods) { %>
                    <div class="food-item">
                        <h4><%= food.getName() %></h4>
                        <p><strong>Price:</strong> $ <%= food.getPrice() %></p>
                        <form action="/SWP391/ShowShopFood">
                            <input type="hidden" name="FoodID" value="<%= food.getID() %>">
                            <input type="submit" class="btn btn-info" value="Food Information"/>
                        </form>
                        <form action="/SWP391/DeleteFood">
                            <input type="hidden" name="FoodID" value="<%= food.getID() %>">
                            <input type="submit" class="btn btn-danger" value="Delete"/>
                        </form>
                    </div>
                <% } %>
            </div>
            
            <div class="button-group">
                <button class="btn btn-primary" id="Updatebtn_Click">Update Profile</button>
                <button class="btn btn-secondary" id="UpdatePassbtn_Click">Update Password</button>
                <button class="btn btn-secondary" id="UpdateContbtn_Click">Update Contact</button>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("Updatebtn_Click").addEventListener("click", () => {
            window.location.href = "UpdateProfile.jsp";
        })
        document.getElementById("UpdatePassbtn_Click").addEventListener("click", () => {
            window.location.href = "UpdatePassword.jsp";
        })
        document.getElementById("UpdateContbtn_Click").addEventListener("click", () => {
            window.location.href = "UpdateContact.jsp";
        })
        document.getElementById("Createbtn_Click").addEventListener("click", () => {
            window.location.href = "CreateFood.jsp";
        })
    </script>
</body>
</html>
