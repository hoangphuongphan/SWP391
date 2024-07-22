<%-- 
    Document   : Shipper
    Created on : Jul 2, 2024, 5:12:54 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.ShipperDao" %>
<%@page import="Model.Shipper" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Shipper Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .profile {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .avatar img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 2px solid #007bff;
            margin-bottom: 20px;
        }
        .information h1, .information h2 {
            color: #333;
            text-align: center;
        }
        .information h2 {
            margin-top: 10px;
            font-size: 1.2em;
        }
        form {
            margin-top: 20px;
        }
        select, input[type="submit"] {
            margin-top: 10px;
            padding: 10px;
            font-size: 1em;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container">
    <div class="profile">
        <%  
            ShipperDao dao = new ShipperDao();
            Shipper ship = dao.getShipperByID(Integer.parseInt(request.getParameter("ShipperID")));
        %>
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
            <jsp:include page="homefooter.jsp"/>
</body>
</html>
