<html lang="en">
<head>
</head>
<body>
    <%request.setAttribute("title", "Log In");%>
    <%request.setAttribute("button", "Log In");%>
    <%request.setAttribute("back", "Create a new account");%>
    <%request.setAttribute("forget", "true");%>
    <%request.setAttribute("action", "/SWP391/Login");%>
    <%request.setAttribute("backTo", "/SWP391/Login/Register.jsp");%>
    <%request.setAttribute("content", new String[]{"LogElements/Username.jsp","LogElements/Password.jsp"});%>
    <%@include file="LogElements/Form.jsp" %>
</body>
</html>
