<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>LearnIt-Guide</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/sql.css'/>">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&family=Zen+Dots&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Handjet&family=Noto+Sans+Mono:wght@500&family=Roboto:wght@900&display=swap" rel="stylesheet">
    <!--  The below stylesheet gives the icon to the footer social media icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class= "container">
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
    
    <div class="warning">
    	<h5>Notice: ${maintenance_message}</h5>
    </div>
	
	    <%-- Changed: renamed class from no class to "body-grid" â 3-column layout wrapper --%>
    <div class="body-grid">
    
    <%-- ===== COLUMN 1: SIDEBAR MENU ===== --%>
    <div class="menu">
        <h5>SQL basic</h5><hr>
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
    </div>
	</main>

	
    
    <!--to place adds in the website for monitization -->
    <div class="adds">Advertisement</div>
    

        
       </div><%-- end body-grid --%>         
            

<!-- This is the footer section -->
            
                        <c:url value="template/footer.html" var="footerContent" />
			<jsp:include page="${footerContent}" />
            
            
        

</div>
    
</body>
</html>