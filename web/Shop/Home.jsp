<%-- 
    Document   : Home
    Created on : Jun 19, 2024, 12:32:29 AM
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
        OrderDao dao = new OrderDao();
        Shop current = (Shop) session.getAttribute("currentShop");
        ArrayList<Order> list = dao.getOrderList(current.getShopID(),"Shop");
        %>
        <div class="container">
        <div class="orderinfo">
            <h1>Orders</h1>
            <div class="order-list">
                <div class="left-clm">

                </div>
                <div class="right-clm">
                    <%for(Order order : list){%>
                    <div class="block">
                    <form action="/SWP391/ShowShopOrderDetails">
                        <input name="orderID" type="hidden" value="<%=order.getOrderID()%>"/>
                        <%=order%><br>
                        <button class="bill" type="submit">Detail</button>
                        </form>
                        <form action="/SWP391/DenyOrder">
                            <input name="orderID" type="hidden" value="<%=order.getOrderID()%>"/>
                            <button class="bill" type="submit">Deny</button>
                        </form>
                        </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>
