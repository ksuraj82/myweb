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

import java.util.Calendar;

/**
 * Servlet implementation class Login
 */

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login_signup.jsp");
        rd.forward(request, response);
    }

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

		// set the year attribute in the footer section
		int year = Calendar.getInstance().get(Calendar.YEAR);
		request.setAttribute("Year", year);

		UserAuthentication authentication = new UserAuthentication();

		if (!authentication.getvalidateUser(uname, password)) {
			request.setAttribute("errorMessage", "Authentication failed!<br> Please try again.");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login_signup.jsp");
			rd.forward(request, response);
			return;
		}

		HttpSession session = request.getSession();
		session.setAttribute("username", uname);

		String targetPage = (String) session.getAttribute("targetPage");
		System.out.println(targetPage);
		if (targetPage != null) {
			session.removeAttribute("targetPage"); // clear after use
			response.sendRedirect(request.getContextPath() + targetPage);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
			rd.forward(request, response);
		}

	}

}
