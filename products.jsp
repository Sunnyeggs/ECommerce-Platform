<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, database.Product" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Hot Market - Product List</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <!-- Navigation-->
        
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
                    <a class="nav-link active" aria-current="page" href="products" style="font-size: 1.25rem; font-weight: bold; color: red;">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="OrderHistoryServlet" style="font-size: 1.25rem; font-weight: bold; color: red;">Order History</a>
                </li>
            </ul>
                        <!-- Search Bar Form -->
<form class="d-flex me-auto" action="SearchServlet" method="GET">
    <input class="form-control me-2" type="search" id="search-bar" name="query" placeholder="Search for products..." aria-label="Search">

</form>


            <div class="d-flex align-items-center">
                        <!-- Cart Button -->
                        
                       
                        <a href="cart.html" class="btn btn-outline-dark me-3">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </a>
                       <!-- Check if the user is logged in -->
                    <%
    String username = (session != null) ? (String) session.getAttribute("username") : null;

    if (username != null) {
%>
    <!-- If logged in, display the user's name -->

    <!-- Display the welcome message if logged in -->
   
    
    <div class="dropdown">
    <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
        Welcome, <%= username %>
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
    </ul>
</div>
    

<%
    } else {
%>
    <!-- If not logged in, show the login button -->
    <a href="<%= request.getContextPath() %>/LoginServlet" class="btn btn-outline-dark" role="button">
        <i class="bi bi-person-circle me-1"></i>
        Login
    </a>
<%
    }
%>

                    </form>
                </div>
            </div>
            </div>
        </nav>

        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5 text-center">
                <img src="assets/LOGO.png" alt="Hot Market Logo" style="width:200px; height:100px; display:block; margin:auto;">
                <h1 class="display-4 fw-bolder" style="color: red;">Your Online Market Place</h1>
                <p class="lead fw-normal text-white mb-0">Serves all your needs</p>
            </div>
        </header>

        <!-- Product Section -->
        <section class="py-5">
        <div id="product-list">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <%
                        // Fetching products list from request attribute
                        List<Product> products = (List<Product>) request.getAttribute("products");
                        if (products != null && !products.isEmpty()) {
                            // Looping through the products to display them
                            for (Product product : products) {
                    %>
                <div class="col mb-5">
                    <div class="card h-100">
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product Title -->
                                <img class="card-img-top" src="<%= request.getContextPath() %>/assets/<%= product.getImageUrl() %>" alt="Product image" style="height: 200px; object-fit: cover;">
                                
                                <h5 class="fw-bolder"><%= product.getTitle() %></h5>
                                <!-- Product Condition -->
                                <p style="color: black;">Condition: <%= product.getItemCondition() %></p>
								<p style="color: black;">Price: <%= product.getPrice() %></p>
									 <p style="color: black;">Posted Date: <%= product.getPostedDate() %></p>
                                <!-- Product Posted Date -->
                               
                            </div>
                        </div>
                            <!-- Product actions -->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="productDetails?item_id=<%= product.getItemId() %>"  style="background-color: blue; color: white;">View Details</a>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <%
                            }
                        } else {
                    %>
                    <p>No products found.</p>
                    <%
                        }
                    %>
                </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container text-center">
        <p class="m-0 text-white">
            Copyright &copy; Hot Market 2024 | 
            <a href="contact.jsp" class="text-white" style="text-decoration: underline;">Contact Us</a>
        </p>
    </div>
</footer>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        <!-- Include jQuery for the AJAX functionality -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- JavaScript for AJAX-based search -->
<script>
    $(document).ready(function() {
        console.log("Document is ready"); // Check if the script is running

        // Attach the event listener to the search bar
        $('#search-bar').on('input', function() {
            console.log("Input event detected"); // Log input event detection

            var query = $(this).val();
            console.log("Search query: " + query); // Log the current query in the console

            // Send AJAX request only if there is a query
          
                $.ajax({
                    url: 'SearchServlet', // URL of your search servlet
                    type: 'GET',
                    data: { query: query },
                    success: function(response) {
                        console.log("Response received"); // Log when a response is received
                        // Update the product listing or search results on the page
                        $('#product-list').html(response); // Assuming product-list is the div where results are shown
                    },
                    error: function(xhr, status, error) {
                        console.error("Error occurred: " + error); // Log error if the request fails
                    }
                });
           
        });
    });
</script>
        
    </body>
</html>
