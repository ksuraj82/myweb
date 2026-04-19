package com.learnitguide.model;

public class User {

	private String uname;
	private String password;
	
	public User(String username,String password) {
		this.uname = username;
		this.password = password;
		
		
	}
	


	/**
	 * @return the uname
	 */
	public String getUname() {
		return uname;
	}

	/**
	 * @param uname the uname to set
	 */
	private void setUname(String uname) {
		this.uname = uname;
	}

	/**
	 * @param password the password to set
	 */
	private void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	
}
	
	
	

