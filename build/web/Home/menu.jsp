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
    <body>
        <jsp:include page="navbar.jsp"/>
        <jsp:include page="searchbar.jsp"/>
        <jsp:include page="homebanner.jsp"/>
        <c:set var="ffl" value="${ffl}"/>
        <c:set var="nfl" value="${nfl}"/>
        <jsp:include page="homecontent.jsp"/>
        <jsp:include page="homefooter.jsp"/>
    </body>
</html>
