package com.learnitguide.service;

import com.learnitguide.model.User;
import com.learnitguide.dao.UserDAO;

public class UserAuthentication {
	
	private UserDAO userDB = new UserDAO();
	
	public boolean getvalidateUser(String uname, String password) {
		User user = userDB.findUserByName(uname);
		
		if(user!=null && user.getPassword().equals(password)) {
			return true;
		}
		
		return false;
	}
	
}	
	

