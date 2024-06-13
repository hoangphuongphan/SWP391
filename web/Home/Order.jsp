<%-- 
    Document   : Order
    Created on : Jun 13, 2024, 10:03:36 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Order" %>
<%@page import="Model.User" %>
<%@page import="Dao.OrderDao" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <%
    OrderDao dao = new OrderDao();
    User current = (User) session.getAttribute("currentUser");
    ArrayList<Order> list = dao.getOrderList(current.getID());
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/orderMain.css">
    </head>
    <body>
        <div class="container">
        <div class="orderinfo">
            <h1>Orders</h1>
            <div class="order-list">
                <div class="left-clm">

                </div>
                <div class="right-clm">
                    <%for(Order order : list){%>
                        <div class="block">
                        <%=order%><br>
                        <button class="bill">Detail</button>
                        </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
