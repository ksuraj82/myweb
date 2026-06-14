package com.learnitguide.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.learnitguide.model.MenuItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;

@WebServlet("/home")
public class Home extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		
		/*This is to create the json file for menuItem to show under the linux page*/
		InputStream is = getClass().getClassLoader().getResourceAsStream("/userhome/userhome_menu.json");
		System.out.println("the inputstream contains"+ is.toString());
		if(is != null) {
			ObjectMapper mapper = new ObjectMapper();
			
			List<MenuItem> sideBarMenu = mapper.readValue(is, new TypeReference<List<MenuItem>>(){});
			
			System.out.println("this is sidebarmenu details"+ sideBarMenu);
			
			request.setAttribute("sideBarMenu", sideBarMenu);
			
		}
		
		
		try {
		if(request.getPathInfo() == null || request.getAttribute("webpage").toString() == null) {
		request.setAttribute("contentPage", "/WEB-INF/views/home/user_content_home.html");
		 RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/home.jsp");
	        rd.forward(request, response);
	        return;
		}
		
		String section = request.getAttribute("webpage").toString().split("/")[1];
        String page = request.getAttribute("webpage").toString().split("/")[2];

        System.out.println("value of linux is : " + section + " page is " + page);

        String initialPagePath = "/WEB-INF/views/home/"+section+"_content_"+page+".html";
        request.setAttribute("contentPage", initialPagePath);
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
		}
		catch(Exception e ) {
			System.out.println(e);
		}
	}

}
