<%-- 
    Document   : profilesettingpage
    Created on : Jun 2, 2024, 7:58:07 PM
    Author     : DELL
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <jsp:include page="profilesetting.jsp"/>
        <c:set var="err" value="${err}"/>
        <c:if test="${not empty err}">
            <div class="container mt-5">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Error!</strong> ${requestScope.err}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </div>
        </c:if>
    </body>
</html>
