package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import database.ProductDBAO;
import database.Product;
import java.sql.SQLException;


public class SearchServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");

        try {
            // Correctly instantiate and call the searchProducts method on the object
            ProductDBAO productDBAO = new ProductDBAO(); // Instantiate ProductDBAO
            List<Product> searchResults; 
            
            if (query == null || query.trim().isEmpty()) {
            	 searchResults = productDBAO.getAllProducts(); // Call a method to fetch all products
            } else {
            	 searchResults = productDBAO.searchProducts(query); // Call the searchProducts method
            }
            

            // Return the HTML for search results (can also be JSON if using JSON-based handling)
            request.setAttribute("products", searchResults);
            request.getRequestDispatcher("/searchResults.jsp").forward(request, response);
            System.out.println("Number of products returned for display: " + searchResults.size());

        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception for debugging
            throw new ServletException("Database error while searching products", e);
        }
    }
}
