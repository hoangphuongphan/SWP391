<%-- 
    Document   : navbar
    Created on : May 23, 2024, 8:58:50 PM
    Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .navbar-brand img {
        height: 40px;
        width: auto;
    }
    .navbar-custom{
        background-color: #0062cc;
    }
    .navbar-custom .nav-link, .navbar-custom .btn, .navbar-custom .navbar-brand{
        color: blanchedalmond;
    }
</style>
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="ShowHome"><img class="" src="/SWP391/FoodPal.png" alt="alt"/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item col-2">
                    <a class="nav-link active" aria-current="page" href="/SWP391/ShowHome">Home</a>
                </li>
                <li class="nav-item col-2">
                    <a class="nav-link" href="/SWP391/ShowCart">Cart</a>
                </li>
                <li class="nav-item col-2">
                    <a class="nav-link" href="/SWP391/ShowOrders">Orders</a>
                </li>
                <li class="nav-item col-2">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item col dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false">
                        <c:choose>
                            <c:when test="${not empty sessionScope.currentUser.getName()}">
                                Welcome ${sessionScope.currentUser.getName()}
                            </c:when>
                            <c:otherwise>
                                Welcome ${sessionScope.currentUser.getEmail()}
                            </c:otherwise>
                        </c:choose>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="/SWP391/Home/TopUp.jsp">Top Up</a></li>
                        <li><a class="dropdown-item" href="/SWP391/UsrInfo">Profile</a></li>
                        <li><a class="dropdown-item" href="/SWP391/Logout">Logout</a></li>
                        <li><a class="dropdown-item" href="/SWP391/Home/Ticket.jsp">Send Ticket</a></li>
                    </ul>
                </li>
                <li class="nav-item col-1">
                    <i class="bi bi-search"/>
                </li>
            </ul>
            <form class="form-inline ml-auto search-bar" id="search-form" action="/SWP391/SearchServlet" method="get">
                <input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light my-2" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>