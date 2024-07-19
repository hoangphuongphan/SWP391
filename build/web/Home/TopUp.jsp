<%-- 
    Document   : Cart
    Created on : May 31, 2024, 11:31:49 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Top Up</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/topMain.css"/>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
            max-width: 600px;
        }
        .box {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .btn-topup {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-topup:hover {
            background-color: #0056b3;
        }
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp" %>
    <div class="container">
        <h1>Top Up</h1>
        <div class="box">
            <form action="/SWP391/ajaxServlet" id="frmCreateOrder" method="post">
                <input type="hidden" id="language" name="language" value="en">
                <div class="form-group">
                    <label for="total">Amount of Money</label>
                    <input type="text" id="total" name="total" class="form-control" placeholder="0">
                </div>
                <input type="hidden" id="bankCode" name="bankCode" value="VNBANK">
                <button id="vn-pay" class="btn-topup" type="submit">Top Up</button>
            </form>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    <script>
        $("#frmCreateOrder").submit(function (event) {
            event.preventDefault();
            var postData = $(this).serialize();
            var submitUrl = $(this).attr("action");
            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (x) {
                    if (x.code === '00') {
                        if (window.vnpay) {
                            vnpay.open({width: 768, height: 600, url: x.data});
                        } else {
                            window.location.href = x.data;
                        }
                    } else {
                        alert(x.Message);
                    }
                }
            });
        });
    </script>
</body>
</html>
