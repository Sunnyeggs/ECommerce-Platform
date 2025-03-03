package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.util.List;
import database.ProductDBAO;
import database.Product;

public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDBAO productDB;

    public void init() throws ServletException {
        productDB = new ProductDBAO();
    }

    public void destroy() {
        productDB = null;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            // Add debug statement
            System.out.println("ProductServlet: Fetching products from database...");
            
            // Retrieve the search query from the request, if any
            String query = request.getParameter("query");
            List<Product> productList;

            if (query != null && !query.trim().isEmpty()) {
                // If a search query is provided, fetch filtered products
                System.out.println("ProductServlet: Searching for products with query: " + query);
                productList = productDB.searchProducts(query);  // You'll need a searchProducts method in your DAO
            } else {
                // Fetch all products when no search query is provided
                productList = productDB.getAllProducts();
            }

            // Add debug statement
            System.out.println("ProductServlet: Number of products fetched: " + productList.size());

            // Set the product list as a request attribute
            request.setAttribute("products", productList);

            // Check if the request is an AJAX request
            String ajaxHeader = request.getHeader("X-Requested-With");
            if ("XMLHttpRequest".equals(ajaxHeader)) {
                // If it's an AJAX request, return partial HTML for the product list
                RequestDispatcher dispatcher = request.getRequestDispatcher("/searchResults.jsp");
                dispatcher.forward(request, response);
            } else {
                // For normal requests, forward to the full products.jsp page
                RequestDispatcher dispatcher = request.getRequestDispatcher("/products.jsp");
                dispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error fetching products", e);
        }
    }

    public String getServletInfo() {
        return "The Product servlet returns the product list page and handles search functionality.";
    }
}
