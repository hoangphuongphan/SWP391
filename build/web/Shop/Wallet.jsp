<%-- 
    Document   : Wallet
    Created on : Jul 18, 2024, 10:01:16 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Wallet" %>
<%@page import="Model.Shop" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wallet</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 20px;
            max-width: 600px;
        }
        .wallet-info {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .wallet-info h1, .wallet-info h2 {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <%
            Wallet wallet = Wallet.getInstance();
            Shop current = (Shop) session.getAttribute("currentShop");
        %>
    <jsp:include page="navbar.jsp"/>
    <div class="container">
        <div class="wallet-info">
            <h1><%= current.getName() %> Wallet</h1>
            <h2>Balance: $<%= wallet.getAmount() %></h2>
            <p>Here you can manage your wallet balance and transactions.</p>
        </div>
        
        <!-- Add more sections or functionality as needed -->
    </div>
</body>
</html>
