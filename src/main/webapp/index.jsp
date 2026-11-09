 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>LearnIt-Guide</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="<c:url value='/static/css/master.css'/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap"
	rel="stylesheet">
<!--  The below stylesheet gives the icon to the footer social media icon -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<script src="/static/javascript/weatherinformation.js" type="text/javascript"></script>

</head>
<body>

	<div class="container">
		<header>
			<h2 class="website-title">Learnit Guide</h2>
			
			<nav class="webpage-nav">
				<button class="webpage-nav-button"><a href="<c:url value='/'/>">Home</a></button>
				<button class="webpage-nav-button"><a href="<c:url value='login_signup.jsp'/>"><c:choose>
							<c:when test="${not empty username}">
								<a id="button" href="<c:url value='/logout'/>">Logout
									(${username})</a>
							</c:when>
							<c:otherwise>
								<a id="button" href="<c:url value='/login'/>">Login</a>
							</c:otherwise>
						</c:choose></a></button>
				<a class="nav-ai-buddy" href="about.html">AI Study Buddy</a>
			</nav>
		</header>
		
		

		<div class="warning">
			<marquee>
				<h5>Notice: ${maintenance_message}</h5>
			</marquee>
		</div>

		<%-- Changed: renamed class from no class to "body-grid" 3-column layout wrapper --%>
		<div class="body-grid">
			<aside class="menu">
				<h5 class="menu-list-title">Menu</h5>
				<hr>
				<div class="menu-list">
					<ul>
						<c:forEach var="item" items="${sideBarMenu}">
						<li><a href="<c:url value='${item.page}'/>"><i
								class="${item.icon}"></i> ${item.title}</a></li>
					</c:forEach>
					</ul>
				</div>
			</aside>
			<%-- ===== COLUMN 2: MAIN CONTENT ===== --%>
			<main>
				<div class="content">
					<h2 class="article-section-header">Featured Article</h2>
					<section class="article-section">
						<%-- Static article loaded from file — replaced in Step 1 --%>
						<c:url value="/WEB-INF/views/public/article_1.html" var="articleUrl" />
						<jsp:include page="${articleUrl}" />
					</section>
					
<%-- 					<c:forEach var="article" items="${sideBarMenu}">
					<li><i class='${item.icon}'></i><a class="menu-list-title" href="<c:url value='${item.page}'/>">${item.title}</a></li>
				</c:forEach> --%>

				</div>
				<div class="page-nav">
					<button class="page-prev">&lt; Previous Page</button>
					<button class="page-next">Next page &gt;</button>
				</div>

			</main>

			<!--to place adds in the website for monitization -->
			<aside class="adds">Advertisement</aside>

		</div>
		
		
		
<!-- This is footer section -->

            <c:url value="/WEB-INF/views/template/footer.html" var="footerContent" />
				<jsp:include page="${footerContent}" />






	</div>

</body>
</html>