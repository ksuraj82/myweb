<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>LearnIt-Guide</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="static/css/index.css">
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
            <a href="index.jsp"><img src="img/home_icon_google.png" alt="no image"/></a>
            <h1>LearnIt-Guide</h1>
            </div>
            
            <div class="navEnd">
            <a href="software.html">Software</a>
            <a href="#">Tools</a>
            <a id="button" href="login_signup.jsp" >Log in</a>
            </div>
        </nav>
    </header>
    
    <div class="warning"><marquee><h5>warning messages will be displayed here</h5> </marquee></div>
	
    
    <div class="menu">
        <h5>Menu</h5>
    
        <div class="menu-list1">     
            <ul>
            <li>Article</li>
            <li>Blog</li>
            <li>Contact us</li>
            <li><a href="pages/AboutJava.html">About Java</a></li>
            <li>Java core and advance</li>
            <li>Java books</li>
            <li>Learning path</li>
            <li>Sample web architecture</li>
            <li>Jobs available</li>
            <li>Kids Section</li>
            </ul>
            </div>
    
    
    </div>
	
    <div class="content">
        <section class="welcome_note">
            <h1>Hi All,</h1><br>
            <p>**Welcome to LearnIt-Guide!** <br><br>
            Dear visitors,<br><br>
            <p>We are delighted to extend a warm welcome to each and every one of you at LearnIt Guide - your ultimate destination for knowledge and skill enhancement. Whether you are a lifelong learner or a curious enthusiast seeking to expand your horizons, we have designed this platform with you in mind.

            At LearnIt Guide, we believe in the power of education to transform lives. Our mission is to provide a dynamic and immersive learning experience that empowers you to excel in various fields and achieve your goals. Through our meticulously crafted courses, insightful articles, and engaging resources, we aspire to ignite the spark of curiosity within you and fuel your passion for learning.

            Our team of dedicated experts and enthusiasts curates content across a diverse range of topics, ensuring you have access to the latest and most valuable information. Whether you're interested in technology, arts, science, language, or personal development, you'll find something inspiring here to feed your intellectual appetite.

            The journey of learning is meant to be collaborative and fulfilling. That's why we foster a vibrant community of learners who can connect, share ideas, and support one another. Ask questions, seek guidance, and engage in discussions to gain deeper insights and perspectives on your learning journey.

            We believe that learning should be accessible to all. Hence, LearnIt Guide is designed to be user-friendly and accessible across various devices, allowing you to learn at your own pace, anytime, and anywhere.

            As you embark on this enlightening voyage with us, we encourage you to embrace the challenges, celebrate the triumphs, and stay committed to your personal growth. Remember, knowledge is the key that opens doors to endless possibilities, and with LearnIt Guide, those doors are waiting to be unlocked by you.</p><br>

            Thank you for joining us on this exciting adventure. We are confident that your time spent here will be rewarding, enriching, and, above all, fun!

            Happy learning!<br><br>

        </section>
        
         
    </div>
	
    
    <!--to place adds in the website for monitization -->
    <div class="adds">Advertisement</div>
        
            
            
    <footer>
        
        
        <div class="footerNav">
            <ul>
                <li><a href="index.jsp">Home</a></li>
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
        <h4>&copy; Learnit-Guide.edu 2024 is a free source.</h4>
        </div>
    </footer>
            
            
            
            
        

</div>
    
</body>
</html>