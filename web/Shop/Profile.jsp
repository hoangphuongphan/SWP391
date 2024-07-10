<%-- 
    Document   : Profile
    Created on : Jun 26, 2024, 12:28:20 AM
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
            Shop shop = (Shop) session.getAttribute("currentShop");
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
                    <h2><%=shop.getEmail()%></h2>
                </div>
<!--                <div class="discount-list">
                    <div class="box">Discount</div>
                    <div class="box">Discount</div>
                    <div class="box">Discount</div>
                </div>-->
                <div class="food-list">
                    <button id="Createbtn_Click">Create Food</button>
                    <%for(Food food : foods){%>
                        <div class="box" style="width: 70%; margin: 0 10%;">
                            <%=food.getName()%><br>
                            <%=food.getPrice()%><br>
                            <form action="/SWP391/ShowShopFood">
                                <input type="hidden" name="FoodID" value="<%=food.getID()%>">
                                <input type="submit" value="Food Information"/>
                            </form>
                                <form action="/SWP391/DeleteFood">
                                <input type="hidden" name="FoodID" value="<%=food.getID()%>">
                                <input type="submit" value="Delete"/>
                            </form>
                        </div>
                    <%}%>
                </div>
                <button id="Updatebtn_Click">Update</button>
                <button id="UpdatePassbtn_Click">Update Password</button>
                <button id="UpdateContbtn_Click">Update Contact</button>
            </div>
        </div>
                <script>
                    document.getElementById("Updatebtn_Click").addEventListener("click", () => {
                        window.location.href = "UpdateProfile.jsp";
                    })
                    document.getElementById("UpdatePassbtn_Click").addEventListener("click", () => {
                        window.location.href = "UpdatePassword.jsp";
                    })
                    document.getElementById("UpdateContbtn_Click").addEventListener("click", () => {
                        window.location.href = "UpdateContact.jsp";
                    })
                    document.getElementById("Createbtn_Click").addEventListener("click", () => {
                        window.location.href = "CreateFood.jsp";
                    })
                </script>
    </body>
</html>
