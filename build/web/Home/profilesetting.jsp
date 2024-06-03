<%-- 
    Document   : profilesetting
    Created on : Jun 1, 2024, 9:02:53 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container mt-5">
    <form action="ChangeUsrInfo.java" method="POST">
        <div class="form-group">
            <label for="displayName">Display Name</label>
            <input type="text" class="form-control" id="displayName" value="${user.displayName}" placeholder="Enter your display name"/>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control" id="phone" value="${user.bio}" placeholder="Enter your phone number here"/>
        </div>
        <div class="form-group">
            <label for="address">Location</label>
            <input type="text" class="form-control" id="address" value="${user.address}" placeholder="Enter your location here">
        </div>
        <button type="submit" class="btn btn-primary">Update profile</button>
    </form>
</div>
