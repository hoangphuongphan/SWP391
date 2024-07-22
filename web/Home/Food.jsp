<%-- 
    Document   : Food
    Created on : Jun 25, 2024, 1:32:29 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Food" %>
<%@page import="Model.Shop" %>
<%@page import="Model.Rate" %>
<%@page import="Model.Review" %>
<%@page import="Dao.FoodDao" %>
<%@page import="Dao.ShopDao" %>
<%@page import="Dao.RateDao" %>
<%@page import="Dao.ReviewDao" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <style>
        .container {
            margin-top: 30px;
        }
        .logo img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .information {
            margin-top: 20px;
        }
        .information h1 {
            font-size: 2em;
            color: #333;
        }
        .information h2 {
            font-size: 1.5em;
            color: #777;
        }
        .btn-custom {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            font-size: 1em;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            text-align: center;
            cursor: pointer;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
        .review-box {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            margin-bottom: 20px;
        }
        .review-box h3 {
            font-size: 1.2em;
            color: #333;
        }
        .review-box h4 {
            font-size: 1em;
            color: #555;
        }
        .review-box p {
            font-size: 0.9em;
            color: #666;
        }
    </style>
    <body>
        <%@include file="navbar.jsp" %>
        <%
            Food food = new FoodDao().getFoodByID(Integer.parseInt(request.getParameter("FoodID")));
            ArrayList<Rate> rates = new RateDao().getRateByFood(food.getID());
            ReviewDao dao = new ReviewDao();
            int ShopID = food.getShopID();
            Shop shop = new ShopDao().getShopByID(ShopID);
        %>
        <div class="container">
            <div class="logo">
                <img src="<%=food.getImgurl()%>" alt="alt"/>
            </div>
            <div class="information">
                <h1><%=food.getName()%></h1>
                <h2>$<%=food.getPrice()%></h2>
                <h3>Shop : <a href="/SWP391/Home/Shop.jsp?ShopID=<%=ShopID%>"><%=shop.getName()%></a></h3>
            </div>
            <form action="/SWP391/AddFood">
                <input type="hidden" name="FoodID" value="<%=food.getID()%>"/>
                <input type="submit" value="Add to Cart" class="btn-custom"/>
            </form>
            <form action="/SWP391/ReportFood">
                <input type="hidden" name="FoodID" value="<%=food.getID()%>"/>
                <select name="content" class="form-control mb-2">
                    <option value="scam" selected="true">The Food was a scam</option>
                    <option value="bad">The Food went bad</option>
                </select>
                <input type="submit" value="Report" class="btn-custom"/>
            </form>
            <%for(Rate rate : rates){%>
            <div class="review-box">
                <h3><%=rate.getUser().getName()%></h3>
                <h4><%=rate.getRate()%> star(s)</h4>
                <p><%=dao.getReviewByRate(rate.getRateID()).getContent()%></p>
                <p><%=rate.getReply()%></p>
            </div>
            <%}%>
        </div>
        <script>
            document.getElementById("Report").addEventListener("click", () => {
                window.location.href = "/SWP391/ReportFood";
            });
        </script>
        <jsp:include page="homefooter.jsp"/>
    </body>
</html>
