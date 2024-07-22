<%-- 
    Document   : Order
    Created on : Jun 13, 2024, 10:03:36 PM
    Author     : phoan
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="Model.Order"%>
<%@page import="Model.User"%>
<%@page import="Dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Orders</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .orderinfo {
            margin-bottom: 20px;
        }
        .order-list {
            display: flex;
            flex-direction: column;
        }
        .block {
            margin-bottom: 15px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .bill {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 1em;
            text-align: center;
        }
        .bill:hover {
            background-color: #0056b3;
        }
        .block p {
            margin: 0;
            font-size: 1em;
            color: #333;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>
<%
    OrderDao dao = new OrderDao();
    User current = (User) session.getAttribute("currentUser");
    ArrayList<Order> list = dao.getOrderList(current.getID(), "User");
    ArrayList<Order> walletList = (ArrayList<Order>) session.getAttribute("CurrentOrders");
%>
<div class="container">
    <div class="orderinfo">
        <h1>My Orders</h1>
        <div class="order-list">
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
    <jsp:include page="homefooter.jsp"/>
</body>
</html>
