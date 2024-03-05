<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!Doctype html>
<html lang="en">
<head>
    <title>LearnIt-Guide</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="static/css/login_signup.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@10..48,700&family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Borel&family=Bricolage+Grotesque:opsz,wght@10..48,700&family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap" rel="stylesheet">
    <script src="static/javascript/login_signup.js" type="text/javascript"></script>
</head>
<body>
    <div class="container">
    
    <div class="header">
        <span class="material-symbols-outlined">local_library</span>
        <h1>LearnIt-Guide </h1>
        <h4>Learning is fun!</h4>
    </div>
    
    
    <div class="login_signup">
        <form method="post" id="login">
            <h1> Login </h1>
            <input type="text" name="username" placeholder="Enter your username" required/>
            <input type="password" name="password" placeholder="Enter your password" required/>
            <button class = "submitButton" form="login" type="submit">Login</button>
            <h4>Don't have an account?<button type ="button" class="swap-login" onclick="login()">Signup</button></h4>
        </form>
       
        <form method="post" id="signup">
            <h1>Signup</h1>
            
                <input type="text" id="username" name="username" placeholder="Create a username" required />
               
                <input type="email" id="email" name="email" placeholder="Enter your emailid" required />
              
                <input type="password" id="pass1" name="pass1" placeholder="Create your password" required />
               
                <input type="password" id="pass2" name="pass2" placeholder="Confirm Password" required />
               
                <button class = "submitButton"  type="submit">Sign Up</button>
                <h4>Already have an account? <button type ="button" class="swap-login" onclick="signup()">Login</button></h4>
            
        </form>
        
        
    </div>
        
        
                
    <footer>
        
        
        <div class="footerNav">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="">News</a></li>
                <li><a href="">About</a></li>
                <li><a href="">Contact Us</a></li>                
            </ul>
        </div>
        
        
        <div class="footerBottom">
        <h4>&copy; Learnit-Guide.edu 2023</h4>
        </div>
    </footer>
        
            
    </div>

    <script>
        
        var x = document.getElementById("login");
		var y = document.getElementById("signup");

		function login(){
   		x.style.left= "-500px";
	    y.style.left = "100px";
		}
		
		function signup(){
		    x.style.left = "100px";
		    y.style.left = "-500px";
		}
        
        
        
    </script>
    
</body>
</html>