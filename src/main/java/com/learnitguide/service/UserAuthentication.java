package com.learnitguide.service;

import com.learnitguide.model.User;
import com.learnitguide.dao.UserDAO;

public class UserAuthentication {
	
	private UserDAO userDB = new UserDAO();
	
	public boolean getvalidateUser(String uname, String password) {
		User user = userDB.findUserByName(uname);
//		System.out.println("inside getvalidateUser"+ uname + " the password : " + password);
		if(user!=null && user.getPassword().equals(password)) {
			return true;
		}
		
		return false;
	}
	
	public boolean createUser(String uname, String password, String nickname, String email) {
		
		if (uname != null || password != null || nickname != null || email != null ) {
//		System.out.println("createUser method called in UserAuthentication");
		return userDB.userAddition(uname,password,nickname,email);
		}
		
		return false;

	}
	
}	
	

