package com.learnitguide.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learnitguide.service.UserAuthentication;

import javax.servlet.RequestDispatcher;

//import java.util.Calendar;

//import com.learnitguide.util.JwtUtil;
//import javax.servlet.http.Cookie;
/**
 * Servlet implementation class Login
 */

@WebServlet("/signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		// extracting the parameter from the login form
		String uname = request.getParameter("username");
		String password = request.getParameter("password");
		String nickname = request.getParameter("webname");
		String email = request.getParameter("email");		

		
		UserAuthentication authentication = new UserAuthentication();
		

		//this validation is done to check if the user have login and password stored in DB or not.
		//if not , need to generate the username and password and to update the data in DB.
		
		if (!authentication.getvalidateUser(uname, password)) {
			
			boolean userCreation = authentication.createUser(uname,password,nickname,email);
			if(userCreation) {
				
				HttpSession session = request.getSession(true);
			    session.setAttribute("message", "Account created. Please proceed to login");
				
				response.sendRedirect(request.getContextPath() + "/Login");
				
				System.out.println("user is created and we are inside the userCreation if statement");
				
				return;
			}
		}
		
		
		request.setAttribute("message", "Account not created. Please try again");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login_signup.jsp");
		rd.forward(request, response);
		

	
	
	}

}
