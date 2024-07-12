<%-- 
    Document   : UpdatePassword
    Created on : Jul 2, 2024, 10:22:02 PM
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
        <form id="resetPass" action="/SWP391/UpdateUserPass" onsubmit="return validateForm()">
            <label>Current Password</label><br>
            <input type="password" name="oldPass" placeholder="Your current Password"/><br>
            <label>New Password</label><br>
            <input type="password" name="newPass" placeholder="Your new Password"/><br>
            <label>Confirm New Password</label><br>
            <input type="password" name="confirmPass" placeholder="Your new Password"/><br>
            <span id="error-message" class="error" style="display: none; color: red;">Passwords do not match!</span><br><br>
            <input type="submit"/>
        </form>
        <script>
            function validateForm() {
                var newPass = document.forms["resetPass"]["newPass"].value;
                var confirmPass = document.forms["resetPass"]["confirmPass"].value;
                if (newPass !== confirmPass) {
                    document.getElementById("error-message").style.display = "inline";
                    return false;
                }
                document.getElementById("error-message").style.display = "none";
                return true;
            }
        </script>
    </body>
</html>
