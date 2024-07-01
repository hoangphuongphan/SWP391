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
                <script>
                    var status = document.getElementById("hidden-st").value;
                    
                    function submitForm() {
                        document.getElementById("StatusForm").submit();
                    }
                    
                    function setDefault(){
                        if(status == "1")
                            document.getElementById("st-radio-1").checked = true;
                        else if (status == "2")
                            document.getElementById("st-radio-2").checked = true;
                    }
                    window.onload = setDefault();
                </script>
    </body>
</html>
