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
			<h2 class="website-title">Learnit Guide</h2>

			<nav class="webpage-nav">
				<button class="webpage-nav-button">
					<a href="<c:url value='/Home'/>">Home</a>
				</button>
				<button class="webpage-nav-button">
					<a href="<c:url value='/Login'/>"><c:choose>
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
    
    
    




<!-- ############################################This is out main content of the page: with menu, body and advertisement ################################# -->
	
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
    <button class="page-prev"> &lt; Previous Page</button>
    <button class="page-next">Next page &gt;</button>
    <audio id="ttsAudioPlayer" style="display:none;"></audio>
    </div>
	</main>

	
    
    <!--to place adds in the website for monitization -->
    <div class="adds">Advertisement</div>
    

        
       </div><%-- end body-grid --%>         
       
       
       
       
<!-- ############################################This is out Footer for the page################################# -->
            
            <c:url value="template/footer.html" var="footerContent" />
			<jsp:include page="${footerContent}" />
            
            
            
            
        

</div>
    
</body>
</html>