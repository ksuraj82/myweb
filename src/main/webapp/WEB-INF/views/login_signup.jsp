<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!Doctype html>
<html lang="en">
<head>
<title>LearnIt-Guide</title>
<meta charset="UTF-8">
<!-- This is to create the responsive website -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://cloudflare.com">
<link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@10..48,700&family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Borel&family=Bricolage+Grotesque:opsz,wght@10..48,700&family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap"
	rel="stylesheet">

<!-- This is for CSS style -->
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/login_signup.css'/>">

<!-- This is for javascript to make the transition -->
<script src="static/javascript/login_signup.js" type="text/javascript"></script>
</head>
<body>

	<div class="container">
		
		<header>
			<span class="material-symbols-outlined">local_library</span>
			<div class="website-title">
			<h1>LearnIt-Guide</h1>
			<h4>Learning is fun!</h4>
			</div>
			<div class="bulb-container">
    <div class="bulb"><i class="fa-solid fa-lightbulb" style="color: #FFD43B; font-size: 40px;"></i></div>
</div>
		</header>
		
		
<!-- This is form for both login and signup -->
		<div class="login_signup">
		
<!-- this is for login method start-->
			<form action="Login" method="post" id="login">
				<h1>Login</h1>
				<input type="text" name="username" placeholder="Enter your username"
					required /> <input type="password" name="password"
					placeholder="Enter your password" required />
				<button class="submitButton" form="login" type="submit">Login</button>
				<h4>
					Don't have an account?
					<button type="button" class="swap-login" onclick="login()">Signup</button>
				</h4>
				<h3 class="errormessage">${message}</h3>
			</form>
<!-- this is for login method start-->
			
<!-- This is for signup method -->
			<form action="Signup" method="post" id="signup">
				<h1>New User!</h1>

				<input type="text" id="username" name="username" placeholder="Create a username" required /> 
				<input type="text" id="webname" name="webname" placeholder="Create a nickname" required />
				<input type="email"	id="email" name="email" placeholder="Enter your email" required />
				<input type="password" id="password" name="password" placeholder="Create your password" required /> 
				<input type="text" id="pass2" name="pass2" placeholder="Confirm Password" required />
				<button class="submitButton" type="submit">Sign Up</button>

				<h4>
					Already have an account?
					<button type="button" class="swap-login" onclick="signup()">Login</button>
				</h4>
				<h3 class="errormessage">${message}</h3>

			</form>
		</div>             
<!-- This is login_signup end -->
		

		
<!-- This is footer start -->
		
		<footer> <!--  this grid will work for child element div and h4 -->
			<div class="footerNav">
				<ul>
					<li><a href="<c:url value='/'/>">Home</a></li>        <!--This is child of ul tag -->
					<li><a href="">News</a></li>
					<li><a href="">About</a></li>
					<li><a href="">Contact Us</a></li>
				</ul>
			</div>
				<h4>&copy; Learnit-Guide.edu ${Year}</h4>
		</footer> 
<!-- This is footer end -->


			</div>  <!--  This is container ends -->

	<script>


// function signup() {
//     document.querySelector('.login_signup').classList.remove('show-signup');
// }

// function login() {
//     document.querySelector('.login_signup').classList.add('show-signup');
// }
        

        
    </script>

</body>
</html>