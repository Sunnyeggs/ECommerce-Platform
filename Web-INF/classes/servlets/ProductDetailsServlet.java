package servlets;

import database.Product;
import database.ProductDBAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;


public class ProductDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemId = request.getParameter("item_id");
        
        if (itemId != null) {
            try {
                // Get product details from DB based on item_id
                ProductDBAO productDBAO = new ProductDBAO();
                Product product = productDBAO.getProductById(itemId); // Implement getProductById method in ProductDBAO
                
                if (product != null) {
                    // Set product attribute and forward to JSP
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("/productDetails.jsp").forward(request, response);
                } else {
                    response.sendRedirect("products"); // Redirect if product not found
                }
            } catch (SQLException e) {
                throw new ServletException("Database error while retrieving product details", e);
            }
        } else {
            response.sendRedirect("products"); // Redirect if item_id is not provided
        }
    }
}
