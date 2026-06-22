package com.learnitguide.filter;

import javax.servlet.Filter;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.annotation.WebFilter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.Cookie;
import com.learnitguide.util.JwtUtil;
import java.util.Calendar;

@WebFilter("/*")
public class JwtFilter implements Filter {
	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)  throws IOException, ServletException {
		 
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		// 1. Correct way to open the InputStream
		InputStream is = getClass().getClassLoader().getResourceAsStream("application.properties");

		if (is != null) {
		    // 2. Wrap InputStream -> InputStreamReader -> BufferedReader (Using standard UTF-8 encoding)
		    try (BufferedReader buffline = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
		        
		        String line;
		        
		        // 3. Correct loop syntax for readLine() (It does not take arguments inside the brackets)
		        while ((line = buffline.readLine()) != null) {
		            
		            // 4. Clean up whitespace and skip empty lines
		            line = line.trim();
		            
		            // 5. Ensure the line contains your key and an '=' symbol before splitting
		            if (line.contains("com.learnit.guide.isundermaintenance=")) {
		                
		                // Split into 2 parts around the '=' sign
		                String[] parts = line.split("=", 2);
		                String value = parts[1].trim(); // Gets the right-hand side value
		                
		                // 6. Use .equals() for string comparison instead of '=' assignment
		                if ("true".equals(value)) {
		                    // 7. Standard Servlets use sendRedirect on the response object
		                	if (req.getServletPath().endsWith("/maintenance.html")) {
		                        chain.doFilter(request, response);
		                        return;
		                    }
		                    
		                    // Otherwise, redirect them away from index.jsp to the maintenance page
		                    res.sendRedirect(req.getContextPath() + "/maintenance.html");
		                    return; 
		                }
		            }
		        }
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		} else {
		    System.out.println("Error: application.properties file not found on the classpath!");
		}
		
		
		String year = Calendar.getInstance().get(Calendar.YEAR)+"";
		request.setAttribute("Year", year);
		
		String path = req.getServletPath();
//		System.out.println("jwtfilter file: getServletPath" + path);
		if (path == null || path.isEmpty()) {
		    path = "/";
		}
		
//		System.out.println("value of path is " + path.split("/")[1]);
//		
//		if (path.split("/")[1].equals("Linux") ) {
//			
//			request.setAttribute("path", path);
//		}
		
		// 1. ALLOW PUBLIC ACCESS: Don't check for token for these paths
        boolean isStaticAsset = path.startsWith("/static") || path.startsWith("/img");
        boolean isLoginPage = path.equals("/Login") || path.equals("/Signup");
        boolean isRoot = path.equals("/") || path.equals("/index.jsp");

        if (isStaticAsset || isLoginPage || isRoot) {
            chain.doFilter(request, response); // Green Light!
            return;
        }
        
        //For token request filter
        
        String token = null;
        Cookie[] cookies = req.getCookies();
        
        if(cookies != null) {
        	for (Cookie cookie : cookies) {
        		if ("authToken".equals(cookie.getName())) {
        			token = cookie.getValue();
        			break;
        		}
        	}
        }
        
        
        
        boolean isValid = false;

        try {
            if (token != null) {
                isValid = JwtUtil.validateToken(token);
            }
        } catch (Exception e) {
            // If JWT parsing fails (expired, malformed), we keep isValid as false
            isValid = false;
        }

        if (isValid) {
        	
        	//To get the username from token and pass it to JSP page request.
            String username = JwtUtil.getUsernameFromToken(token);
            
//            System.out.println("inside the is valid jwtfilter, servletPath" + req.getServletPath() + " path info " + req.getPathInfo());
            
            request.setAttribute("webpage", req.getPathInfo());
            
            // Pass it to the request so JSP can see it
            request.setAttribute("username", username);
            
            // VALID: This line must be outside your custom try-catch or properly declared
            chain.doFilter(request, response); 
        } else {
            // INVALID: Send to login
            res.sendRedirect(req.getContextPath() + "/Login");
        }
        
    }
	
	@Override
    public void destroy() {
        // Cleanup code if needed
    }

}
