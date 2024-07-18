<%-- 
    Document   : Home
    Created on : Jun 19, 2024, 12:32:29 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Order" %>
<%@page import="Model.Shop" %>
<%@page import="Dao.OrderDao" %>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home Page</title>
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        
        <style>
            .container {
                margin-top: 20px;
            }
            .orderinfo {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
            }
            .order-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }
            .left-clm, .right-clm {
                width: 48%;
            }
            .block {
                background-color: #efefef;
                border: 1px solid #ddd;
                border-radius: 10px;
                margin-bottom: 20px;
                padding: 15px;
            }
            .bill {
                background-color: #9299ff;
                color: white;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <%
        OrderDao dao = new OrderDao();
        Shop current = (Shop) session.getAttribute("currentShop");
        ArrayList<Order> list = dao.getOrderList(current.getShopID(), "Shop");
        %>
        <jsp:include page="navbar.jsp"/>
        
        <div class="container">
            <div class="orderinfo">
                <h1>Orders</h1>
                <div class="order-list">
                    <div class="left-clm">
                        <form id="StatusForm" action="/SWP391/SetShopStatus">
                            <input type="hidden" id="hidden-st" value="<%=current.getStatus()%>">
                            <label>Status</label>
                            <input id="st-radio-1" type="radio" name="status" value="1" onchange="submitForm()">
                            <label for="st-radio">On</label>
                            <input id="st-radio-2" type="radio" name="status" value="2" onchange="submitForm()">
                            <label for="st-radio">Off</label>
                        </form>
                    </div>
                    <div class="right-clm">
                        <% for (Order order : list) { %>
                            <div class="block">
                                <form action="/SWP391/ShowShopOrderDetails">
                                    <input name="orderID" type="hidden" value="<%=order.getOrderID()%>"/>
                                    <%=order%><br>
                                    <button class="bill" type="submit">Detail</button>
                                </form>
                                <% if (order.getStatus().equals("Cooking")) { %>
                                    <form action="/SWP391/DenyOrder">
                                        <input name="orderID" type="hidden" value="<%=order.getOrderID()%>"/>
                                        <button class="bill" type="submit">Deny</button>
                                    </form>
                                <% } %>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            var status = document.getElementById("hidden-st").value;

            function submitForm() {
                document.getElementById("StatusForm").submit();
            }

            function setDefault() {
                if (status == "1")
                    document.getElementById("st-radio-1").checked = true;
                else if (status == "2")
                    document.getElementById("st-radio-2").checked = true;
            }
            window.onload = setDefault;
        </script>
    </body>
</html>
