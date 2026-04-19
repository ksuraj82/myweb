package com.learnitguide.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/Home");
		}
		
	}

}
