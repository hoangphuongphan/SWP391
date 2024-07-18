<%-- 
    Document   : Order
    Created on : Jun 13, 2024, 10:03:36 PM
    Author     : phoan
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Order"%>
<%@page import="Model.User"%>
<%@page import="Dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<%
    OrderDao dao = new OrderDao();
    User current = (User) session.getAttribute("currentUser");
    ArrayList<Order> list = dao.getOrderList(current.getID(), "User");
    ArrayList<Order> walletList = (ArrayList<Order>) session.getAttribute("CurrentOrders");
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Orders</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/orderMain.css">
    <style>
        .container {
            margin-top: 20px;
        }
        .orderinfo {
            margin-bottom: 20px;
        }
        .order-list {
            display: flex;
            justify-content: space-between;
        }
        .block {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .bill {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container">
    <div class="orderinfo">
        <h1>My Orders</h1>
        <div class="order-list">
            <div class="left-clm">
                <!-- Left column content (if any) -->
            </div>
            <div class="right-clm">
                <% for (Order order : list) { %>
                    <form action="/SWP391/ShowDetails" method="get">
                        <div class="block">
                            <input name="orderID" type="hidden" value="<%= order.getOrderID() %>"/>
                            <p><%= order %></p>
                            <button class="bill" type="submit">Details</button>
                        </div>
                    </form>
                <% } %>
            </div>
        </div>
    </div>
    <div>
        <% if (walletList != null) { %>
            <% for (Order order : walletList) { %>
                <form action="/SWP391/RequireTransaction" method="post">
                    <div class="block">
                        <input name="orderID" type="hidden" value="<%= order.getOrderID() %>"/>
                        <p><%= order %></p>
                        <button class="bill" type="submit">Confirm Receive</button>
                    </div>
                </form>
            <% } %>
        <% } %>
    </div>
</div>
</body>
</html>
