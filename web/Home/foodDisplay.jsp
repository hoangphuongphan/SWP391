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
    <div class="d-flex justify-content-around">
        <c:forEach var="items" items="${items}">
            <div class="col-3 p-1">
                <img src="${items.imgUrl}" alt="alt"/>
                
            </div>
        </c:forEach>
    </div>
</div>
