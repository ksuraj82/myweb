package com.learnitguide.dao;

import com.learnitguide.model.User;
import java.sql.*;

public class UserDAO {

//	private static DBConnection dbconnection = new DBConnection();

    private static final String SELECT_USER_BY_USERNAME =
        "SELECT username, password,isactive FROM user_details WHERE username = ? and isactive = true";
    
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
}
