package servlets;

import database.TransactionDBAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;


public class ConfirmPurchaseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming user is logged in, and we have buyer_id in session
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.sendRedirect("LoginServlet"); // Redirect to login if not logged in
            return;
        }

        // Get parameters from the form (product details)
        String itemId = request.getParameter("item_id");
        String price = request.getParameter("price");
        String title = request.getParameter("title"); // Assuming you're sending the title too

        // For this example, assume buyer_id is fetched from session
        int buyerId = (int) request.getSession().getAttribute("user_id"); // Assuming user_id is stored in session

        if (itemId != null && price != null && title != null) {
            try {
                // Create an instance of TransactionDBAO and add a transaction
                TransactionDBAO transactionDBAO = new TransactionDBAO();
                transactionDBAO.addTransaction(itemId, title, price, buyerId);

                // Redirect to a success page after transaction
                response.sendRedirect("transactionSuccess.jsp");
            } catch (SQLException e) {
                throw new ServletException("Database error while processing the purchase", e);
            }
        } else {
            response.sendRedirect("products"); // Redirect to products if item_id or price is missing
        }
    }
}
