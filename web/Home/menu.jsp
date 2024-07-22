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
        img {
            object-fit: cover;
            height: 100%;
            width: 100%;
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
        
        .image-container {
    overflow: hidden;
    height: 200px; /* Adjust as needed */
    position: relative; /* Required for absolute positioning of .detail-box */
    margin-bottom: 1rem; /* Adds space between the elements */
}

/* Style the image to fit within its container */
.image-container img {
    object-fit: cover; /* Adjust to cover the container */
    width: 100%;
    height: 100%;
    display: block; /* Removes any extra space below the image */
}

/* Style for detail box */
.detail-box {
    display: none;
    position: absolute; /* Position it over the image */
    bottom: 0; /* Position at the bottom of the container */
    left: 0;
    right: 0;
    background-color: rgba(0, 0, 0, 0.6); /* Optional: background color to make text readable */
    color: white; /* Adjust text color for readability */
    padding: 1rem;
    transition: opacity 0.3s linear;
    text-align: center; /* Center text inside the detail-box */
}

/* Show the detail box on hover */
.image-container:hover .detail-box {
    display: block;
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
                <div class="container-fluid border-bottom-0 m-auto"
                     style="background-color: #9299ff; border-start-end-radius: 10px; border-start-start-radius: 10px;">
                    <div class="p-3 flex-fill text-dark" style="text-align: left;; font-weight: bold">
                        <h4>What to eat today</h4>
                    </div>
                </div>
                <div class="row row-flex-box col-lg-10 p-1 m-auto center-block d-flex justify-content-around
                     bg-light border-top-0" style="border-end-start-radius: 10px; border-end-end-radis:10px; color: black;">
                    <c:forEach var="ffl" items="${ffl}">
                        <div class="image-container d-inline-flex justify-content-around m-auto border rounded col-lg-4 p-1"
                             style="background-color: #efefef;">
                            <img src="${ffl.imgurl}"
                                 alt="alt" class="img d-inline-block" />
                            <div class="detail-box d-inline-block px-4">
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
                <div class="container-fluid border-bottom-0 m-auto"
                     style="background-color: #9299ff; border-start-end-radius: 10px; border-start-start-radius: 10px;">
                    <div class="p-3 flex-fill text-dark" style="text-align: left;; font-weight: bold">
                        <h4>New food on menu</h4>
                    </div>
                </div>
                <div class="row row-flex-box col-lg-10 p-1 m-auto center-block d-flex justify-content-around
                     bg-light border-top-0 text-dark" style="border-end-start-radius: 10px; border-end-end-radis:10px">
                    <c:forEach var="nfl" items="${nfl}">
                        <div class="image-container d-inline-flex justify-content-around m-auto border rounded col-lg-4 p-1"
                             style="background-color: #efefef;">
                            <img src="${nfl.imgurl}"
                                 alt="alt" class="img d-inline-block" />
                            <div class="detail-box d-inline-block px-4">
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
            <div class="container col-lg-12 m-4" style="color: blanchedalmond" id="new-food-container">
                <div class="container-fluid border-bottom-0 m-auto"
                     style="background-color: #9299ff; border-start-end-radius: 10px; border-start-start-radius: 10px;">
                    <div class="p-3 flex-fill text-dark" style="text-align: left;; font-weight: bold">
                        <h4>Food with high rating</h4>
                    </div>
                </div>
                <div class="row row-flex-box col-lg-10 p-1 m-auto center-block d-flex justify-content-around
                     bg-light border-top-0 text-dark" style="border-end-start-radius: 10px; border-end-end-radis:10px">
                    <c:forEach var="hrl" items="${hrl}">
                        <div class="image-container d-inline-flex justify-content-around m-auto border rounded col-lg-4 p-1"
                             style="background-color: #efefef;">
                            <img src="${hrl.imgurl}"
                                 alt="alt" class="img d-inline-block" />
                            <div class="detail-box d-inline-block px-4">
                                <h4 style="font-weight: bold">${hrl.foodName}</h4>
                                <p>Price: ${hrl.price}</p>
                                <p>Shop: ${hrl.shopName}</p>
                                <form action="/SWP391/ShowFood">
                                    <input type="hidden" name="FoodID" value="${hrl.foodid}">
                                    <input class="form-control btn btn-primary btn-sm btn-block flex-fill" type="submit"
                                           value="Food Information" style="text-align: center; color: #efefef" />
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            
            <div class="container col-lg-12 m-4" style="color: blanchedalmond" id="new-food-container">
                <div class="container-fluid border-bottom-0 m-auto"
                     style="background-color: #9299ff; border-start-end-radius: 10px; border-start-start-radius: 10px;">
                    <div class="p-3 flex-fill text-dark" style="text-align: left;; font-weight: bold">
                        <h4>Food with high rating</h4>
                    </div>
                </div>
                <div class="row row-flex-box col-lg-10 p-1 m-auto center-block d-flex justify-content-around
                     bg-light border-top-0 text-dark" style="border-end-start-radius: 10px; border-end-end-radis:10px">
                    <c:forEach var="hrl" items="${all}">
                        <div class="image-container d-inline-flex justify-content-around m-auto border rounded col-lg-4 p-1"
                             style="background-color: #efefef;">
                            <img src="${hrl.imgurl}"
                                 alt="alt" class="img d-inline-block" />
                            <div class="detail-box d-inline-block px-4">
                                <h4 style="font-weight: bold">${hrl.foodName}</h4>
                                <p>Price: ${hrl.price}</p>
                                <p>Shop: ${hrl.shopName}</p>
                                <form action="/SWP391/ShowFood">
                                    <input type="hidden" name="FoodID" value="${hrl.foodid}">
                                    <input class="form-control btn btn-primary btn-sm btn-block flex-fill" type="submit"
                                           value="Food Information" style="text-align: center; color: #efefef" />
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
        <jsp:include page="homefooter.jsp"/>
    </body>
</html>