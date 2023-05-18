<%@page import="java.util.List"%>
<%@page import="dao.MountainDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/Main.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<body>

<%@ include file="./Navi.jsp" %>
<div id="wrapper">
<div class="slideshow-container">
    <div class="mySlides fade">
      <img src="https://images.unsplash.com/photo-1554552000-c0baf165e54e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" style="width:100%">
    </div>
  
    <div class="mySlides fade">
      <img src="https://images.unsplash.com/photo-1607962940358-43c4389405ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80" style="width:100%">
    </div>
  
    <div class="mySlides fade">
      <img src="https://images.unsplash.com/photo-1627894485229-ff2c619723e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" style="width:100%">
    </div>

	
</div>

 <div style="margin: 0 auto; text-align: center;"><i style="font-size: 16px;" class="fa-solid fa-window-minimize"></i></div>

<div class="image1 scroll-img" style="margin-top: 10px;" >
  <div class="image1-box">
    <h3 style="font-size: 40px; color: white; font-weight: bold;">MGM 사이트 인기순 </h3>
    <button type="button" class="image1-box-btn">VIEW MORE</button>
  </div>
</div>

    <div class="text ">
      <h2>
        등산이 점점 좋아집니다. <br><br>
        MGM과 함께 <br><br>
        <button type="button" class="image1-box-btn">VIEW MORE</button><br><br>
        <img src="img/TeamPhoto.png" width="600px" height="250px" alt="">
        
      </h2>
    </div>

    <div class="image2 scroll-img">
      <div class="image2-box">
        <h3 style="font-size: 40px; color: white; font-weight: bold;">MGM 사이트 난이도순 </h3>
        <button type="button" class="image1-box-btn">VIEW MORE</button>
      </div>
    </div>

    <div style="margin: 0 auto; text-align: center;"><i style="font-size: 16px;" class="fa-solid fa-window-minimize"></i></div>
    <div style="margin: 0 auto; text-align: center;">
      <h1>INSTAGRAM</h1>
      <h4>@MGM_Mountain</h4>
    </div>
    
    <div style="position: relative;">
      <div style="position: absolute; width: 33.3%; padding: 10px; left: 0px; top: 0px;">
        <img src="https://images.unsplash.com/photo-1516825994218-b2d93290b0fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" width="613px" height="500px" alt="">
      </div>
      <div style="position: absolute; width: 33.3%; padding: 10px; left: 635px; top: 0px;">
        <img src="https://images.unsplash.com/photo-1467139701929-18c0d27a7516?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" width="613px" height="395px" alt="">
      </div>
      <div style="position: absolute; width: 33.3%; padding: 10px; left: 1270px; top: 0px;">
        <img src="https://plus.unsplash.com/premium_photo-1676982101887-49bb12d8a104?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80" width="613px" alt="">
      </div>
      <div style="    position: absolute; width: 33.3%; padding: 10px; left: 635px; top: 425px;">
        <img src="https://images.unsplash.com/photo-1554710869-95f3df6a3197?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=677&q=80" width="613px" height="1075px" alt="">
      </div>
      <div style="position: absolute; width: 33.3%; padding: 10px; left: 0px; top: 521px;">
        <img src="https://images.unsplash.com/photo-1623390003556-3ac0b6602dba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" width="613px" alt="">
      </div>
      <div style="position: absolute; width: 33.3%; padding: 10px; left: 1270px; top: 435px;">
        <img src="https://images.unsplash.com/photo-1566371486037-6072a54daf1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" width="613px" height="1065px" alt="">
      </div>
      <div style="position: absolute; width: 33.3%; padding: 10px; left: 0px; top: 999px;">
        <img src="https://images.unsplash.com/photo-1534067783941-51c9c23ecefd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" width="100%" alt="">
      </div>
      <div style="position: absolute; width: 66.6%; padding: 10px; left: 635px; top: 1514px;">
        <img src="https://images.unsplash.com/photo-1486870591958-9b9d0d1dda99?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80" width="1250px" alt="">
      </div>
    </div>
</div>   
    	<div style="height:2300px"></div>
	
		<%@ include file="./Footer.jsp" %>

  <script>

        let slideIndex = 0;
        showSlides();

        function showSlides() {
          let i;
          let slides = document.getElementsByClassName("mySlides");
          for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
          }
          slideIndex++;
          if (slideIndex > slides.length) {slideIndex = 1}
          slides[slideIndex-1].style.display = "block";
          setTimeout(showSlides, 2500); // Change image every 2 seconds
        }


        var quickBox = $('.quick-menu');
        var quick_top = 120; 
        quickBox.css('top', $(window).height() );
        $(document).ready(function(){
        quickBox.animate( { "top": $(document).scrollTop() + quick_top +"px" },  100 );
         $(window).scroll(function(){
          quickBox.stop();
          quickBox.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 100 ); 
         });
        });
       
        
  </script>
</body>
</html>