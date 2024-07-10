<%-- 
    Document   : UpdatePassword
    Created on : Jun 27, 2024, 10:58:37 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shop" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="NewPassword" action="/SWP391/UpdatePassword">
            <label>Old password</label>
            <input type="password" name="oldPassword"/>
            <label>New Password</label>
            <input type="password" name="newPassword"/>
            <input type="submit" value="Change Password" />
        </form>
    </body>
</html>
