<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Hot Market</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Include Google Maps JavaScript API -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvPz3VVDnRSGwTiGmA_P3pDgCNvUCioDg&callback=initMap" async defer></script>

    <script>
        function initMap() {
            var ntuLocation = { lat: 1.3483, lng: 103.6831 }; // NTU Singapore coordinates

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15,
                center: ntuLocation
            });

            var marker = new google.maps.Marker({
                position: ntuLocation,
                map: map
            });
        }
    </script>

    <style>
        #map {
            height: 500px;
            width: 100%;
        }

        .location-section {
            margin-top: 30px;
        }

        .section-header {
            font-size: 1.8rem;
            font-weight: bold;
            color: #343a40;
            padding-bottom: 10px;
        }

        .operating-hours {
            font-size: 1rem;
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }

        .note {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5 d-flex justify-content-between align-items-center">
        <a class="navbar-brand" href="#!" style="border: 2px solid #ccc; padding: 6px; display: inline-block;">
            <img src="assets/LOGO.png" alt="Hot Market Logo" style="width: 100px; height: 50px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a class="nav-link" href="products" style="font-size: 1.25rem; font-weight: bold; color: red;">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="OrderHistoryServlet" style="font-size: 1.25rem; font-weight: bold; color: red;">Order History</a>
                </li>
            </ul>

            <!-- Cart and User Info -->
            <div class="d-flex align-items-center">
                <a href="cart.html" class="btn btn-outline-dark me-3">
                    <i class="bi-cart-fill me-1"></i> Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </a>
                <!-- User Welcome Dropdown -->
                <div class="dropdown">
                    <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                        Welcome, <%= (session.getAttribute("username") != null) ? session.getAttribute("username") : "Guest" %>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>

<!-- Header -->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5 text-center">
        <img src="assets/LOGO.png" alt="Hot Market Logo" style="width:200px; height:100px; display:block; margin:auto;">
        <h1 class="display-4 fw-bolder" style="color: red;">Your Online Market Place</h1>
        <p class="lead fw-normal text-white mb-0">Serves all your needs</p>
    </div>
</header>

<!-- Location Section -->
<div class="container location-section">
    <div class="section-header text-center">
        <span class="text-primary"><i class="bi bi-geo-alt-fill"></i></span> Location
    </div>

    <!-- Google Map -->
    <h3 class="text-center">Find Us at NTU</h3>
    <div id="map"></div>

    <div class="operating-hours text-center mt-4">
        <h5>Operating Hours</h5>
        <p>Monday to Friday: 8:00 am - 4:30 pm</p>
        <p>Closed on Saturdays, Sundays, and Public Holidays</p>
        <p>Please plan your visit to NTU accordingly.</p>
        <p class="note">Note: There may be road closures near NTU. Please check for updates.</p>
    </div>
</div>

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Hot Market 2024</p>
        <p class="m-0 text-center text-white"><a href="contact.jsp" class="text-white">Contact Us</a></p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
