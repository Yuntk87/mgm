<%@page import="dto.MountainDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.MountainDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<%
	ServletContext sc = getServletContext();
	MountainDao dao = new MountainDao(sc);
	List<MountainDto> PopularList = dao.PopularList();
	dao.close();
%>
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
    <h3 style="font-size: 40px; color: white; font-weight: bold;">MGM 사이트 산 소개 </h3>
    <button type="button" class="image1-box-btn"><a href='MountainList'>VIEW MORE</a></button>
  </div>
</div>

    <div class="text ">
      <h2>
        등산이 점점 좋아집니다. <br><br>
        MGM과 함께 <br><br>
        <button type="button" class="image1-box-btn"><a href="HomepageIntroduction.jsp">VIEW MORE</a></button><br><br>
        <img src="img/그림4.png" width="600px" height="250px" alt="">
        
      </h2>
    </div>

    <div class="image2 scroll-img">
      <div class="image2-box">
        <h3 style="font-size: 40px; color: white; font-weight: bold;">MGM 사이트 게시판</h3>
        <button type="button"  class="image1-box-btn"><a href='FreeBoardList'>VIEW MORE</a></button>
      </div>
    </div>

    <div style="margin: 0 auto; text-align: center;"><i style="font-size: 16px;" class="fa-solid fa-window-minimize"></i></div>
    <div style="margin: 0 auto; text-align: center;">
      <h1>POPULARITY MOUNTAIN</h1>
      <h4>#FROM_MGM</h4>
    </div>
    
    <div class="popula_box">
   		 <c:forEach items="<%=PopularList %>" var="b">
    		<div class="popula_container">
        		<img class="popula_image img">
        		<div class="popula_overlay">
		            <h1>${b.m_name }</h1>
		            <h2>${b.m_addr_1 } ${b.m_addr_2 }</h2>
		            <h3><i class="fa-solid fa-person-hiking"></i> : ${b.level }</h3>
		            <h3><i class="fa-solid fa-heart"></i> : ${b.m_recommend }</h3>
        		</div>
    		</div>
    	</c:forEach> 
    </div>
    <div style="clear:both;"></div>
</div>

    	
		
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
	
        const images = ["https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201811/11/13244af0-d127-4ae9-9c6b-fee3f14956f9.jpg",
        		"https://www.jirisantour.com/images/homepage/www/kr/content/img_jirisanintroTop.jpg",
        		"https://www.me.go.kr/home/file/preview.do?fileId=165713&fileSeq=1",
        		"https://cdn.shanews.com/news/photo/201210/283693_25518_012.jpg",
        		"https://www.hongcheon.go.kr/site/tour/images/contents/cts1816_img2-1.png",
        		"https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/aYgW/image/UjSAV9d59wqQwyOyD04ggE96NUA.jpg",
        		"https://www.cctoday.co.kr/news/photo/202011/2107124_554954_3800.jpg",
        		"https://www.canews.kr/news/photo/201805/730_1010_4135.jpg",
        		"https://image.newdaily.co.kr/site/data/img/2019/02/17/2019021700060_0.jpg"
        		];
        for(let i =0; i<document.getElementsByClassName('img').length; i++){
            document.getElementsByClassName('img')[i].src = images[i]
        }
       
        
      
  </script>
</body>
</html>