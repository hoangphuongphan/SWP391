<%-- 
    Document   : Cart
    Created on : May 31, 2024, 11:31:49 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User" %>
<%@page import="Model.Food" %>
<%@page import="Model.Cart" %>
<%@page import="Model.Wallet" %>
<%@page import="Model.Discount" %>
<%@page import="Dao.DiscountDao" %>
<%@page import="Dao.FoodDao" %>
<%@page import="Dao.WalletDao" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/SWP391/Home/css/cartMain.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%User current = (User) session.getAttribute("currentUser");
        HashMap<Integer,Integer> cart = Cart.getInstance().getCart();
        FoodDao dao = new FoodDao();
        int ship = 0;
        int total = Cart.getInstance().getTotal();
        ArrayList<Discount> list = new DiscountDao().getDiscountByUserID(current.getID());
        Wallet wallet = Wallet.getInstance();
        String error = request.getParameter("error");
        String location = (String) session.getAttribute("shipLocation");%>
        
        <div class="bigcontainer">
            <input type="text" id="error" value="<%=error%>" class="title container" readonly="true" style="display: block"/>
                <div class="title container">
                    <h1>My cart</h1>
                </div>
                <div class="container">
                    <div class="leftcolumn ">

                        <div class="container">
                            <div class="info center person">
                                <p><%=current.getName()%><br><%=current.getPhone()%><br><%=wallet.getAmount()%></p>
                            </div>
                            <div class="info center location">
                                <input type="text" value="<%=location%>" readonly="true" name="location"/>
                                <form action="/SWP391/Home/Map.jsp">
                                    <input type="submit" value="pick location"/>
                                </form>
                            </div>
                        </div>
                        <div class="cart">
                            <div class="title">
                                <h3>Get it shipped(<%=cart.size()%>)</h3>
                            </div>
                                <div class="cartelement">Your fee ship is <%=ship%></div>
                            <%for (Map.Entry<Integer,Integer> entry : cart.entrySet()){
                                Food food = dao.getFoodByID(entry.getKey());%>
                                <div class="container cartelement">
                                    <div class="productimage">
                                        <img src="<%=food.getImgurl()%>" alt="Food image"/>
                                    </div>
                                    <div class="productinfo">
                                        <%=food%><br>
                                        <form action="/SWP391/AdjustAmount">
                                            <input type="hidden" value="<%=food.getID()%>" name="FoodID"/>
                                            <input type="hidden" name="amount" value="<%=entry.getValue()-1%>">
                                            <button class="btn border-dark rounded" type="submit" value="-">-</button>
                                        </form>
                                        <form id="myForm" action="/SWP391/AdjustAmount">
                                            <input type="hidden" value="<%=food.getID()%>" name="FoodID"/>
                                            <input value="<%=entry.getValue()%>" name="amount" onchange="autoSub()"/>
                                        </form>
                                        <form action="/SWP391/AdjustAmount">
                                            <input type="hidden" value="<%=food.getID()%>" name="FoodID"/>
                                            <input type="hidden" name="amount" value="<%=entry.getValue()+1%>">
                                            <button class="btn border-dark rounded" type="submit" value="+">+</button>
                                        </form>
                                    </div>
                                </div>
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
                                    <div class="right"><p class="bold" id="total"><%=ship + total%></p></div>
                                </div>
                                <p style="color: #D6D3D1; font-size: 1rem;">Shipping and taxes are included in the checkout</p>
                                <button class="button" style="background-color: red; border: none;" type="submit">Pay on Delivery</button>
                                <form action="/SWP391/order">
                                    <input type="hidden" value="<%=location%>" readonly="true" name="location"/>
                                    <input name="total" type="hidden" id="total" value="<%=ship + total%>"/>
                                    <button id="payOnline" class="button" style="background-color: white; border: 3px solid black;" type="submit">Pay with wallet</button>
                                </form>
                            </div>
                        </div>
                        <div class="promotioncontainer">
                            <div class="view" id="discount">View your discount ></div>
                            <div class="promotion">
                                <input type="text" placeholder="Discount or Reward Code" value="<%=Cart.getInstance().getDiscount().getName()%>">
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <dialog id="discountDialog">
            <div>
                <h3 class="title">Discount</h3>
                <div class="offers">
                    <%int i=0;
                    for(Discount dis : list){%>
                    <div id="<%="item" + i%>" class="item">
                        <form action="/SWP391/applyDiscount">
                            <input type="hidden" name="discount" value="<%=dis.getID()%>">
                            <p><%=dis.getName()%></p><br>
                            <button type="submit">apply</button>
                        </form>
                    </div>
                    <%}%>
                </div>
            </div>
        </dialog>

        <script>
            const dialogElement = document.getElementById('discountDialog');
            document.getElementById("discount").addEventListener("click", () => {
                dialogElement.showModal();
            });

            dialogElement.addEventListener("click", (event) => {
                if (event.target === dialogElement) {
                    dialogElement.close();
                }
            });

            function autoSub(){
                document.getElementById("myForm").submit();
            }
        </script>
    </body>
</html>
