<%-- 
    Document   : Food
    Created on : Jun 25, 2024, 1:32:29 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Food" %>
<%@page import="Dao.FoodDao" %>
<%@page import="Model.Rate" %>
<%@page import="Model.Review" %>
<%@page import="Dao.RateDao" %>
<%@page import="Dao.ReviewDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Category" %>
<%@page import="Dao.CategoryDao" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%Food food = new FoodDao().getFoodByID(Integer.parseInt(request.getParameter("FoodID")));
        ArrayList<Category> cates = new CategoryDao().getAllCategories();
        ArrayList<Rate> rates = new RateDao().getRateByFood(food.getID());
            ReviewDao dao = new ReviewDao();%>
        
        <div class="container">
            <form action="/SWP391/ChangeFoodInfo" method="post" enctype="multipart/form-data">
                <input type="hidden" value="<%=request.getParameter("FoodID")%>" name="FoodID">
            <img src="<%=food.getImgurl()%>" id="uploadPreview" style="width: 100px; height: 100px;" />
            <input id="uploadImage" type="file" name="myPhoto" onchange="PreviewImage();" /><br>
            <label>Name:</label>
            <input name="Name" value="<%=food.getName()%>"/><br>
            <label>Price</label>
            <input name="Price" value ="<%=food.getPrice()%>"/><br>
            <select name="Category" >
                <%for(Category cate : cates){%>
                    <option value="<%=cate.getCategoryID()%>"><%=cate.getName()%></option>
                <%}%>
            </select><br>
            <input type="submit" value="submit"/>
        </form>
            <%for(Rate rate : rates){%>
            <div style="border: 1px solid black;">
                <h3><%=rate.getUser().getName()%></h3>
                <h4><%=rate.getRate()%> star(s)</h4>
                <p><%=dao.getReviewByRate(rate.getRateID()).getContent()%></p>
                <form id="reply-form" action="/SWP391/Reply">
                    <input type="hidden" name="FoodID" value="<%=food.getID()%>"/>
                    <input type="hidden" name="RateID" value="<%=rate.getRateID()%>"/>
                    <input type="text" name="reply" value="<%=rate.getReply()%>" onfocusout="Reply()"/>
                </form>
            </div>
            <%}%>
        <script type="text/javascript">

            function PreviewImage() {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

                oFReader.onload = function (oFREvent) {
                    document.getElementById("uploadPreview").src = oFREvent.target.result;
                };
            };
            
            function Reply() {
                document.getElementById("reply-form").submit();
            }
        </script>
        </div>
    </body>
</html>
