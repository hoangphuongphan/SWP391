<%-- 
    Document   : homefeaturefood
    Created on : Jun 13, 2024, 7:18:40 PM
    Author     : DELL
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container">
    <div class="row">
        <div class="col-6">
            <h5 class="mt-3">What to eat today</h5>
        </div>
        <div class="col-6 text-right">
            <a class="btn btn-primary mb-3 mr-1" href="#slide" role="button" data-slide="prev">
                <i class="fa fa-arrow-left"></i>
            </a>
            <a class="btn btn-primary mb-3 mr-1" href="#slide" role="button" data-slide="next">
                <i class="fa fa-arrow-right"></i>
            </a>
        </div>
        <div class="col-12">
            <div id="slide" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <c:forEach var="crsItems" items="${ffl}">
                        <li data-target="#slide">
                        </li>
                    </c:forEach>
                </ol> 
                <div class="carousel-inner">
                    <c:forEach var="crsItems" items="${ffl}">
                        <div class="row">
                            <div class="col-md-4 mb-2 align-self-center">
                                <div class="carousel-item">
                                    <a href="#"><img src="${crsItems.imgurl}" alt="alt"/></a>
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>${crsItems.name}</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>