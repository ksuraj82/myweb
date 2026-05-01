package com.learnitguide.controller;

import java.io.IOException;
//import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.servlet.RequestDispatcher;
//import com.learnitguide.service.UserAuthentication;
//import com.learnitguide.util.JwtUtil;
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
		
        
        String section = request.getAttribute("webpage").toString().split("/")[1];
        String page = request.getAttribute("webpage").toString().split("/")[2];

        System.out.println("value of linux is : " + section + " page is " + page);

        String initialPagePath = "/WEB-INF/views/linux/"+section+"_content_"+page+".html";
        request.setAttribute("contentPage", initialPagePath);
        request.getRequestDispatcher("/WEB-INF/views/linux.jsp").forward(request, response);

		
	}

}
