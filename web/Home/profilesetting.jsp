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
            <label for="bio">Bio</label>
            <input type="text" class="form-control" id="bio" value="${user.bio}" placeholder="Enter your bio here"/>
        </div>
    </form>
</div>
