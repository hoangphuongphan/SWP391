<html lang="en">
<head>
</head>
<body>
    <%request.setAttribute("title", "Change your password");%>
    <%request.setAttribute("button", "Change");%>
    <%request.setAttribute("back", "Log in with your account");%>
    <%request.setAttribute("forget", "false");%>
    <%request.setAttribute("action", "#");%>
    <%request.setAttribute("backTo", "/SWP391/Login/Login.jsp");%>
    <%request.setAttribute("content", new String[]{"/LogElements/DoublePassword.jsp"});%>
    <%@include file="LogElements/Form.jsp" %>
</body>
</html>
