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
			<nav>
				<div class="navStart">
					<a href="<c:url value='/Home'/>">
					<img class='site-title' src="<c:url value='/img/header.gif'/>"></a>
				</div>

				<div class="navEnd">
					<a href="software.html">Software</a>
					<a id="login-button" href="<c:url value='/Login'/>">Login</a>
				</div>
			</nav>
		</header>

		<div class="warning">
			<marquee>
				<h5>Notice: ${maintenance_message}</h5>
			</marquee>
		</div>

		<%-- Changed: renamed class from no class to "body-grid" â 3-column layout wrapper --%>
		<div class="body-grid">
			<div class="menu">
				<h5>Menu</h5>
				<hr>

				<div class="menu-list1">
					<ul>
						<li>New Technology news</li>
						<li><a href="<c:url value='/Linux/linuxbasic/intro'/>">Linux
								Basic</a></li>
						<li><a href="<c:url value='/sql/sqlbasic/intro'/>">SQL
								Basic</a></li>
						<li><a href="pages/AboutJava.html">Java Basic</a></li>
						<li><a href="https://learnjava82.blogspot.com/"
							target="_blank">Blog : Experiment area</a></li>
						<li><a href="<c:url value='/sql/sqlbasic/intro'/>">Kids
								Section</a></li>
					</ul>
				</div>
			</div>
			<%-- ===== COLUMN 2: MAIN CONTENT ===== --%>
			<main>
				<div class="content">
				
				<div class="article-section-header">
							<h2 class="article-section-title">Featured Article</h2>
						</div>
					<section class="article-section">
						

						<%-- Static article loaded from file — replaced in Step 1 --%>
						<c:url value="/WEB-INF/views/public/article_1.html" var="articleUrl" />
						<jsp:include page="${articleUrl}" />
					</section>
					
					<c:forEach var="article" items="${sideBarMenu}">
					<li><i class='${item.icon}'></i><a class="menu-list-title" href="<c:url value='${item.page}'/>">${item.title}</a></li>
				</c:forEach>

				</div>
				<div class="page-nav">
					<button class="page-prev">< Previous Page</button>
					<button class="page-next">Next page></button>
				</div>

			</main>

			<!--to place adds in the website for monitization -->
			<div class="adds">Advertisement</div>

		</div>

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
				<a href="https://www.facebook.com"> <i
					class="fa-brands fa-facebook"></i></a> <a href=""> <i
					class="fa-brands fa-instagram"></i></a> <a href=""> <i
					class="fa-brands fa-twitter"></i></a> <a href=""> <i
					class="fa-brands fa-reddit"></i></a> <a href="https://www.google.com">
					<i class="fa-brands fa-google"></i>
				</a>

			</div>

			<div class="footerBottom">
				<jsp:useBean id="now" class="java.util.Date" />
				<h4>
					&copy;learnit-guide.in
					<fmt:formatDate value="${now}" pattern="yyyy" />
				</h4>
			</div>
		</footer>






	</div>

</body>
</html>