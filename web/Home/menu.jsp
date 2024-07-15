<%-- 
    Document   : menu
    Created on : May 23, 2024, 7:13:02 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <title>Menu Page</title>
    </head>
    <style>
        img{
            height: 200px;
            width: auto;
        }
    </style>
    <script>
        const box = document.getElementById('box');
        const hiddenBox = document.getElementById('hidden-box');

        box.addEventListener('mouseenter', () => {
            hiddenBox.style.visibility = 'visible'; // Show the hidden box
        });

        box.addEventListener('mouseleave', () => {
            hiddenBox.style.visibility = 'hidden'; // Hide the hidden box
        });
    </script>
    <body>
        <jsp:include page="navbar.jsp"/>
        <jsp:include page="searchbar.jsp"/>
        <jsp:include page="homebanner.jsp"/>
        
        <div class="container d-flex p-5 flex-collumn" id="feature-food-container">
            <c:set var="ffl" value="${requestScope.ffl}"/>
            <div class="col-10 p-2 flex-fill" style="background-color: #7f84fa">
                <div class="p-3 flex-fill" style="text-align: left; color: #ffea03; font-weight: bold">
                    <h3>What to eat today</h3>
                </div>
            </div>
            <div class="col-10 p-1 d-flex justify-content-around">
                <c:forEach var="items" items="${pageScope.ffl}">
                    <div class="border rounded col-2 p-1 d-inline-flex" style="background-color: #efefef; color: #004f73" id="box">
                        <div class="box" id="box">
                            <img src="${items.imgUrl}" alt="alt"/>
                        </div>
                        <div class="hidden-box" id="hidden-box"
                             style="background-color: #479ad6; color: #ed3235; transition: transform 0.5s ease-in; position: relative; visibility: hidden">
                            <img src="${items.imgUrl}" alt="alt"/>
                            <h4 style="font-weight: bold">${items.name}</h4>
                            <p>${items.price}</p>
                            <form action="/SWP391/ShowFood">
                                <input type="hidden" name="FoodID" value="${items.ID}">
                                <input class= "form-control btn btn-primary btn-sm btn-block flex-fill" 
                                       type="submit" value="Food Information" style="text-align: center; color: #cc0033"/>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="container d-flex p-5 flex-collumn" id="new-food-container">
            <c:set var="nfl" value="${requestScope.nfl}"/>
            <div class="col-10 p-2 flex-fill" style="background-color: #7f84fa">
                <div class="p-3 flex-fill" style="text-align: left; color: #ffea03; font-weight: bold">
                    <h3>New food on menu</h3>
                </div>
            </div>
            <div class="col-10 p-1 d-flex justify-content-around">
                <c:forEach var="items" items="${pageScope.ffl}">
                    <div class="border rounded col-2 p-1 d-inline-flex" style="background-color: #efefef; color: #004f73" id="box">
                        <div class="box" id="box">
                            <img src="${items.imgUrl}" alt="alt"/>
                        </div>
                        <div class="hidden-box" id="hidden-box"
                             style="background-color: #479ad6; color: #ed3235; transition: transform 0.5s ease-in; position: absolute">
                            <img src="${items.imgUrl}" alt="alt"/>
                            <h4 style="font-weight: bold">${items.name}</h4>
                            <p>${items.price}</p>
                            <form action="/SWP391/ShowFood">
                                <input type="hidden" name="FoodID" value="${items.ID}">
                                <input class= "form-control btn btn-primary btn-sm btn-block flex-fill" 
                                       type="submit" value="Food Information" style="text-align: center; color: #cc0033"/>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>s
        <jsp:include page="homefooter.jsp"/>
    </body>
</html>
