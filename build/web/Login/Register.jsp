<html lang="en">
<head>
</head>
<body>
    <%request.setAttribute("title", "Register");%>
    <%request.setAttribute("button", "Register");%>
    <%request.setAttribute("back", "Log in with your account");%>
    <%request.setAttribute("forget", "false");%>
    <%request.setAttribute("action", "/SWP391/ConfirmRegisterEmail");%>
    <%request.setAttribute("backTo", "/SWP391/Login/Login.jsp");%>
    <%request.setAttribute("content", new String[]{"LogElements/Username.jsp","LogElements/DoublePassword.jsp","LogElements/Email.jsp","LogElements/Phone.jsp"});%>
    <%@include file="LogElements/Form.jsp" %>
</body>
</html>
