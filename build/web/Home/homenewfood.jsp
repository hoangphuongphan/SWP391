<%-- 
    Document   : homenewfood
    Created on : Jun 13, 2024, 7:18:48 PM
    Author     : DELL
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <h5>New food on menu</h5>
    <div class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <c:forEach var="crsItems" items="${nfl}">
                <div class="carousel-item active">
                    <a href="#"><img src="${crsItems.foodImg}" alt="alt"/></a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>