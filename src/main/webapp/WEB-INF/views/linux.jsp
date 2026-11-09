<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>LearnIt-Guide</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/linux.css'/>">
    <script src="<c:url value='/static/javascript/linux.js'/>" type="text/javascript"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&family=Zen+Dots&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap" rel="stylesheet">
    <!--  The below stylesheet gives the icon to the footer social media icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

<div class= "container">
    <%-- ===== HEADER ===== --%>
		<header>
			<h2 class="website-title">Learnit Guide</h2>

			<nav class="webpage-nav">
				<button class="webpage-nav-button">
					<a href="<c:url value='/Home'/>">Home</a>
				</button>
				<button class="webpage-nav-button">
					<a href="<c:url value='login_signup.jsp'/>"><c:choose>
							<c:when test="${not empty username}">
								<a id="button" href="<c:url value='/logout'/>">Logout
									(${username})</a>
							</c:when>
							<c:otherwise>
								<a id="button" href="<c:url value='/login'/>">Login</a>
							</c:otherwise>
						</c:choose></a>
				</button>
				<a class="nav-ai-buddy" href="about.html">AI Study Buddy</a>
			</nav>
		</header>
    
    <div class="warning">
    	<h5>Notice: ${maintenance_message}</h5>
    </div>
	
	    <%-- Changed: renamed class from no class to "body-grid" â 3-column layout wrapper --%>
    <div class="body-grid">
    
    <%-- ===== COLUMN 1: SIDEBAR MENU ===== --%>
<aside class="sidebar">
    <ul style="list-style: none; padding-left: 0;">
        <c:forEach var="menu" items="${menuData}">
            <c:if test="${menu.enabled}">
                <li>
                    <%-- Top-level category title --%>
                    <a href="${menu.page}">
                        <i class="${menu.icon}"></i> ${menu.title}
                    </a>
                    
                    <%-- Render sub-topics if they exist --%>
                    <c:if test="${not empty menu.topic}">
                        <ul style="list-style: none; padding-left: 20px;">
                            <c:forEach var="topic" items="${menu.topic}">
                                <c:if test="${topic.enabled}">
                                    <li>
                                        <a href="${topic.page}">
                                            <i class="${topic.icon}"></i> ${topic.title}
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </c:if>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</aside>

    <%-- ===== COLUMN 2: MAIN CONTENT ===== --%>
    <main>

		<jsp:include page="${contentPage}"/>	
		    <div class="page-nav">
    <button id="pageprev" class="page-prev"> &lt; Previous Page</button>
    <button class="page-next">Next page &gt;</button>
    </div>
	</main>

	
    
    <!--to place adds in the website for monitization -->
    <div class="adds">Advertisement</div>
    

        
       </div><%-- end body-grid --%>         
            
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
        <h4>&copy; Learnit-guide.in 2026</h4>
        </div>
        
        
</footer>
            
</div>
       
</body>
</html>