/*
 * Copyright (c) 2006 Sun Microsystems, Inc.  All rights reserved.  U.S.
 * Government Rights - Commercial software.  Government users are subject
 * to the Sun Microsystems, Inc. standard license agreement and
 * applicable provisions of the FAR and its supplements.  Use is subject
 * to license terms.
 *
 * This distribution may include materials developed by third parties.
 * Sun, Sun Microsystems, the Sun logo, Java and J2EE are trademarks
 * or registered trademarks of Sun Microsystems, Inc. in the U.S. and
 * other countries.
 *
 * Copyright (c) 2006 Sun Microsystems, Inc. Tous droits reserves.
 *
 * Droits du gouvernement americain, utilisateurs gouvernementaux - logiciel
 * commercial. Les utilisateurs gouvernementaux sont soumis au contrat de
 * licence standard de Sun Microsystems, Inc., ainsi qu'aux dispositions
 * en vigueur de la FAR (Federal Acquisition Regulations) et des
 * supplements a celles-ci.  Distribue par des licences qui en
 * restreignent l'utilisation.
 *
 * Cette distribution peut comprendre des composants developpes par des
 * tierces parties. Sun, Sun Microsystems, le logo Sun, Java et J2EE
 * sont des marques de fabrique ou des marques deposees de Sun
 * Microsystems, Inc. aux Etats-Unis et dans d'autres pays.
 */


package database;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;
import exception.*;
import cart.*;

public class AccountDBAO {

    Connection con;
    private boolean conFree = true;
    
    // Database configuration
    public static String url = "jdbc:mysql://localhost:3306/ipproj"; // Correct database name
    public static String dbdriver = "com.mysql.cj.jdbc.Driver"; // Updated driver
    public static String username = "root";
    public static String password = "toor";
    
    public AccountDBAO() throws Exception {
        try {
            /*
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/BookDB");
            con = ds.getConnection();
            */
            Class.forName(dbdriver);
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Connected to database successfully!");
            
        } catch (Exception ex) {
            System.out.println("Exception in AccountDBAO: " + ex);
            throw new Exception("Couldn't open connection to database: " +
                    ex.getMessage());
        }
    }
    
    public void remove() {
        try {
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    protected synchronized Connection getConnection() {
        while (conFree == false) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
        
        conFree = false;
        notify();
        
        return con;
    }
    
    protected synchronized void releaseConnection() {
        while (conFree == true) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
        
        conFree = true;
        notify();
    }
    
    
    public int authenticate(String username, String password) {
        int userId = -1;  // Default value indicating authentication failure

        try {
            // Correct the SQL query and get the user_id
            String selectStatement = "SELECT user_id FROM users WHERE username = ? AND password = ?";
            getConnection();  // Assuming getConnection() initializes 'con'
            
            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, username);
            prepStmt.setString(2, password);

            ResultSet rs = prepStmt.executeQuery();
            
            // If a user is found, return their user_id
            if (rs.next()) {
                userId = rs.getInt("user_id");
            }

            // Close resources after query
            rs.close();
            prepStmt.close();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            // Ensure connection is released after query, even in case of an exception
            releaseConnection();
        }

        return userId;  // Return user_id or -1 if authentication failed
    }
    

}
