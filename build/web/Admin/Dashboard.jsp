<%-- 
    Document   : Dashboard
    Created on : Jul 2, 2024, 4:25:47 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container mt-5">
            <h1 class="text-center mb-4">Dashboard</h1>
            <%
                int[] incomes = (int[]) request.getAttribute("incomes");
            %>
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th></th>
                        <th>Jan</th>
                        <th>Feb</th>
                        <th>Mar</th>
                        <th>Apr</th>
                        <th>May</th>
                        <th>Jun</th>
                        <th>Jul</th>
                        <th>Aug</th>
                        <th>Sep</th>
                        <th>Oct</th>
                        <th>Nov</th>
                        <th>Dec</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>Income</th>
                        <% for(int i = 0; i < 12; i++) { %>
                            <td><%= incomes[i] %></td>
                        <% } %>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
