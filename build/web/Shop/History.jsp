<%-- 
    Document   : History
    Created on : Jul 14, 2024, 11:07:31 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Order" %>
<%@page import="Model.Shop" %>
<%@page import="Dao.OrderDao" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/SWP391/Shop/css/homeMain.css"/>
    </head>
    <body>
        <%
            Shop current = (Shop) session.getAttribute("currentShop");
            ArrayList<Order> history = new OrderDao().getHistory(current.getShopID(), "Shop");
        %>
        <h1>History</h1>
        <div class="container">
            <div class="order-list">
                <div style="display: flex; flex-wrap: wrap;">
                    <%for(Order order : history){%>
                    <div class="block">
                    <form action="/SWP391/ShowShopOrderDetails">
                        <input name="orderID" type="hidden" value="<%=order.getOrderID()%>"/>
                        <%=order%><br>
                        <button class="bill" type="submit">Detail</button>
                        </form>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>
