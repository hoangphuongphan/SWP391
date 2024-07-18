<%-- 
    Document   : Wallet
    Created on : Jul 18, 2024, 10:01:16 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Wallet" %>
<%@page  import="Model.Shop"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Wallet wallet = Wallet.getInstance();
            Shop current = (Shop) session.getAttribute("currentShop");
        %>
        
        <h1><%=current.getName()%></h1>
        <h2><%=wallet.getAmount()%></h2>
    </body>
</html>
