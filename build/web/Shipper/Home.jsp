<%-- 
    Document   : Home
    Created on : Jun 21, 2024, 5:55:37 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Order" %>
<%@page import="Model.Shipper" %>
<%@page import="Dao.OrderDao" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="/SWP391/Logout">Logout</a>
        <%
        OrderDao dao = new OrderDao();
        Shipper current = (Shipper) session.getAttribute("currentShipper");
        ArrayList<Order> list = dao.getOrderList(current.getID(),"Shipper");
        %>
        <div class="container">
            <div>
                <%if(list.size()<1){%>
                <form id="StatusForm" action="/SWP391/setShipperStatus">
                        <input type="hidden" id="hidden-st" value="<%=current.getStaus()%>">
                        <label>Status</label>
                        <input id="st-radio-1" type="radio" name="status" value="1" onchange="submitForm()">
                        <label for="st-radio">On</label>
                        <input id="st-radio-2" type="radio" name="status" value="2" onchange="submitForm()">
                        <label for="st-radio">Off</label>
                </form>
                <%}%>
            </div>
            <%for(Order order : list){%>
                    <div class="block">
                    <form action="/SWP391/ShowShipperOrderDetails">
                        <input name="orderID" type="hidden" value="<%=order.getOrderID()%>"/>
                        <%=order%><br>
                        <button class="bill" type="submit">Detail</button>
                        </form>
                        </div>
                    <%}%>
            <div>
                
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
