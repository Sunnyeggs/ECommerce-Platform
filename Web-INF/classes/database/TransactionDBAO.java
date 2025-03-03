package database;

import servlets.Transaction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class TransactionDBAO {

    // Database configuration
    public static String url = "jdbc:mysql://localhost/ipproj";
    public static String dbdriver = "com.mysql.jdbc.Driver";
    public static String username = "root";
    public static String password = "toor";

    // Method to add a transaction to the database
    public void addTransaction(String itemId, String title, String price, int buyerId) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName(dbdriver);

            // Establish database connection
            conn = DriverManager.getConnection(url, username, password);

            // Create SQL query to insert transaction record with the buyer_id
            String sql = "INSERT INTO Transactions (item_id, title, sale_price, transaction_date, buyer_id) " +
                         "VALUES (?, ?, ?, NOW(), ?)";
            ps = conn.prepareStatement(sql);

            // Set the values
            ps.setString(1, itemId);   // item_id
            ps.setString(2, title);    // title from the item
            ps.setString(3, price);    // sale_price
            ps.setInt(4, buyerId);     // buyer_id

            // Execute the update
            ps.executeUpdate();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found.", e);
        } finally {
            // Close resources
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }

    // Method to fetch all transactions for a specific buyer_id (user_id)
    public List<Transaction> getTransactionsByBuyerId(int buyerId) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName(dbdriver);

            // Establish database connection
            conn = DriverManager.getConnection(url, username, password);

            // Create SQL query to fetch transactions for the specific buyer_id (user_id)
            String sql = "SELECT transaction_id, item_id, title, sale_price, transaction_date FROM Transactions WHERE buyer_id = ?";
            ps = conn.prepareStatement(sql);

            // Set the buyer_id value
            ps.setInt(1, buyerId);

            // Execute the query
            rs = ps.executeQuery();

            // Process the result set
            while (rs.next()) {
                int transactionId = rs.getInt("transaction_id");
                int itemId = rs.getInt("item_id");
                String title = rs.getString("title");
                double salePrice = rs.getDouble("sale_price");
                Timestamp transactionDate = rs.getTimestamp("transaction_date");

                // Create a Transaction object and add it to the list
                transactions.add(new Transaction(transactionId, itemId, title, 0, 0, salePrice, transactionDate));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found.", e);
        } finally {
            // Close resources
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return transactions;
    }

    // Method to fetch all transactions (no filtering)
    public List<Transaction> getAllTransactions() throws SQLException {
        List<Transaction> transactions = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName(dbdriver);

            // Establish database connection
            conn = DriverManager.getConnection(url, username, password);

            // Create SQL query to fetch all transactions
            String sql = "SELECT transaction_id, item_id, title, sale_price, transaction_date FROM Transactions";
            ps = conn.prepareStatement(sql);

            // Execute the query
            rs = ps.executeQuery();

            // Process the result set
            while (rs.next()) {
                int transactionId = rs.getInt("transaction_id");
                int itemId = rs.getInt("item_id");
                String title = rs.getString("title");
                double salePrice = rs.getDouble("sale_price");
                Timestamp transactionDate = rs.getTimestamp("transaction_date");

                // Create a Transaction object and add it to the list
                transactions.add(new Transaction(transactionId, itemId, title, 0, 0, salePrice, transactionDate));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("MySQL JDBC Driver not found.", e);
        } finally {
            // Close resources
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }

        return transactions;
    }
}
