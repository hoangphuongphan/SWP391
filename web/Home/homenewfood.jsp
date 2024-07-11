<%-- 
    Document   : homenewfood
    Created on : Jun 13, 2024, 7:18:48 PM
    Author     : DELL
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="items" value="${pageScope.nfl}"/>
<div class="container">
    <div class="row">
        <div class="col-6">
            <h5 class="mt-3">New food</h5>
        </div>
        <jsp:include page="foodListDisplay"/>
    </div>
</div>