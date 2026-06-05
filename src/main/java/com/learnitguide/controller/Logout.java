package com.learnitguide.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.Cookie;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession session = request.getSession(false);
//		
//		if(session != null) {
//			session.invalidate();
//			response.sendRedirect(request.getContextPath() + "/");
//		}
		
		
//		JWT token implementation:
		
		
		Cookie terminateCookie = new Cookie("authToken", ""); 
        terminateCookie.setPath("/");
        terminateCookie.setMaxAge(0); // This tells the browser: "Delete this NOW"
        terminateCookie.setHttpOnly(true);

        // 2. Add it to response
        response.addCookie(terminateCookie);

        // 3. Send them to login
        response.sendRedirect(request.getContextPath() + "/Login");
		
		
		
		
	}

}
