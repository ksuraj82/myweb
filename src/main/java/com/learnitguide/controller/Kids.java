package com.learnitguide.controller;

import java.io.IOException;
//import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.List;

// Jackson Imports
import com.fasterxml.jackson.databind.ObjectMapper; //this is used to bind the text data with the model variable (title,icon,page)
import com.fasterxml.jackson.core.type.TypeReference; // this is used to identify the type of the object (what type of data will be there ) to put in the list 
import com.learnitguide.model.MenuItem; // this is our model class for menuitem 



/**
 * Servlet implementation class Login
 */

@WebServlet("/kids")
public class Kids extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		/*This is to create the json file for menuItem to show under the linux page*/
		InputStream is = getClass().getClassLoader().getResourceAsStream("/kids/kids_menu.json");
		System.out.println("the inputstream contains"+ is.toString());
		if(is != null) {
			ObjectMapper mapper = new ObjectMapper();
			
			List<MenuItem> sideBarMenu = mapper.readValue(is, new TypeReference<List<MenuItem>>(){});
			
			System.out.println("this is sidebarmenu details"+ sideBarMenu);
			
			request.setAttribute("sideBarMenu", sideBarMenu);
			
		}
		
		
		try {
			
			String webpage = (request.getAttribute("webpage") != null) ? request.getAttribute("webpage").toString(): request.getServletPath();
			System.out.println("this is webpage value on the Kids controller: " + webpage);
			String[] urlpart = webpage.split("/");
			
			if(urlpart.length == 3) {
				String section = webpage.split("/")[1];
		        String page = webpage.split("/")[2];
			
		        System.out.println("Page path created for SQL is : " + section + " page is " + page);

		        String initialPagePath = "/WEB-INF/views/kids/"+section+"_content_"+page+".html";
		        request.setAttribute("contentPage", initialPagePath);
			}    
				
			
		}catch(Exception e) {
			String initialPagePath = "/WEB-INF/views/kids/kidsbasic_content_intro.html";
			request.setAttribute("contentPage", initialPagePath);
	        
		}
		
		
        request.getRequestDispatcher("/WEB-INF/views/kids.jsp").forward(request, response);

		
	}

}
