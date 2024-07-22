<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
            margin: 0;
        }
        .error-container {
            text-align: center;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        .error-title {
            font-size: 2rem;
            color: #dc3545;
            margin-bottom: 20px;
        }
        .error-description {
            font-size: 1.2rem;
            color: #343a40;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <%
            String error = request.getParameter("error");
            String title = "";
            String description = "";

            switch(error) {
                case "Banned":
                    title = "Account Banned";
                    description = "Your account has been banned from the platform.";
                    break;
                case "notApproved":
                    title = "Account Not Approved";
                    description = "Your account is not approved yet. Please contact admin for help.";
                    break;
                case "CannotOrder":
                    title = "Order Issue";
                    description = "Cannot order right now due to a platform problem.";
                    break;
                default:
                    title = "Unknown Error";
                    description = "An unknown error occurred. Please try again later.";
                    break;
            }
        %>
        <h1 class="error-title"><%= title %></h1>
        <p class="error-description"><%= description %></p>
    </div>
</body>
</html>
