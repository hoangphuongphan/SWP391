<%-- 
    Document   : Cart
    Created on : May 31, 2024, 11:31:49 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User" %>
<%@page import="Model.Food" %>
<%@page import="Model.Cart" %>
<%@page import="Model.Discount" %>
<%@page import="Dao.DiscountDao" %>
<%@page import="Dao.FoodDao" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
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
        HashMap<Integer,Integer> cart = Cart.getInstance().getCart();
        FoodDao dao = new FoodDao();
        int ship = 0;
        int total = Cart.getInstance().getTotal();
        ArrayList<Discount> list = new DiscountDao().getDiscountByUserID(current.getID());%>
        <div class="bigcontainer">
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
                            <%for (Map.Entry<Integer,Integer> entry : cart.entrySet()){
                                Food food = dao.getFoodByID(entry.getKey());%>
                                <div class="container cartelement">
                                    <div class="productimage">
                                        <img src="<%=food.getImgurl()%>" alt="Food image"/>
                                    </div>
                                    <div class="productinfo">
                                        <%=food%><br>
                                        <%=entry.getValue()%>
                                    </div>
                                </div>
                            <%}%>
                            <%session.setAttribute("total",total+ship);%>
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
                                <button class="button" style="background-color: red; border: none;" type="submit">Pay on Delivery</button>
                                <form action="/SWP391/ajaxServlet" id="frmCreateOrder" method="post">
                                    <input type="hidden" id="language" name="language" value="en">
                                    <input type="hidden" name="total" value="<%=ship + total%>">
                                    <input type="hidden" id="bankCode" name="bankCode" value="VNBANK">
                                    <button id="vn-pay" class="button" style="background-color: white; border: 3px sold black;" type="submit">Pay Online</button>
                                </form>
                            </div>
                        </div>
                        <div class="promotioncontainer">
                            <div class="view" id="discount">View your discount ></button></div>
                            <div class="promotion">
                                <input type="text" placeholder="Discount or Reward Code">
                            </div>
                        </div>
                    </div>
                </div>
        </div>
           <dialog>
        <div>
            <h3 class="title">Discount</h3>
            <div class="offers">
                <%int i=0;
                for(Discount dis : list){%>
                <div id="<%="item" + i%>" class="item">
                    <form action="/SWP391/applyDiscount">
                        <input type="hidden" name="discount" value="<%=dis.getID()%>"
                        <p><%=dis.getName()%> </p><br>
                        <button id="<%="item" + i + "-btn"%>">apply</button>
                    </form>
                </div>
                <%}%>
            </div>
    </dialog>
    <script>
        const dialogElement = document.querySelector('dialog');

        document.getElementById("discount").addEventListener("click", () =>{
            dialogElement.showModal();
        });

        dialogElement.addEventListener("click", (event) => {
            if(event.target == dialogElement)
                dialogElement.close();
        });
        
//        document.getElementById("vn-pay").addEventListener("click", () =>{
//            window.location.href = "/SWP391/Payment/vnpay_pay.jsp";
//        })
        
         $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
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
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
    </script>
    <script src="/SWP391/Home/assets/jquery-1.11.3.min.js"></script>
     <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    </body>
</html>
