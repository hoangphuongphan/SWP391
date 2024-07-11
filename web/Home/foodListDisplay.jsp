<%-- 
    Document   : foodDisplay
    Created on : Jul 11, 2024, 3:27:52 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    img{
        height: 200px;
        width: auto;
    }
</style>
<div class="container">
    <div class="d-flex justify-content-center">
        <c:forEach var="items" items="${items}">
            <div class="border rounded col-4 p-1">
                <img src="${items.imgUrl}" alt="alt"/>
                <h4>${items.name}</h4>
                <p>${items.price}</p>
                <form action="/SWP391/ShowFood">
                    <input type="hidden" name="FoodID" value="${items.ID}">
                    <input class= "btn btn-primary btn-sm btn-block" type="submit" value="Food Information"/>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
