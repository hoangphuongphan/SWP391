<html lang="en">
<head>
</head>
<body>
    <%request.setAttribute("title", "Enter new password");%>
    <%request.setAttribute("button", "Change");%>
    <%request.setAttribute("back", "Log in with your account");%>
    <%request.setAttribute("forget", "false");%>
    <%request.setAttribute("action", "/SWP391/ResetPassword");%>
    <%request.setAttribute("backTo", "/SWP391/Login/Login.jsp");%>
    <%request.setAttribute("content", new String[]{"LogElements/DoublePassword.jsp"});%>
    <%@include file="LogElements/Form.jsp" %>
</body>
</html>
