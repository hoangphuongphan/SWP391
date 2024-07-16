<%-- 
    Document   : ApplyingShop
    Created on : Jul 11, 2024, 9:35:24 PM
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
        <h1>Applying Shops</h1>
        <%
            ShipperDao sDao = new ShipperDao();
            ArrayList<Shipper> ships = sDao.getApplyingShipper();
        %>
        <table>
            <tr>
                <th>ShipperID</th>
                <th>ShipperName</th>
                <th>Approved</th>
            </tr>
        <%for(Shipper ship : ships){%>
            <tr>
                <td><%=ship.getID()%></td>
                <td><%=ship.getName()%></td>
                <td>
                    <form action="action">
                        <input type="hidden" name="ShipID" value="<%=ship.getID()%>"/>
                        <input type="submit" value="Approved" />
                    </form>
                </td>
            </tr>
        <%}%>
        </table>
    </body>
</html>
