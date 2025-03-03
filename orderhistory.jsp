<%@ page import="java.util.List" %>
<%@ page import="servlets.Transaction" %>
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


        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5 text-center">
                <img src="assets/LOGO.png" alt="Hot Market Logo" style="width:200px; height:100px; display:block; margin:auto;">
                <h1 class="display-4 fw-bolder" style="color: red;">Your Online Market Place</h1>
                <p class="lead fw-normal text-white mb-0">Serves all your needs</p>
            </div>
        </header>

<!-- Order History -->
<div class="container mt-5">
    <h1 class="text-center mb-4">Your Order History</h1>
    
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Item ID</th>
                <th>Title</th>
                <th>Price</th>
                <th>Transaction Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                if (transactions != null && !transactions.isEmpty()) {
                    for (Transaction transaction : transactions) {
            %>
            <tr>
                <td><%= transaction.getItemId() %></td>
                <td><%= transaction.getTitle() %></td>
                <td>$<%= transaction.getSalePrice() %></td>
                <td><%= transaction.getTransactionDate() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4" class="text-center">No order history available.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
