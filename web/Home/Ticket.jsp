<%-- 
    Document   : Ticket
    Created on : Jun 30, 2024, 1:52:51 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <form action="/SWP391/SendTicket">
            <label>Subject</label>
            <input name="subject" placeholder="Subject">
            <label>Content</label>
            <input name="content" placeholder="your problem">
            <input type="submit"/>
        </form>
    </body>
</html>
