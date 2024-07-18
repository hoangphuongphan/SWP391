<%-- 
    Document   : Food
    Created on : Jun 25, 2024, 1:32:29 PM
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #343a40;
        }
        .container {
            margin-top: 20px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .food-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            margin-bottom: 10px;
        }
        .review-box {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    
    <% Food food = new FoodDao().getFoodByID(Integer.parseInt(request.getParameter("FoodID")));
       ArrayList<Category> cates = new CategoryDao().getAllCategories();
       ArrayList<Rate> rates = new RateDao().getRateByFood(food.getID());
       ReviewDao dao = new ReviewDao();
    %>
    
    <div class="container">
        <form action="/SWP391/ChangeFoodInfo" method="post" enctype="multipart/form-data">
            <input type="hidden" value="<%= request.getParameter("FoodID") %>" name="FoodID">
            <div class="form-group">
                <label for="uploadImage">Food Image:</label><br>
                <img src="<%= food.getImgurl() %>" id="uploadPreview" class="food-image" /><br>
                <input id="uploadImage" type="file" name="myPhoto" onchange="PreviewImage();" />
            </div>
            <div class="form-group">
                <label for="Name">Name:</label>
                <input type="text" class="form-control" id="Name" name="Name" value="<%= food.getName() %>" />
            </div>
            <div class="form-group">
                <label for="Price">Price:</label>
                <input type="text" class="form-control" id="Price" name="Price" value="<%= food.getPrice() %>" />
            </div>
            <div class="form-group">
                <label for="Category">Category:</label>
                <select class="form-control" id="Category" name="Category">
                    <% for(Category cate : cates) { %>
                        <option value="<%=cate.getCategoryID()%>"><%=cate.getName()%></option>
                    <% } %>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        
        <% for(Rate rate : rates) { %>
            <div class="review-box">
                <h5><%= rate.getUser().getName() %> rated <%= rate.getRate() %> star(s)</h5>
                <p><%= dao.getReviewByRate(rate.getRateID()).getContent() %></p>
                <form id="reply-form-<%= rate.getRateID() %>" action="/SWP391/Reply">
                    <input type="hidden" name="FoodID" value="<%= food.getID() %>"/>
                    <input type="hidden" name="RateID" value="<%= rate.getRateID() %>"/>
                    <div class="form-group">
                        <label for="reply">Reply:</label>
                        <input type="text" class="form-control" id="reply" name="reply" value="<%= rate.getReply() %>" onblur="Reply('<%= rate.getRateID() %>')" />
                    </div>
                </form>
            </div>
        <% } %>
    </div>
    
    <script type="text/javascript">
        function PreviewImage() {
            var oFReader = new FileReader();
            oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

            oFReader.onload = function (oFREvent) {
                document.getElementById("uploadPreview").src = oFREvent.target.result;
            };
        };
        
        function Reply(rateID) {
            document.getElementById("reply-form-" + rateID).submit();
        }
    </script>
</body>
</html>
