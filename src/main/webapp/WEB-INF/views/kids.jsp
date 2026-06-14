<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>LearnIt-Guide</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/kids.css'/>">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&family=Zen+Dots&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap" rel="stylesheet">
    <!--  The below stylesheet gives the icon to the footer social media icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class= "container">


<!-- ############################################This is Header of the page ################################# -->
    <%-- ===== HEADER ===== --%>
		<header>
			<nav>
				<div class="navStart">
					<a href="<c:url value='/Home'/>"><img class='site-title' src="<c:url value='/img/header.gif'/>"></a>
				</div>

				<div class="navEnd">
					<a href="software.html">Software</a>
					<c:choose>
						<%-- Removed sessionScope. so it looks in the Request attribute set by the Filter --%>
						<c:when test="${not empty username}">
							<a id="login-button" href="<c:url value='/logout'/>">Logout (${username})</a>
						</c:when>
						<c:otherwise>
							<a id="login-button" href="<c:url value='/login'/>">Log in</a>
						</c:otherwise>
					</c:choose>
				</div>
			</nav>
		</header>

		<div class="warning">
    	<marquee><h5>warning messages will be displayed here. this is linux.jsp page.</h5> </marquee>
    </div>
    
    
    




<!-- ############################################This is out main content of the page: with menu, body and advertisement ################################# -->
	
	    <%-- Changed: renamed class from no class to "body-grid" â 3-column layout wrapper --%>
    <div class="body-grid">
    
    <%-- ===== COLUMN 1: SIDEBAR MENU ===== --%>
    <div class="menu">
        <h5>Kids basic</h5><hr>
			<div class="menu-list">
				<%-- <ul>
					<li><a href="<c:url value='/Linux/linuxbasic/1'/>"><i class="fa-solid fa-box"></i> VirtualBox setup</a></li>
				</ul> --%>
				<c:forEach var="item" items="${sideBarMenu}">
					<ul>
					<li><i class='${item.icon}'></i><a class="menu-list-title" href="<c:url value='${item.page}'/>">${item.title}</a></li>
				</ul>
				</c:forEach>
				
			</div>


		</div>

    <%-- ===== COLUMN 2: MAIN CONTENT ===== --%>
    <main>

		<jsp:include page="${contentPage}"/>	
		    <div class="page-nav">
    <button class="page-prev"> < Previous Page</button>
    <button class="page-next">Next page></button>
    <audio id="ttsAudioPlayer" style="display:none;"></audio>
    </div>
	</main>

	
    
    <!--to place adds in the website for monitization -->
    <div class="adds">Advertisement</div>
    

        
       </div><%-- end body-grid --%>         
       
       
       
       
<!-- ############################################This is out Footer for the page################################# -->
            
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
        <h4>&copy; Learnit-Guide.xyz ${Year}</h4>
        </div>
    </footer>
            
            
            
            
        

</div>
    
</body>
</html>