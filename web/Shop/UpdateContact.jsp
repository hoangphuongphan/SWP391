<%-- 
    Document   : UpdateContact
    Created on : Jun 27, 2024, 11:43:21 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shop" %>
<%@page import="Model.Email" %>
<%@page import="Control.Generator" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Contact Information</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 20px;
            max-width: 500px;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <%
            Shop current = (Shop) session.getAttribute("currentShop");
            String OTP = Generator.getInstance().getOTP();
            Email mail = new Email(current.getEmail(),"Your OTP is : " + OTP, "do not reply");
            mail.run();
        %>
    <div class="container">
        <h1>Update Contact Information</h1>
        <form id="OTPinputForm">
            <div class="form-group">
                <label for="inputOTP">Enter OTP sent to your email:</label>
                <input id="inputOTP" type="text" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Verify OTP</button>
        </form>

        <form id="updateContactForm" action="/SWP391/UpdateShopContact" style="display: none;">
            <div class="form-group">
                <label for="inputEmail">New E-mail:</label>
                <input type="email" id="inputEmail" name="Email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="inputPhone">New Phone:</label>
                <input type="text" id="inputPhone" name="Phone" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Update Contact Information</button>
        </form>
    </div>

    <script>
        document.getElementById("OTPinputForm").addEventListener('submit', function(event) {
            event.preventDefault();
            var inputOTP = document.getElementById("inputOTP").value;
            var OTP = "<%= Generator.getInstance().getOTP() %>"; // Generate OTP server-side

            if (inputOTP === OTP) {
                document.getElementById("OTPinputForm").style.display = "none";
                document.getElementById("updateContactForm").style.display = "block";
            } else {
                alert("Incorrect OTP. Please try again.");
            }
        });
    </script>
</body>
</html>
