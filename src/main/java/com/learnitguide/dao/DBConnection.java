package com.learnitguide.dao;

//DBConnection.java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	
 private static final String JDBC_URL = "jdbc:postgresql://192.168.1.60:5432/webuser"; // your DB name
 private static final String JDBC_USER = "postgres"; // your DB username
 private static final String JDBC_PASS = "postgres"; // your DB password

 // Method to get a connection
 
 public static Connection getConnection() throws SQLException {
	 try {
	        Class.forName("org.postgresql.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new SQLException("PostgreSQL Driver not found!", e);
	    }
     return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
 }
 
}

