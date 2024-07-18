<%-- 
    Document   : Shops
    Created on : Jul 16, 2024, 1:16:52 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.UserDao" %>
<%@page import="Model.User" %>
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
            UserDao uDao = new UserDao();
            ArrayList<User> shops = uDao.getUsers();
        %>
        <table>
            <tr>
                <th>UserID</th>
                <th>UserName</th>
                <th>Ban Status</th>
            </tr>
        <%for(User user : shops){%>
            <tr>
                <td><%=user.getID()%></td>
                <td><%=user.getName()%></td>
                <td>
                    <%if(user.getStatus()==1){%>
                    <form action="/SWP391/BanUser">
                        <input type="hidden" name="UserID" value="<%=user.getID()%>"/>
                        <input type="hidden" name="action" value="ban"/>
                        <input type="submit" value="Ban" />
                    </form>
                    <%}else{%>
                    <form action="/SWP391/BanUser">
                        <input type="hidden" name="UserID" value="<%=user.getID()%>"/>
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
