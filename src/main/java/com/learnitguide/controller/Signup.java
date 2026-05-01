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
		
		
		System.out.println("this is the signup servlet");
		
		
		// extracting the parameter from the login form
		String uname = request.getParameter("username");
		String password = request.getParameter("password");
		String nickname = request.getParameter("webname");
		String email = request.getParameter("email");
		
		System.out.println("uname" + uname + " password" + password + " nickname" + nickname + " email" + email );
		
		

		
		UserAuthentication authentication = new UserAuthentication();
		

		//this validation is done to check if the user have login and password stored in DB or not.
		//if not , need to generate the username and password and to update the data in DB.
		
		if (!authentication.getvalidateUser(uname, password)) {
			
			boolean userCreation = authentication.createUser(uname,password,nickname,email);
			if(userCreation) {
//				request.setAttribute("message", "Account created. Please proceed to login");
				
				HttpSession session = request.getSession(true);
			    session.setAttribute("message", "Account created. Please proceed to login");
				
//				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login_signup.jsp");
//				rd.forward(request, response);
				
				response.sendRedirect(request.getContextPath() + "/Login");
				
				System.out.println("user is created and we are inside the userCreation if statement");
				
				return;
			}
		}
		
		
		request.setAttribute("message", "Account not created. Please try again");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login_signup.jsp");
		rd.forward(request, response);
		
		
		

		//creating the session object for the logged in user. removed as JWT token is implemented.
//		HttpSession session = request.getSession();
		
		//generating a unique token for the user. so the controller no need to verify the user from the database multiple time after logged in.
//		String token = JwtUtil.generateToken(uname);
		
		//Added the username to show it on each logged in page in JSP
//		session.setAttribute("username", uname);
		
//		This token will be used to validate the user for each page for 1 hour.
//		session.setAttribute("jwtToken", token);
		
//		Cookie jwtCookie = new Cookie("authToken",token);
		
//		jwtCookie.setHttpOnly(true); 
//		jwtCookie.setPath("/");      
//		jwtCookie.setMaxAge(3600);   

		// 3. Hand the cookie to the Browser
//		response.addCookie(jwtCookie);

		
//		String targetPage = (String) session.getAttribute("targetPage");
////		System.out.println(targetPage);
//		if (targetPage != null) {
//			session.removeAttribute("targetPage"); // clear after use
//			response.sendRedirect(request.getContextPath() + targetPage);
//		} else {
//			response.sendRedirect(request.getContextPath()+ "/Home");
//		}
		
//		response.sendRedirect(request.getContextPath() + "/");

	
	
	}

}
