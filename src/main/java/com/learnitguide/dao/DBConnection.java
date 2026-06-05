package com.learnitguide.dao;

//DBConnection.java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.Context;
import javax.sql.DataSource;

public class DBConnection {
	


	
 private static final String JDBC_URL = "jdbc:postgresql://"+System.getProperty("DB_HOST")+":"+System.getProperty("DB_PORT")+"/"+System.getProperty("DB_NAME"); // your DB name
 private static final String JDBC_USER = System.getProperty("DB_USER"); // your DB username
 private static final String JDBC_PASS = System.getProperty("DB_USER"); // your DB password

 // Method to get a connection
 
 public static Connection getConnection() throws SQLException {
	 try {
	        Class.forName("org.postgresql.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new SQLException("PostgreSQL Driver not found!", e);
	    }
     return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
//	 Context initCtx = new InitialContext();
//     DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/webuserDB");
//     return ds.getConnection();
 }
 
}

