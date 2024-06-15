<%-- 
    Document   : reportShipperForm
    Created on : Jun 13, 2024, 10:20:43 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Shipper Form</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Report Shipper</h2>
        <form action="ReportShipperServlet" method="post">
            <div class="form-group">
                <label for="userID">User ID:</label>
                <input type="text" id="userID" name="userID" required>
            </div>
            
            <div class="form-group">
                <label for="shipperID">Shipper ID:</label>
                <input type="text" id="shipperID" name="shipperID" required>
            </div>
            
            <div class="form-group">
                <label for="content">Content:</label>
                <textarea id="content" name="content" rows="4" cols="50" required></textarea>
            </div>
            
            <div class="form-group">
                <input type="submit" value="Submit">
            </div>
        </form>
    </div>
</body>
</html>
