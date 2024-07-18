<%-- 
    Document   : History
    Created on : Jul 14, 2024, 11:07:31 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Order" %>
<%@page import="Model.Shop" %>
<%@page import="Dao.OrderDao" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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
        .order-list {
            margin-top: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
        .block {
            width: 300px;
            margin: 10px;
            padding: 15px;
            background-color: #f1f1f1;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .block h4 {
            margin-bottom: 10px;
        }
        .block button {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    
    <% Shop current = (Shop) session.getAttribute("currentShop");
       ArrayList<Order> history = new OrderDao().getHistory(current.getShopID(), "Shop");
    %>
    
    <div class="container">
        <h1>Order History</h1>
        <div class="order-list">
            <% for(Order order : history) { %>
                <div class="block">
                    <h4>Order ID: <%= order.getOrderID() %></h4>
                    <p>Status: <%= order.getStatus() %></p>
                    <p>Date: <%= order.getTime() %></p>
                    <form action="/SWP391/ShowShopOrderDetails">
                        <input name="orderID" type="hidden" value="<%= order.getOrderID() %>"/>
                        <button class="btn btn-primary btn-sm" type="submit">Detail</button>
                    </form>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
