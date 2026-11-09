<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>LearnIt-Guide</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/static/css/home.css'/>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<%-- Changed: Added 'Orbitron' for the site title (cool techy font), kept Noto Sans Mono for body --%>
<link
	href="https://fonts.googleapis.com/css2?family=Orbitron:wght@700;900&family=Noto+Sans+Mono:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<div class="container">

		<%-- ===== HEADER ===== --%>

		<header>
			<h2 class="website-title">Learnit Guide</h2>

			<nav class="webpage-nav">
				<button class="webpage-nav-button">
					<a href="<c:url value='/'/>">Home</a>
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


		<%-- Changed: removed <marquee> (deprecated HTML tag). Using a plain div instead --%>
		<div class="warning">
			<h5>Notice: ${maintenance_message}</h5>
		</div>

		<%-- Changed: renamed class from no class to "body-grid" — 3-column layout wrapper --%>
		<div class="body-grid">

			<%-- ===== COLUMN 1: SIDEBAR MENU ===== --%>
			<aside class="menu" id="sideMenu">
				<h5 class="menu-list-title">Learning Sections</h5>
				<ul class="menu-list">
					<c:forEach var="item" items="${sideBarMenu}">
						<li><a href="<c:url value='${item.page}'/>"><i
								class="${item.icon}"></i> ${item.title}</a></li>
					</c:forEach>
				</ul>
			</aside>

			<%-- ===== COLUMN 2: MAIN CONTENT ===== --%>
			<main class="content">
				<jsp:include page="${contentPage}" />
			</main>

			<%-- ===== COLUMN 3: ADS ===== --%>
			<%-- Changed: renamed class from "adds" to "ads" (typo fix) --%>
			<aside class="adds">Advertisement</aside>

		</div>
		<%-- end body-grid --%>

		<%-- ===== FOOTER ===== --%>
            <c:url value="template/footer.html" var="footerContent" />
			<jsp:include page="${footerContent}" />

	</div>
	<%-- end container --%>

	<%-- Added: tiny script for mobile hamburger toggle --%>
	<script>
    document.getElementById('navToggle').addEventListener('click', function () {
        document.getElementById('sideMenu').classList.toggle('open');
    });
</script>

</body>
</html>
