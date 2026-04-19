<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>LearnIt-Guide</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/linux.css'/>">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap" rel="stylesheet">
    <!--  The below stylesheet gives the icon to the footer social media icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class= "container">
    <header>
        <nav>
            <div class="navStart">
            <a href="<c:url value='/'/>"><img src="img/home_icon_google.png" alt="no image"/></a>
            <h1>LearnIt-Guide</h1>
            </div>
            
            <div class="navEnd">
            <a href="software.html">Software</a>
            <a href="#">Tools</a>
            <c:choose>
						<c:when test="${not empty sessionScope.username}">
							<a id="button" href="<c:url value='/Logout'/>">Logout (${sessionScope.username})</a>
						</c:when>
						<c:otherwise>
							<a id="button" href="<c:url value='/Login'/>">Log in</a>
						</c:otherwise>
					</c:choose>
            </div>
        </nav>
    </header>
    
    <div class="warning"><marquee><h5>warning messages will be displayed here</h5> </marquee></div>
	
    
    <div class="menu">
        <h5>Menu</h5>

			<div class="menu-list1">
				<ul>
					<li>Article</li>
					<li><a href="https://learnjava82.blogspot.com/">Java Blog</a></li>
					<li><a href="pages/AboutJava.html">About Java</a></li>
					<li>Java books</li>
					<li>Learning path</li>
					<li>Sample web architecture</li>
					<li>Jobs available</li>
					<li>Kids Section</li>
					<li>Linux Section</li>
					<li>SQL Section</li>
				</ul>
			</div>


		</div>

    <main>
		<jsp:include page="${contentPage}"/>	
	</main>

	
    
    <!--to place adds in the website for monitization -->
    <div class="adds">Advertisement</div>
        
            
            
    <footer>
        
        
        <div class="footerNav">
            <ul>
                <li><a href="<c:url value='/'/>">Home</a></li>
                <li><a href="">News</a></li>
                <li><a href="">About</a></li>
                <li><a href="">Contact Us</a></li>                
            </ul>
        </div>
        
        <div class="social-icon">
            <a href="https://www.facebook.com"> <i class="fa-brands fa-facebook"></i></a>
            <a href=""> <i class="fa-brands fa-instagram"></i></a>
            <a href=""> <i class="fa-brands fa-twitter"></i></a>
            <a href=""> <i class="fa-brands fa-reddit"></i></a>
            <a href="https://www.google.com"> <i class="fa-brands fa-google"></i></a>
            
        </div>
        
        <div class="footerBottom">
        <h4>&copy;Learnit-Guide.edu {Year}</h4>
        </div>
    </footer>
            
            
            
            
        

</div>
    
</body>
</html>