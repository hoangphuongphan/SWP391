<%-- 
    Document   : Shops
    Created on : Jul 16, 2024, 1:16:52 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.ShipperDao" %>
<%@page import="Model.Shipper" %>
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
            ShipperDao sDao = new ShipperDao();
            ArrayList<Shipper> ships = sDao.getShippers();
        %>
        <table>
            <tr>
                <th>ShipperID</th>
                <th>ShipperName</th>
                <th>Ban Status</th>
            </tr>
        <%for(Shipper ship : ships){%>
            <tr>
                <td><%=ship.getID()%></td>
                <td><%=ship.getName()%></td>
                <td>
                    <%if(ship.getStaus()<3){%>
                    <form action="/SWP391/BanShop">
                        <input type="hidden" name="ShipID" value="<%=ship.getID()%>"/>
                        <input type="hidden" name="action" value="ban"/>
                        <input type="submit" value="Ban" />
                    </form>
                    <%}else{%>
                    <form action="/SWP391/BanShop">
                        <input type="hidden" name="ShipID" value="<%=ship.getID()%>"/>
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
