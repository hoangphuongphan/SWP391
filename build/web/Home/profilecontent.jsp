<%-- 
    Document   : profilecontent
    Created on : May 23, 2024, 9:02:24 PM
    Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <img src="placeholder.png" class="rounded-circle img-fluid" alt="placeholder.png">
                </div>
                <div class="card-body text-center">
                    <h5 class="card-title">${u.userName}</h5>
                    <p class="card-text">${u.userId}</p>
                    <p class="card-text">${u.displayName}</p>
                    <p class="card-text"><small class="text-muted">Email: ${u.email}</small></p>
                    <a href="ChangeUsrInfo">Change Profile</a>
                    <a href="#">Change User Setting</a>
                </div>
            </div>
        </div>
    </div>
</div>
