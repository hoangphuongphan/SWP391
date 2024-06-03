<%-- 
    Document   : Cart
    Created on : May 31, 2024, 11:31:49 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User" %>
<%@page import="Model.Food" %>
<%@page import="Model.Cart" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--Css for cart-->
        <link rel="stylesheet" href="css/cartMain.css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%User current = (User) session.getAttribute("currentUser");
        HashMap<Food,Integer> cart = Cart.getInstance().getCart();
        int total = 0,ship = 0;%>
        <div class="bigcontainer">
            <form action="action">
                <div class="title container">
                    <h1>My cart</h1>
                </div>
                <div class="container">
                    <div class="leftcolumn ">

                        <div class="container">
                            <div class="info center person">
                                <p><%=current.getName()%><br><%=current.getPhone()%></p>
                            </div>
                            <div class="info center location">
                                <input name="location" type="text" placeholder="Enter a Location">
                            </div>
                        </div>
                        <div class="cart">
                            <div class="title">
                                <h3>Get it shipped(<%=cart.size()%>)</h3>
                            </div>
                                <div class="cartelement">Your fee ship is <%=ship%></div>
                            <%for (Map.Entry<Food,Integer> entry : cart.entrySet()){%>
                                <div class="container cartelement">
                                    <div class="productimage">
                                        <img src="<%=entry.getKey().getImgurl()%>" alt="Food image"/>
                                    </div>
                                    <div class="productinfo">
                                        <%=entry.getKey()%><br>
                                        <%=entry.getValue()%>
                                    </div>
                                </div>
                                        <%total += entry.getKey().getPrice() * entry.getValue();%>
                            <%}%>
                        </div>
                    </div>
                    <div class="rightcolumn ">
                        <div class="payment">
                            <div class="prices">
                                <div class="container">
                                    <div class="left"><p>Merchandise Subtotal</p></div>
                                    <div class="right"><p class="bold"><%=total%> vnd</p></div>
                                </div>
                                <div class="container">
                                    <div class="left"><p>Shipping and Handling</p></div>
                                    <div class="right"><p class="bold"><%=ship%> vnd</p></div>
                                </div>
                            </div>
                            <div class="total">
                                <div class="container">
                                    <div class="left"><p class="bold">In Total</p></div>
                                    <div class="right"><p class="bold"><%=ship + total%></p></div>
                                </div>
                                <p style="color: #D6D3D1; font-size: 1rem;">Shipping and taxes are included in the checkout</p>
                                <button class="button" type="submit" style="background-color: red; border: none;" type="submit">Pay on Delivery</button>
                                <button class="button" style="background-color: white; border: 3px sold black;" type="submit">Pay Online</button>
                            </div>
                        </div>
                        <div class="promotioncontainer">
                            <div class="view" id="discount"><button>View your discount ></button></div>
                            <div class="promotion">
                                <input type="text" placeholder="Discount or Reward Code">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
            <dialog>
                <div>
                    <p>Discount offers</p>
                </div>
            </dialog>
        <script>
            const dialogElement = document.querySelector('dialog');

            document.getElementById("discount").addEventListener("click", () =>{
                event.preventDefault();
                dialogElement.showModal();
            });

            dialogElement.addEventListener("click", (event) => {
                dialogElement.close();
            });
        </script>
    </body>
</html>
