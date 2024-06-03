<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
    <%  String[] content =(String[]) request.getAttribute("content");
        String forget = (String) request.getAttribute("forget");
        String action = (String) request.getAttribute("action");
    %>
    
	<div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <%@include file="Icon.jsp" %>
                    <form id="normalForm" class="login100-form validate-form" action="${action}" method="post">
                        <%@include file="Title.jsp" %>
                        <%for (String cont : content) {%>
                        <jsp:include page="<%= cont%>"/>
                        <%}%>
                        <%@include file="Button.jsp" %>
                        <%if(forget.equals("true")){%>
                        <%@include file="Forget.jsp" %>
                        <%}%>
                        <%@include file="Back.jsp" %>
                    </form>
                </div>
            </div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
        <script src="js/passconfirm.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                var form = document.getElementById('normalForm');
                form.addEventListener('submit', function(event) {
                    var trueOTP = document.getElementById('trueOTP').value;
                    var userOTP = document.getElementById('OTP').value;
                    var otpErrorMessage = document.getElementById('otp-error-message');

                    if (userOTP !== trueOTP) {
                        otpErrorMessage.style.display = 'block';
                        event.preventDefault(); // Prevent form submission
                    } else {
                        otpErrorMessage.style.display = 'none';
                    }
                });
            });
        </script>
</body>
</html>
