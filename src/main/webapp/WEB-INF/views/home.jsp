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
                <a href="<c:url value='/Home'/>">
                    <img src="<c:url value='/img/home_icon_google.png'/>" alt="Home" class="nav-icon"/>
                </a>
                <%-- Changed: wrapped site name in a span for font styling --%>
                <h1><span class="site-title">LearnIt-Guide</span></h1>
            </div>

            <div class="navEnd">
                <a href="software.html">Software</a>
                <a href="#">Tools</a>
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
        <p>&#9888; Warning messages will be displayed here. This is home.jsp</p>
    </div>

    <%-- Changed: renamed class from no class to "body-grid" — 3-column layout wrapper --%>
    <div class="body-grid">

        <%-- ===== COLUMN 1: SIDEBAR MENU ===== --%>
        <aside class="menu" id="sideMenu">
            <h5>Learning Sections</h5>
            <ul class="menu-list1">
                <li><a href="<c:url value='/Linux/linuxbasic/intro'/>"><i class="fa-brands fa-linux"></i> Linux</a></li>
                <li><a href="#"><i class="fa-solid fa-database"></i> SQL</a></li>
                <li><a href="#"><i class="fa-brands fa-github"></i> GitHub</a></li>
                <li><a href="#"><i class="fa-solid fa-ticket"></i> Jira Tool</a></li>
                <li><a href="#"><i class="fa-solid fa-file-code"></i> Notepad++</a></li>
                <li><a href="#"><i class="fa-brands fa-java"></i> Java</a></li>
                <li><a href="#"><i class="fa-solid fa-server"></i> VMware</a></li>
                <li><a href="#"><i class="fa-solid fa-globe"></i> Website Creation</a></li>
            </ul>
        </aside>

        <%-- ===== COLUMN 2: MAIN CONTENT ===== --%>
        <main class="main-content">
            <section class="welcome_note">
                <p>Welcome to LearnIt-Guide! <strong>${username}</strong></p>
                <jsp:include page="${contentPage}"/>
            </section>

            <%-- Static welcome content block - replace or extend with dynamic content --%>
            <section class="intro-block">
                <h2>Why LearnIt-Guide?</h2>
                <p>
                    The tech industry moves fast. Whether you're just starting out or switching careers,
                    knowing <em>which</em> tools to learn — and in what order — is half the battle.
                    This site distills 6+ years of real corporate experience into beginner-friendly guides
                    so you don't have to figure it out alone.
                </p>
                <p>
                    Bookmark this page. Come back as you grow. Every section is written with one goal:
                    to give you the foundational understanding that employers actually expect on day one.
                </p>

                <div class="skill-cards">
                    <div class="card"><i class="fa-brands fa-linux"></i><span>Linux</span></div>
                    <div class="card"><i class="fa-solid fa-database"></i><span>SQL</span></div>
                    <div class="card"><i class="fa-brands fa-github"></i><span>GitHub</span></div>
                    <div class="card"><i class="fa-solid fa-ticket"></i><span>Jira</span></div>
                    <div class="card"><i class="fa-brands fa-java"></i><span>Java</span></div>
                    <div class="card"><i class="fa-solid fa-server"></i><span>VMware</span></div>
                    <div class="card"><i class="fa-solid fa-globe"></i><span>Web Dev</span></div>
                    <div class="card"><i class="fa-solid fa-file-code"></i><span>Notepad++</span></div>
                </div>
            </section>
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
                <li><a href="#">Technology News</a></li>
                <li><a href="#">Kids Section</a></li>
                <li><a href="#">About / whoami</a></li>
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
