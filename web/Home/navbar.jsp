<%-- 
    Document   : navbar
    Created on : May 23, 2024, 8:58:50 PM
    Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .navbar-brand img {
        height: 40px;
        width: auto;
    }
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="ShowHome"><img class="" src="FoodPal.png" alt="alt"/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="ShowHome">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Menu</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false">
                        Welcome ${user.displayName}
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="UsrInfo">Profile</a></li>
                        <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
