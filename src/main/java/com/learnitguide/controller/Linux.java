package com.learnitguide.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import com.learnitguide.service.UserAuthentication;
/**
 * Servlet implementation class Login
 */

@WebServlet("/linux")
public class Linux extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		HttpSession session = request.getSession(false);
        String uname = (session != null) ? (String) session.getAttribute("username") : null;

        if (uname == null) {
            // Save original target so login can redirect back
            request.getSession().setAttribute("targetPage", "/Linux");
//            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login_signup.jsp");
//            rd.forward(request, response);
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }
        
        
        // User is logged in → show kids page
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/linux.jsp");
        rd.forward(request, response);
		
	}

}
