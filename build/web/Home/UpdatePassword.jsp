<%-- 
    Document   : UpdatePassword
    Created on : Jul 2, 2024, 10:22:02 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Password</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
            max-width: 500px;
        }
        .form-container {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-submit {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp" %>
    <div class="container">
        <div class="form-container">
            <h2>Update Password</h2>
            <form id="resetPass" action="/SWP391/UpdatePassword" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="oldPass">Current Password</label>
                    <input type="password" id="oldPass" name="oldPassword" class="form-control" placeholder="Your current Password" required>
                </div>
                <div class="form-group">
                    <label for="newPass">New Password</label>
                    <input type="password" id="newPass" name="newPassword" class="form-control" placeholder="Your new Password" required>
                </div>
                <div class="form-group">
                    <label for="confirmPass">Confirm New Password</label>
                    <input type="password" id="confirmPass" name="confirmPass" class="form-control" placeholder="Confirm your new Password" required>
                </div>
                <span id="error-message" class="error" style="display: none;">Passwords do not match!</span><br><br>
                <button type="submit" class="btn-submit">Update Password</button>
            </form>
        </div>
    </div>
    <script>
        function validateForm() {
            var newPass = document.getElementById("newPass").value;
            var confirmPass = document.getElementById("confirmPass").value;
            if (newPass !== confirmPass) {
                document.getElementById("error-message").style.display = "inline";
                return false;
            }
            document.getElementById("error-message").style.display = "none";
            return true;
        }
    </script>
    <jsp:include page="homefooter.jsp"/>
</body>
</html>
