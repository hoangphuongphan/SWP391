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
        #homebody{
            width: 100%;
        }
        img{
            height: 200px;
            width: auto;
        }
        .image-container {
            overflow: hidden;
            height: 200px;
        }

        .detail-box {
            display: none;
            transition: opacity 0.3s linear;
            z-index: 10;
        }

        .image-container:hover>.detail-box {
            display: block;
        }
        .row-flex-box {
            display: flex;
            flex-wrap: wrap;
        }
    </style>
    <body>
        <jsp:include page="navbar.jsp"/>
        <jsp:include page="searchbar.jsp"/>
        <jsp:include page="homebanner.jsp"/>
        <c:set var="ffl" value="${ffl}"/>
        <c:set var="nfl" value="${nfl}"/>
        <div class="container px-4" id="homebody">
            <div class="container col-lg-12 m-4" style="color: blanchedalmond" id="feature-food-container">
                <div class="container col-lg-10 border-bottom-0 m-auto" 
                     style="background-color: #9299ff; border-start-end-radius: 10px; border-start-start-radius: 10px;">
                    <div class="p-3 flex-fill" style="text-align: left; color: #ffea03; font-weight: bold">
                        <h4>What to eat today</h4>
                    </div>
                </div>
                <div class="row row-flex-box col-lg-10 p-1 m-auto center-block d-flex justify-content-around
                     bg-light border-top-0" style="border-end-start-radius: 10px; border-end-end-radis:10px">
                    <c:forEach var="ffl" items="${ffl}">
                        <div class="image-container d-inline-flex justify-content-around m-auto border rounded col-lg-5 p-1"
                             style="background-color: #efefef;">
                            <img src="${ffl.imgurl}"
                                 alt="alt" class="img d-inline-block" />
                            <div class="detail-box d-inline-block">
                                <h4 style="font-weight: bold">${ffl.foodName}</h4>
                                <p>Price: ${ffl.price}</p>
                                <p>Shop: ${ffl.shopName}</p>
                                <form action="/SWP391/ShowFood">
                                    <input type="hidden" name="FoodID" value="${ffl.foodid}">
                                    <input class="form-control btn btn-primary btn-sm btn-block flex-fill" type="submit"
                                           value="Food Information" style="text-align: center; color: #efefef" />
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="container col-lg-12 m-4" style="color: blanchedalmond" id="new-food-container">
                <div class="container col-lg-10 border-bottom-0 m-auto" 
                     style="background-color: #9299ff; border-start-end-radius: 10px; border-start-start-radius: 10px;">
                    <div class="p-3 flex-fill" style="text-align: left; color: #ffea03; font-weight: bold">
                        <h4>New food on menu</h4>
                    </div>
                </div>
                <div class="row row-flex-box col-lg-10 p-1 m-auto center-block d-flex justify-content-around
                     bg-light border-top-0" style="border-end-start-radius: 10px; border-end-end-radis:10px">
                    <c:forEach var="nfl" items="${nfl}">
                        <div class="image-container d-inline-flex justify-content-around m-auto border rounded col-lg-5 p-1"
                             style="background-color: #efefef;">
                            <img src="${nfl.imgurl}"
                                 alt="alt" class="img d-inline-block" />
                            <div class="detail-box d-inline-block">
                                <h4 style="font-weight: bold">${nfl.foodName}</h4>
                                <p>Price: ${nfl.price}</p>
                                <p>Shop: ${nfl.shopName}</p>
                                <form action="/SWP391/ShowFood">
                                    <input type="hidden" name="FoodID" value="${nfl.foodid}">
                                    <input class="form-control btn btn-primary btn-sm btn-block flex-fill" type="submit"
                                           value="Food Information" style="text-align: center; color: #efefef" />
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="container col-lg-12 m-4" style="color: blanchedalmond">

            </div>
        </div>
        <jsp:include page="homefooter.jsp"/>
    </body>
</html>