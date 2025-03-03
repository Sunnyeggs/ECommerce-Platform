<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="database.Product" %>

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

                   
                </div>
            </div>
            </div>
        </nav>

    <!-- "Hot Market" Section -->
    <section class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5 text-center">
            <img src="assets/LOGO.png" alt="Hot Market Logo" style="width:200px; height:100px; display:block; margin:auto;">
            <h1 class="display-4 fw-bolder" style="color: red;">Your Online Market Place</h1>
            <p class="lead fw-normal text-white mb-0">Serves all your needs</p>
        </div>
    </section>

    <!-- Product Details Section -->
 <!-- Product Details Section -->
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <!-- Product Details with Card Styling -->
            <div class="card shadow-sm p-4 rounded">
                <div class="card-body">
                    <%
                        Product product = (Product) request.getAttribute("product");
                        if (product != null) {
                    %>
                    <!-- Product Image Inside Card -->
                    <div class="text-center mb-4">
                        <img class="img-fluid rounded shadow" src="<%= request.getContextPath() %>/assets/<%= product.getImageUrl() %>" alt="Product Image" style="width: 100%; max-height: 350px; object-fit: contain;">
                    </div>
                    <!-- Product Details -->
                    <h4 class="card-title mb-4 text-center text-danger"><strong><%= product.getTitle() %></strong></h4>
                    <p style="color: black;"><strong>Description:</strong> <%= product.getDescription() %></p>
                    <p style="color: black;"><strong>Condition:</strong> <%= product.getItemCondition() %></p>
                    <p style="color: black;"><strong>Views:</strong> <%= product.getViews() %></p>
                    <p style="color: black;"><strong>Posted Date:</strong> <%= product.getPostedDate() %></p>
                   
                    <p style="color: black;"><strong>Location:</strong> <%= product.getLocation() %></p>
                    <p style="color: black;"><strong>Status:</strong> <%= product.getStatus() %></p>
                    <p style="color: black;"><strong>Category ID:</strong> <%= product.getCategoryId() %></p>
                    <p style="color: black;"><strong>Is Featured:</strong> <%= product.isFeatured() ? "Yes" : "No" %></p>
                     <p style="color: black;"><strong>Price:</strong> $<%= product.getPrice() %></p>
                    <%
                        } else {
                            out.println("Product details not found.");
                        }
                    %>
                </div>
                <!-- Buttons -->
                
							<div class="mt-4 d-flex justify-content-center">
			    <a href="products" class="btn btn-primary me-3 px-4 py-2">Back to Products</a>
			    <form action="confirmPurchase" method="post">
			        <input type="hidden" name="item_id" value="<%= product.getItemId() %>">
			        <input type="hidden" name="price" value="<%= product.getPrice() %>">
			        <input type="hidden" name="title" value="<%= product.getTitle() %>"> <!-- Pass the title -->
			        
			        <button type="submit" class="btn btn-success px-4 py-2">Confirm Purchase</button>
			    </form>
			</div>

                    


                </div>
            </div>
        </div>
    </div>



<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container text-center">
        <p class="m-0 text-white">
            Copyright &copy; Hot Market 2024 | 
            <a href="contact.jsp" class="text-white" style="text-decoration: underline;">Contact Us</a>
        </p>
    </div>
</footer>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
