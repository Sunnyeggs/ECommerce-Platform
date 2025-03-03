package servlets;

import database.TransactionDBAO;

import servlets.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class OrderHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the user_id from session
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user_id") != null) {
            int userId = (int) session.getAttribute("user_id");  // Retrieve user_id from session
            
            try {
                // Create a TransactionDBAO instance
                TransactionDBAO transactionDBAO = new TransactionDBAO();

                // Fetch transactions for the logged-in user (buyer_id = userId)
                List<Transaction> transactions = transactionDBAO.getTransactionsByBuyerId(userId);

                // Set the transactions list as a request attribute
                request.setAttribute("transactions", transactions);

                // Forward the request to the JSP page
                request.getRequestDispatcher("orderhistory.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Database error while fetching transactions.");
            }
        } else {
            // If session or user_id is not found, redirect to login page
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Handle POST requests the same way as GET
    }
}