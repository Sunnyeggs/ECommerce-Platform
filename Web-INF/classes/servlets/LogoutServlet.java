package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;

public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Invalidate the session to log the user out
            session.invalidate();
        }

        // Redirect to login page after logout
        response.sendRedirect("products");
    }
}
