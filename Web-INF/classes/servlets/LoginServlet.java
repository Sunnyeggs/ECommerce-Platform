package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginServlet
 */
import database.AccountDBAO;


/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("id");  // Assuming 'id' is the username from the form
        String password = request.getParameter("password");

        try {
            AccountDBAO account = new AccountDBAO();
            int userId = account.authenticate(username, password); // Get user_id from database

            if (userId != -1) {
                // If authentication is successful, store both username and user_id in the session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("user_id", userId);  // Store user_id in session

                // Redirect to the products page
                response.sendRedirect(request.getContextPath() + "/products");
            } else {
                // If authentication fails, redirect back to the login page
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");  // Redirect to login on error
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Handle POST requests the same way as GET
    }
}
