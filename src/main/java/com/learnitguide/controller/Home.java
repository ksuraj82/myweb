package com.learnitguide.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;

@WebServlet("/home")
public class Home extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession session = request.getSession(false);
//		
//		if(session != null && session.getAttribute("username") != null) {
//			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
//			rd.forward(request, response);
////			response.sendRedirect(request.getContextPath()+"/Home");
//			return;
//		}
//		else {
//			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//			rd.forward(request, response);
////			response.sendRedirect(request.getContextPath()+"/");
//		}
		
		request.setAttribute("contentPage", "/WEB-INF/views/home/free_content_home.html");
		 RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
	        rd.forward(request, response);
		
	}

}
