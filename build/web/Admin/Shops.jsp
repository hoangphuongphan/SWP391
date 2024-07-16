<%-- 
    Document   : Shops
    Created on : Jul 16, 2024, 1:16:52 AM
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
        <h1>Shops</h1>
        <%
            ShopDao sDao = new ShopDao();
            ArrayList<Shop> shops = sDao.getShops();
        %>
        <table>
            <tr>
                <th>ShopID</th>
                <th>ShopName</th>
                <th>Ban Status</th>
            </tr>
        <%for(Shop shop : shops){%>
            <tr>
                <td><%=shop.getShopID()%></td>
                <td><%=shop.getName()%></td>
                <td>
                    <%if(shop.getStatus()<3){%>
                    <form action="/SWP391/BanShop">
                        <input type="hidden" name="ShopID" value="<%=shop.getShopID()%>"/>
                        <input type="hidden" name="action" value="ban"/>
                        <input type="submit" value="Ban" />
                    </form>
                    <%}else{%>
                    <form action="/SWP391/BanShop">
                        <input type="hidden" name="ShopID" value="<%=shop.getShopID()%>"/>
                        <input type="hidden" name="action" value="unban"/>
                        <input type="submit" value="Unban" />
                    </form>
                    <%}%>
                </td>
            </tr>
        <%}%>
        </table>
    </body>
</html>
