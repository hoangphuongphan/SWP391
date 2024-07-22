<%-- 
    Document   : ProfileUpdate
    Created on : Jul 22, 2024, 8:58:57 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shipper" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%
            Shipper ship = (Shipper) session.getAttribute("currentShipper");
        %>
        <%@include file="navbar.jsp" %>
        <div class="container mt-5">
    <form action="/SWP391/ChangeShipInfo" method="POST">
        <div class="form-group">
            <label for="displayName">Display Name</label>
            <input type="text" name="displayName" class="form-control" id="displayName" value="<%=ship.getName()%>" placeholder="Enter your display name"/>
        </div>
        <div class="form-group">
            <label for="VehicleID">Display Name</label>
            <input type="text" name="VehicleID" class="form-control" id="VehicleID" value="<%=ship.getVehicleID()%>" placeholder="Enter your Vehicle ID"/>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" name="phone" class="form-control" id="phone" value="<%=ship.getPhone()%>" placeholder="Enter your phone number here"/>
        </div>
        <button type="submit" class="btn btn-primary">Update profile</button>
    </form>
</div>
    </body>
</html>
