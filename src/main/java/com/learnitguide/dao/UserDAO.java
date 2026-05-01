package com.learnitguide.dao;

import com.learnitguide.model.User;
import java.sql.*;

public class UserDAO {

//	private static DBConnection dbconnection = new DBConnection();

    private static final String SELECT_USER_BY_USERNAME = "SELECT username, password,isactive FROM user_details WHERE username = ? and isactive = true";
    
    private static final String INSERT_NEW_USER = "insert into user_details (username,last_changed, email, password, isactive ) values (? , ? , ? , ?, ?)";
    
    
    // Fetch user by username
    public User findUserByName(String username) {
        User user = null;
        try (
        		Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_USER_BY_USERNAME)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String uname = rs.getString("username");
                String pass = rs.getString("password");
                user = new User(uname, pass); // Model object
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    
    public boolean userAddition(String username, String password, String nickname, String email) {
    	
    	try {
    		Connection userAddcon = DBConnection.getConnection();
    		PreparedStatement ps = userAddcon.prepareStatement(INSERT_NEW_USER);
    		
    		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
    		
    		ps.setString(1, username);
    		ps.setTimestamp(2, currentTimestamp); 
    		ps.setString(3, email);
    		ps.setString(4, password);
    		ps.setBoolean(5, true);
    		System.out.println("ps query prepared in UserDAO" + ps.toString());
    		int rowsAffected = ps.executeUpdate();
    		
    		if(rowsAffected == 1) {
    			return true;
    		}
    		
    		System.out.println("ps.executeQuery output is : " + ps.executeQuery() + "execute upate " + ps.executeUpdate());
    		
    	}
    	catch (SQLException e) {
    		e.printStackTrace();
    	}
    	
    	return false;  	
    	
    }

}
