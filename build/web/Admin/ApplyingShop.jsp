<%-- 
    Document   : ApplyingShop
    Created on : Jul 11, 2024, 9:35:24 PM
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
    </head>
    <body>
        <h1>Applying Shops</h1>
        <%
            ShopDao sDao = new ShopDao();
            ArrayList<Shop> shops = sDao.getApplyingShop();
        %>
        <table>
            <tr>
                <th>ShopID</th>
                <th>ShopName</th>
                <th>Approved</th>
            </tr>
        <%for(Shop shop : shops){%>
            <tr>
                <td><%=shop.getShopID()%></td>
                <td><%=shop.getName()%></td>
                <td>
                    <form action="action">
                        <input type="hidden" name="ShopID" value="<%=shop.getShopID()%>"/>
                        <input type="submit" value="Approved" />
                    </form>
                </td>
            </tr>
        <%}%>
        </table>
    </body>
</html>
