<%-- 
    Document   : homefeaturefood
    Created on : Jun 13, 2024, 7:18:40 PM
    Author     : DELL
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <h5>What to eat today</h5>
    <div class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <c:forEach var="crsItems" items="${ffl}">
                <div class="carousel-item active">
                    <a href="#"><img src="${crsItems.imgurl}" alt="alt"/></a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>