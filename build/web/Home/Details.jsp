<%-- 
    Document   : Details
    Created on : Jun 13, 2024, 11:20:52 PM
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
        <link rel="stylesheet" href="css/detailMain.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%
        User current = (User) session.getAttribute("currentUser");
        int orderID =  Integer.parseInt(request.getParameter("orderID"));
        Order order = new OrderDao().getOrderByID(orderID);
        FoodDao dao = new FoodDao();
        int total = 0;
        int amount = 0;
        %>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <h1>Billing</h1>
            <div class="left box">
                <h2>Bill of <%=current.getName()%></h2>
                <div class="item">
                    <div class="itemname">Food</div>
                    <div class="itemvalue">Price</div>
                </div>
                <%for(HashMap.Entry<Integer,Integer> entry : order.getOrder().entrySet()){
                Food food = dao.getFoodByID(entry.getKey());
                total += food.getPrice()*entry.getValue();
                amount += entry.getValue();
                %>
                <div class="item">
                    <div class="itemname"><%=food.getName()%></div>
                    <div class="itemvalue"><%=entry.getValue()%></div>
                </div>
                <%}%>
                <div style="border-bottom: 1px solid black"></div>
                <div class="item">
                    <div class="itemname"><%=amount%></div>
                    <div class="itemvalue"><%=total%></div>
                </div>
            </div>
            <div class="right box">
                <h2><%=order.getTime()%></h2>
                <h2><%=order.getStatus()%></h2>
            </div>
        </div>
    </body>
</html>
