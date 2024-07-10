<%-- 
    Document   : UpdateContact
    Created on : Jun 27, 2024, 11:43:21 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shop" %>
<%@page import="Model.Email" %>
<%@page import="Control.Generator" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Shop current = (Shop) session.getAttribute("currentShop");
            String OTP = Generator.getInstance().getOTP();
            Email mail = new Email(current.getEmail(),"Your OTP is : " + OTP, "do not reply");
            mail.run();
        %>
        <form id="OTPinput" action="#">
            <input id="OTP" value="<%=OTP%>" type="hidden">
            <input id="input" type="text" name="inputOTP"/>
            <input type="submit"/>
        </form>
        <form id="NewPassword" action="/SWP391/UpdateShopContact" style="display: none">
            <label>E-mail</label>
            <input type="text" name="Email"/>
            <label>Phone</label>
            <input type="number" name="Phone"/>
            <input type="submit" value="Change Password" />
        </form>
        <script>
            var OTP = document.getElementById("OTP").value;
            document.getElementById("OTPinput").addEventListener('submit', (event) =>{
                var input = document.getElementById("input").value;
                event.preventDefault();
                if(OTP == input){
                    document.getElementById("OTPinput").style.display = "none";
                    document.getElementById("NewPassword").style.display = "block";
                }else {
                    alert("Incorrect OTP. Please try again." );
                }
            });
        </script>
    </body>
</html>
