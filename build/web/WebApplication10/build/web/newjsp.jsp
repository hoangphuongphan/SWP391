<%-- 
    Document   : newjsp
    Created on : Jun 13, 2024, 9:04:11 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Food Form</title>
</head>
<body>
  <div class="container">
    <h2>Report Food</h2>
    <form action="ReportFoodServlet" method="post">
        
     <div class="form-group">
        <label>User ID:</label>
        <input type="text" name="userID" required><br><br>
     </div>
        
     <div class="form-group">
        <label>Food ID:</label>
        <input type="text" name="foodID" required><br><br>
     </div>
        
     <div class="form-group"> 
        <label>Content:</label><br>
        <textarea name="content" rows="4" cols="50" required></textarea><br><br>
     </div>
        
        <input type="submit" value="Submit">
    </form>
   </div>
</body>
</html>
