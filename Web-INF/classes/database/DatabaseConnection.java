package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    public static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection (adjust these parameters to match your DB)
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ipproj", "root", "toor"); // Modify as per your setup
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Unable to connect to database", e);
        }
    }
}
