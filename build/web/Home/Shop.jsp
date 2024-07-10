<%-- 
    Document   : Shop
    Created on : Jun 25, 2024, 12:07:47 AM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Shop" %>
<%@page import="Model.Food" %>
<%@page import="Dao.ShopDao" %>
<%@page import="Dao.FoodDao" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/ShopMain.css"/>
        <style>
            .container{
                margin: 0 15%;
            }

            .avatar{
                width: 100%;
                object-fit: cover;
            }

            .box{
                border: 1px solid black;
                margin: 0 20%;
                border-radius: 10px;
                width: 50%;
            }
        </style>
    </head>
    <body>
        <%
            int ShopID = Integer.parseInt(request.getParameter("ShopID"));
            Shop shop = new ShopDao().getShopByID(ShopID);
            ArrayList<Food> foods = new FoodDao().getFoodByShop(shop.getShopID());
        %>
        <div class="container">
            <div class="profile">
                <div class="avatar">
                    <img src="<%=shop.getImgurl()%>" alt="">
                </div>
                <div class="information">
                    <h1><%=shop.getName()%></h1>
                    <h2><%=shop.getLocation()%></h2>
                    <h2><%=shop.getPhone()%></h2>
                </div>
<!--                <div class="discount-list">
                    <div class="box">Discount</div>
                    <div class="box">Discount</div>
                    <div class="box">Discount</div>
                </div>-->
                <div class="food-list">
                    <%for(Food food : foods){%>
                        <div class="box" style="width: 70%; margin: 0 10%;">
                            <%=food.getName()%><br>
                            <%=food.getPrice()%><br>
                            <form action="/SWP391/ShowFood">
                                <input type="hidden" name="FoodID" value="<%=food.getID()%>">
                                <input type="submit" value="Food Information"/>
                            </form>
                        </div>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>
