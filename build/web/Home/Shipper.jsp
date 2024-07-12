<%-- 
    Document   : Shipper
    Created on : Jul 2, 2024, 5:12:54 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.ShipperDao" %>
<%@page import="Model.Shipper" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%  
            ShipperDao dao = new ShipperDao();
            Shipper ship = dao.getShipperByID(Integer.parseInt(request.getParameter("ShipperID")));
        %>
        <div class="container">
            <div class="profile">
                <div class="avatar">
                    <img src="<%=ship.getAvatar()%>" alt="avatar">
                </div>
                <div class="information">
                    <h1><%=ship.getName()%></h1>
                    <h2><%=ship.getVehicleID()%></h2>
                    <h2><%=ship.getPhone()%></h2>
                </div>
                <form action="/SWP391/ReportShipper">
                <input type="hidden" name="ShipID" value="<%=ship.getID()%>"/>
                <select name="content">
                    <option value="steal" selected="true">The Food was stolen</option>
                    <option value="late">My Food was delivered intentionally late</option>
                </select>
                <input type="submit" value="Report"/>
            </form>
            </div>
        </div>
    </body>
</html>
