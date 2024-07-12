<%-- 
    Document   : Food
    Created on : Jun 25, 2024, 1:32:29 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Food" %>
<%@page import="Model.Rate" %>
<%@page import="Model.Review" %>
<%@page import="Dao.FoodDao" %>
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
    <body>
        <%@include file="navbar.jsp" %>
        <%
            Food food = new FoodDao().getFoodByID(Integer.parseInt(request.getParameter("FoodID")));
            ArrayList<Rate> rates = new RateDao().getRateByFood(food.getID());
            ReviewDao dao = new ReviewDao();
        %>
        <div class="container">
            <div class="logo">
                <img src="<%=food.getImgurl()%>" alt="alt"/>
            </div>
            <div class="information">
                <h1><%=food.getName()%></h1>
                <h2><%=food.getPrice()%></h2>
            </div >
            <form action="/SWP391/AddFood">
                <input type="hidden" name="FoodID" value="<%=food.getID()%>"/>
                <input type="submit" value="Add to Cart"/>
            </form>
            <form action="/SWP391/ReportFood">
                <input type="hidden" name="FoodID" value="<%=food.getID()%>"/>
                <select name="content">
                    <option value="scam" selected="true">The Food was a scam</option>
                    <option value="bad">The Food went bad</option>
                </select>
                <input type="submit" value="Report"/>
            </form>
            <%for(Rate rate : rates){%>
            <div style="border: 1px solid black;">
                <h3><%=rate.getUser().getName()%></h3>
                <h4><%=rate.getRate()%> star(s)</h4>
                <p><%=dao.getReviewByRate(rate.getRateID()).getContent()%></p>
                <p><%=rate.getReply()%></p>
            </div>
            <%}%>
        </div>
        <script>
            document.getElementById("Report").addEventListener("Click", () => {
                window.location.href = "/SWP391/ReportFood";
            });
        </script>
    </body>
</html>
