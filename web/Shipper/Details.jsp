<%-- 
    Document   : Details
    Created on : Jun 22, 2024, 4:20:13 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Order" %>
<%@page import="Dao.OrderDao" %>
<%@page import="Model.Food" %>
<%@page import="Dao.FoodDao" %>
<%@page import="Model.Shipper" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/SWP391/Shop/css/detailMain.css"/>
    </head>
    <body>
        <%
        Shipper current = (Shipper) session.getAttribute("currentShipper");
        int orderID =  Integer.parseInt(request.getParameter("orderID"));
        Order order = new OrderDao().getOrderByID(orderID);
        FoodDao dao = new FoodDao();
        int total = 0;
        int amount = 0;
        %>
        <jsp:include page="navbar.jsp"/>
        <div class="container">
            <h1>Billing</h1>
            <div class="left box">
                <h2>Bill for <%=current.getName()%></h2>
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
                <h2>Ship to <%=order.getShipLocation()%></h2>
                <h2>Take order at <%=order.getShop().getLocation()%></h2>
                <h2>Call User phone number : <%=order.getUser().getPhone()%></h2>
            </div>
            <%switch(order.getStatus()){
                case "Cooking":%>
            <form action="/SWP391/shipperReceive">
                <input name="orderID" type="hidden" value="<%=order.getOrderID()%>"/>
                <input type="submit" value="Receive Order" />
            </form>
                <%break;
                case "Shipping":%>
                <form action="/SWP391/shipperDone">
                <input name="orderID" type="hidden" value="<%=order.getOrderID()%>"/>
                <input type="submit" value="Done Order" />
            </form>
            <%break;
                }%>
        </div>
    </body>
</html>
