<html lang="en">
<head>
</head>
<body>
    <%request.setAttribute("title", "Verify your email");%>
    <%request.setAttribute("button", "Verify");%>
    <%request.setAttribute("back", "Log in with your account");%>
    <%request.setAttribute("forget", "false");%>
    <%request.setAttribute("action", "/SWP391/Register");%>
    <%request.setAttribute("backTo", "/SWP391/Login/Login.jsp");%>
    <%request.setAttribute("content", new String[]{"LogElements/OTP.jsp"});%>
    <%@include file="LogElements/Form.jsp" %>
</body>
</html>
