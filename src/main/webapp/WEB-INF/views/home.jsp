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
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/home.css'/>">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <%-- Changed: Added 'Orbitron' for the site title (cool techy font), kept Noto Sans Mono for body --%>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@700;900&family=Noto+Sans+Mono:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class="container">

    <%-- ===== HEADER ===== --%>
    <header>
        <nav>
            <div class="navStart">
                <a href="<c:url value='/Home'/>"><img class='site-title' src="<c:url value='/img/header.gif'/>"></a>
            </div>

            <div class="navEnd">
                <a href="software.html">Software</a>
                <c:choose>
                    <c:when test="${not empty username}">
                        <a id="button" href="<c:url value='/logout'/>">Logout (${username})</a>
                    </c:when>
                    <c:otherwise>
                        <a id="button" href="<c:url value='/login'/>">Log in</a>
                    </c:otherwise>
                </c:choose>
            </div>

            <%-- Added: hamburger button for mobile nav toggle --%>
            <button class="nav-toggle" id="navToggle" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
        </nav>
    </header>

    <%-- Changed: removed <marquee> (deprecated HTML tag). Using a plain div instead --%>
    <div class="warning">
        <p>&#9888; Your learning page is still upgrading to give you a better learning experience.</p>
    </div>

    <%-- Changed: renamed class from no class to "body-grid" — 3-column layout wrapper --%>
    <div class="body-grid">

        <%-- ===== COLUMN 1: SIDEBAR MENU ===== --%>
        <aside class="menu" id="sideMenu">
            <h5>Learning Sections</h5>
            <ul class="menu-list1">
                <c:forEach var="item" items="${sideBarMenu}">
                <li><a href="<c:url value='${item.page}'/>"><i class="${item.icon}"></i> ${item.title}</a></li>
				</c:forEach>
            </ul>
        </aside>

        <%-- ===== COLUMN 2: MAIN CONTENT ===== --%>
        <main class="main-content">
                <jsp:include page="${contentPage}"/>
        </main>

        <%-- ===== COLUMN 3: ADS ===== --%>
        <%-- Changed: renamed class from "adds" to "ads" (typo fix) --%>
        <aside class="ads">
            <h5>Advertisement</h5>
            <div class="ad-placeholder">
                <p>AdSense<br/>300 &times; 250</p>
            </div>
            <div class="ad-placeholder" style="margin-top: 1.5rem;">
                <p>AdSense<br/>300 &times; 250</p>
            </div>
        </aside>

    </div><%-- end body-grid --%>

    <%-- ===== FOOTER ===== --%>
    <footer>
        <div class="footerNav">
            <ul>
                <li><a href="<c:url value='/Home'/>">Home</a></li>
                <li><a href="<c:url value='/kids/kidsbasic/intro'/>">Kids Section</a></li>
                <li><a href="<c:url value='/Home/author/aboutme'/>">About Us</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>

        <div class="social-icon">
            <a href="https://www.facebook.com"  aria-label="Facebook"><i class="fa-brands fa-facebook"></i></a>
            <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
            <a href="#" aria-label="Twitter/X"><i class="fa-brands fa-twitter"></i></a>
            <a href="#" aria-label="Reddit"><i class="fa-brands fa-reddit"></i></a>
            <a href="https://www.google.com"   aria-label="Google"><i class="fa-brands fa-google"></i></a>
        </div>

        <div class="footerBottom">
            <jsp:useBean id="now" class="java.util.Date" />
            <%-- Changed: updated domain to learnit-guide.xyz as per spec --%>
            <h4>&copy; learnit-guide.xyz <fmt:formatDate value="${now}" pattern="yyyy"/></h4>
        </div>
    </footer>

</div><%-- end container --%>

<%-- Added: tiny script for mobile hamburger toggle --%>
<script>
    document.getElementById('navToggle').addEventListener('click', function () {
        document.getElementById('sideMenu').classList.toggle('open');
    });
</script>

</body>
</html>
