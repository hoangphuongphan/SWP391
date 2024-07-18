<%-- 
    Document   : Details
    Created on : Jun 22, 2024, 4:20:13 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Order" %>
<%@page import="Dao.OrderDao" %>
<%@page import="Model.Food" %>
<%@page import="Dao.FoodDao" %>
<%@page import="Model.Shop" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order Details</title>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/SWP391/Shop/css/detailMain.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #343a40;
        }
        .container {
            margin-top: 20px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .box {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #f1f1f1;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .itemname {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    
    <% Shop current = (Shop) session.getAttribute("currentShop");
       int orderID = Integer.parseInt(request.getParameter("orderID"));
       Order order = new OrderDao().getOrderByID(orderID);
       FoodDao dao = new FoodDao();
       int total = 0;
       int amount = 0;
    %>
    
    <div class="container">
        <h1>Billing Details</h1>
        <div class="row">
            <div class="col-lg-8">
                <div class="box">
                    <h2>Bill for <%= current.getName() %></h2>
                    <div class="item">
                        <div class="itemname">Food</div>
                        <div class="itemvalue">Price</div>
                    </div>
                    
                    <% for (HashMap.Entry<Integer, Integer> entry : order.getOrder().entrySet()) {
                           Food food = dao.getFoodByID(entry.getKey());
                           total += food.getPrice() * entry.getValue();
                           amount += entry.getValue();
                    %>
                    <div class="item">
                        <div class="itemname"><%= food.getName() %></div>
                        <div class="itemvalue">$ <%= entry.getValue() * food.getPrice() %></div>
                    </div>
                    <% } %>
                    
                    <hr>
                    <div class="item">
                        <div class="itemname">Total Items:</div>
                        <div class="itemvalue"><%= amount %></div>
                    </div>
                    <div class="item">
                        <div class="itemname">Total Price:</div>
                        <div class="itemvalue">$ <%= total %></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="box">
                    <h2>Order Details</h2>
                    <div class="item">
                        <div class="itemname">Order Time:</div>
                        <div class="itemvalue"><%= order.getTime() %></div>
                    </div>
                    <div class="item">
                        <div class="itemname">Order Status:</div>
                        <div class="itemvalue"><%= order.getStatus() %></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
