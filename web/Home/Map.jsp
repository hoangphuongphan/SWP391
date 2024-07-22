<%-- 
    Document   : Map
    Created on : Jun 25, 2024, 9:05:14 PM
    Author     : phoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Basic Map with Geocoder</title>

    <!-- Styles -->
    <link href="https://unpkg.com/maplibre-gl@3/dist/maplibre-gl.css" rel="stylesheet" />
    <style>
      body {
        margin: 0;
      }
      #map {
        height: 100vh;
      }
      .form-container {
        position: absolute;
        top: 60px; /* Adjust to position the button below the geocoder */
        left: 10px;
        background: white;
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
      }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  </head>
  
  <body>
      <%@include file="navbar.jsp" %>v
    <main>
      <div id="map"></div>
      <div class="form-container">
          <form id="location-form" action="/SWP391/PickLocation">
          <input type="hidden" id="location-input" name="location" />
          <button type="submit">Submit</button>
        </form>
      </div>
    </main>
    
    <!-- JavaScript dependencies -->
    <script src="https://unpkg.com/maplibre-gl@3"></script>
    <script src="https://unpkg.com/@aws/amazon-location-client@1/dist/amazonLocationClient.js"></script>
    <script src="https://unpkg.com/@aws/amazon-location-utilities-auth-helper@1/dist/amazonLocationAuthHelper.js"></script>
    <script src="https://unpkg.com/@maplibre/maplibre-gl-geocoder@1/dist/maplibre-gl-geocoder.min.js"></script>
    <link
      rel="stylesheet"
      href="https://unpkg.com/@maplibre/maplibre-gl-geocoder/dist/maplibre-gl-geocoder.css"
      type="text/css"
    />

    <!-- JavaScript for the app -->
    <script src="js/mapMain.js"></script>
    <jsp:include page="homefooter.jsp"/>
  </body>
</html>

