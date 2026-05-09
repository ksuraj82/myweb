<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>LearnIt-Guide</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="static/css/home.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class= "container">
    <header>
        <nav>
            <div class="navStart">
            <a href="<c:url value='/Home'/>"><img src="<c:url value='/img/home_icon_google.png'/>" alt="no image"/></a>
            <h1>LearnIt-Guide</h1>
            </div>
            
            <div class="navEnd">
            <a href="software.html">Software</a>
            <a href="#">Tools</a>
           <c:choose>
    <%-- Removed sessionScope. so it looks in the Request attribute set by the Filter --%>
    <c:when test="${not empty username}">
        <a id="button" href="<c:url value='/logout'/>">Logout (${username})</a>
    </c:when>
    <c:otherwise>
        <a id="button" href="<c:url value='/login'/>">Log in</a>
    </c:otherwise>
</c:choose>
            </div>
        </nav>
    </header>
    
    <div class="warning"><marquee><h5>warning messages will be displayed here. this is home.jsp page</h5> </marquee></div>
	
    
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
            <li><a href="<c:url value='/Linux/linuxbasic/intro'/>">Linux Section</a></li>
            <li>SQL Section</li>
            </ul>
            </div>
    
    
    </div>
	
	<main>
	<section class="welcome_note">
		<p>Welcome to LearnIt-Guide! ${username} <p>
		<jsp:include page="${contentPage}"/>
		</section>	
	</main>
	
    
    <!--to place adds in the website for monitization -->
    <div class="adds">Advertisement</div>
        
            
            
    <footer>
        
        
        <div class="footerNav">
            <ul>
                <li><a href="<c:url value='/Home'/>">Home</a></li>
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
        <jsp:useBean id="now" class="java.util.Date" />
        <h4>&copy;Learnit-Guide.edu <fmt:formatDate value="${now}" pattern="yyyy"/></h4>
        </div>
    </footer>
            
            
            
            
        

</div>
    
</body>
</html>