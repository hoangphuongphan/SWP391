<%-- 
    Document   : Shops
    Created on : Jul 16, 2024, 1:16:52 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.ShopDao" %>
<%@page import="Model.Shop" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 20px;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            display: inline;
        }
        .btn {
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <div class="container">
        <h1>Shops</h1>
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>Shop ID</th>
                    <th>Shop Name</th>
                    <th>Ban Status</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    ShopDao shopDao = new ShopDao();
                    ArrayList<Shop> shops = shopDao.getShops();
                    for (Shop shop : shops) {
                %>
                <tr>
                    <td><%= shop.getShopID() %></td>
                    <td><%= shop.getName() %></td>
                    <td>
                        <% if (shop.getStatus() < 3) { %>
                            <form action="/SWP391/BanShop" method="post">
                                <input type="hidden" name="ShopID" value="<%= shop.getShopID() %>"/>
                                <input type="hidden" name="action" value="ban"/>
                                <button type="submit" class="btn btn-danger">Ban</button>
                            </form>
                        <% } else { %>
                            <form action="/SWP391/BanShop" method="post">
                                <input type="hidden" name="ShopID" value="<%= shop.getShopID() %>"/>
                                <input type="hidden" name="action" value="unban"/>
                                <button type="submit" class="btn btn-success">Unban</button>
                            </form>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
