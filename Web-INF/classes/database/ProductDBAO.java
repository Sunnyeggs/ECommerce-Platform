package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDBAO {

    // Method to get all products
	public List<Product> getAllProducts() throws SQLException {
	    List<Product> productList = new ArrayList<>();
	    
	    String query = "SELECT item_id, seller_id, title, description, price, category_id, status, location, image_url, posted_date, item_condition, is_featured, views FROM Items";
	    try (Connection connection = DatabaseConnection.getConnection();
	         PreparedStatement ps = connection.prepareStatement(query)) {

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Product product = new Product();
	            
	            // Populate product with data from the result set
	            product.setItemId(rs.getInt("item_id"));
	            product.setSellerId(rs.getInt("seller_id"));
	            product.setTitle(rs.getString("title"));
	            product.setDescription(rs.getString("description"));
	            product.setPrice(rs.getBigDecimal("price"));
	            product.setCategoryId(rs.getInt("category_id"));
	            product.setStatus(rs.getString("status"));
	            product.setLocation(rs.getString("location"));
	            product.setImageUrl(rs.getString("image_url"));
	            product.setPostedDate(rs.getTimestamp("posted_date"));
	            product.setItemCondition(rs.getString("item_condition"));
	            product.setFeatured(rs.getBoolean("is_featured"));
	            product.setViews(rs.getInt("views"));

	            // Add product to the list
	            productList.add(product);
	        }
	    } catch (SQLException e) {
	        throw new SQLException("Error fetching products", e);
	    }
	    
	    System.out.println("Number of products fetched: " + productList.size());

	    // Return the full list of products
	    return productList;
	}

    // Method to search products by query (e.g., by title)
    public List<Product> searchProducts(String queryParam) throws SQLException {
        List<Product> productList = new ArrayList<>();
        
        // SQL query to search for products by title
        String query = "SELECT item_id, seller_id, title, description, price, category_id, status, location, image_url, posted_date, item_condition, is_featured, views " +
                       "FROM Items WHERE title LIKE ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
             
            // Use wildcard search with the query parameter
            ps.setString(1, "%" + queryParam + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                
                product.setItemId(rs.getInt("item_id"));
                product.setSellerId(rs.getInt("seller_id"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getBigDecimal("price"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setStatus(rs.getString("status"));
                product.setLocation(rs.getString("location"));
                product.setImageUrl(rs.getString("image_url"));
                product.setPostedDate(rs.getTimestamp("posted_date"));
                product.setItemCondition(rs.getString("item_condition"));
                product.setFeatured(rs.getBoolean("is_featured"));
                product.setViews(rs.getInt("views"));

                productList.add(product);
            }
        } catch (SQLException e) {
            throw new SQLException("Error searching products", e);
        }
        
        return productList;
    }

    // Method to get a product by its ID
    public Product getProductById(String itemId) throws SQLException {
        Product product = null;
        
        String query = "SELECT * FROM Items WHERE item_id = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
             
            ps.setString(1, itemId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                product = new Product();
                product.setItemId(rs.getInt("item_id"));
                product.setSellerId(rs.getInt("seller_id"));   // Add seller ID
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getBigDecimal("price"));   // Add price field
                product.setCategoryId(rs.getInt("category_id"));   // Add category ID
                product.setStatus(rs.getString("status"));     // Add status field
                product.setLocation(rs.getString("location")); // Add location field
                product.setImageUrl(rs.getString("image_url"));  // Add image URL (if needed)
                product.setPostedDate(rs.getTimestamp("posted_date"));
                product.setItemCondition(rs.getString("item_condition"));
                product.setFeatured(rs.getBoolean("is_featured")); // Add isFeatured field
                product.setViews(rs.getInt("views"));
            }
        } catch (SQLException e) {
            throw new SQLException("Error fetching product details by ID", e);
        }
        
        return product;
    }
}
