<%@ page import="java.util.List" %>
<%@ page import="database.Product" %>

<% 
    // Retrieve the products list from the request attribute
    List<Product> products = (List<Product>) request.getAttribute("products");
%>

<div class="container px-4 px-lg-5 mt-5">
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <% if (products != null && !products.isEmpty()) { %>
            <% for (Product product : products) { %>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product Image -->
                        <img class="card-img-top" src="<%= request.getContextPath() %>/assets/<%= product.getImageUrl() %>" alt="Product image" style="height: 200px; object-fit: cover;">
                        
                        <!-- Product Details -->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product Title -->
                                <h5 class="fw-bolder"><%= product.getTitle() %></h5>
                                
                                <!-- Product Condition -->
                                <p style="color: black;">Condition: <%= product.getItemCondition() %></p>
                                <p style="color: black;">Price: <%= product.getPrice() %></p>
                                <!-- Product Posted Date -->
                                <p style="color: black;">Posted Date: <%= product.getPostedDate() %></p>
                            </div>
                        </div>
                        
                        <!-- Product Actions -->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <a class="btn btn-outline-dark mt-auto" href="productDetails?item_id=<%= product.getItemId() %>" style="background-color: blue; color: white;">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <p>No products found.</p>
        <% } %>
    </div>
</div>
