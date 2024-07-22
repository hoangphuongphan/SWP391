<%-- 
    Document   : Profile
    Created on : Jul 19, 2024, 12:39:53 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shipper" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%
            Shipper ship = (Shipper) session.getAttribute("currentShipper");
        %>
        <jsp:include page="navbar.jsp"/>
        <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <img src="placeholder.png" class="rounded-circle img-fluid" alt="placeholder.png">
                </div>
                <div class="card-body text-center">
                    <h5 class="card-title">Username : <%=ship.getUsername()%></h5>
                    <p class="card-text">Full Name : <%=ship.getName()%></p>
                    <p class="card-text">Vehicle ID : <%=ship.getVehicleID()%></p>
                    <p class="card-text"><small class="text-muted">Email : <%=ship.getEmail()%></small></p>
                    <a href="/SWP391/Shipper/ProfileUpdate.jsp">Change Profile</a>
                    <a href="/SWP391/Shipper/UpdatePassword.jsp">Change Password</a>
                </div>
            </div>
        </div>
    </div>
</div>
    </body>
</html>
