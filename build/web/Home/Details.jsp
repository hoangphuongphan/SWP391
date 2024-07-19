<%-- 
    Document   : Details
    Created on : Jun 13, 2024, 11:20:52 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Order" %>
<%@page import="Dao.OrderDao" %>
<%@page import="Model.Food" %>
<%@page import="Dao.FoodDao" %>
<%@page import="Model.User" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <style>
        .container {
            margin-top: 30px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .box {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            margin-bottom: 20px;
        }
        .left {
            background-color: #efefef;
        }
        .right {
            background-color: #efefef;
        }
        .item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
        }
        .itemname, .itemvalue {
            font-weight: bold;
            color: #333;
        }
        .itemvalue {
            text-align: right;
        }
        .item + .item {
            border-top: 1px solid #ddd;
        }
        a {
            color: #007bff;
        }
        a:hover {
            text-decoration: none;
        }
        .right h2 {
            margin-bottom: 10px;
            color: #333;
        }
    </style>
    <body>
        <%@include file="navbar.jsp" %>
        <%
        User current = (User) session.getAttribute("currentUser");
        int orderID =  Integer.parseInt(request.getParameter("orderID"));
        Order order = new OrderDao().getOrderByID(orderID);
        FoodDao dao = new FoodDao();
        int amount = 0;
        %>
        <div class="container">
            <h1>Billing</h1>
            <div class="row">
                <div class="col-md-6 box left">
                    <h2>Bill of <%=current.getName()%></h2>
                    <div class="item">
                        <div class="itemname">Food</div>
                        <div class="itemvalue">Price</div>
                    </div>
                    <%for(HashMap.Entry<Integer,Integer> entry : order.getOrder().entrySet()){
                    Food food = dao.getFoodByID(entry.getKey());
                    amount += entry.getValue();
                    %>
                    <div class="item">
                        <div class="itemname"><%=food.getName()%></div>
                        <div class="itemvalue"><%=entry.getValue()%></div>
                    </div>
                    <%}%>
                    <div style="border-bottom: 1px solid #ddd; margin: 10px 0;"></div>
                    <div class="item">
                        <div class="itemname">Total Items: <%=amount%></div>
                        <div class="itemvalue">Total Price: <%=order.getTotal()%></div>
                    </div>
                </div>
                <div class="col-md-6 box right">
                    <h2>Order Time: <%=order.getTime()%></h2>
                    <h2>Order Status: <%=order.getStatus()%></h2>
                    <h2>Your Shipper:</h2> 
                    <a href="/SWP391/Home/Shipper.jsp?ShipperID=<%=order.getShipper().getID()%>"><%=order.getShipper().getName()%></a>
                </div>
            </div>
        </div>
    </body>
</html>
