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
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <title>Document</title>
</head>

<%
	ServletContext sc = getServletContext();
	MountainDao dao = new MountainDao(sc);
	List<MountainDto> PopularList = dao.PopularList();
// 	String res = dao.PopularNameList();
// 	request.setAttribute("res", res);
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
   		 	 <a href="./view?searchWord=${b.m_name }&m_num=${b.m_num}&m_name=${b.m_name}">
    		 <div class="popula_container" >
				<img class="img popula_image" style="width:500px; height:600px;" src="" >
        		<div class="popula_overlay">
		            <h1>${b.m_name }</h1>
		            <h2>${b.m_addr_1 } ${b.m_addr_2 }</h2>
		            <h3><i class="fa-solid fa-person-hiking"></i> : ${b.level }</h3>
		            <h3><i class="fa-solid fa-heart"></i> : ${b.m_recommend }</h3>
        		</div>
    		</div>
    		</a>
    	</c:forEach> 
    </div>
    
   
</div>

    	
		
		<%@ include file="./Footer.jsp" %>

	
   
    
	
	
		
	
	


	



 
	 
  <script>
  
  const images = ["./img/속리산.jpg", "./img/지리산.jpg", "./img/우암산.jpg", "./img/계룡산.jpg", "./img/양성산.jpg", "./img/월악산.jpg", "./img/조령산.jpg", "./img/천태산.jpg", "./img/대야산.jpg"]
  for(let i =0; i<document.getElementsByClassName('img').length; i++){
		document.getElementsByClassName('img')[i].src = images[i]
	}
		
        let index = 0;
        showSlides();

        function showSlides() {
          let i;
          let slides = document.getElementsByClassName("mySlides");
          for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
          }
          index++;
          if (index > slides.length) {index = 1}
          slides[index-1].style.display = "block";
          setTimeout(showSlides, 2500); // Change image every 2 seconds
        }
	
        
  </script>
       
<%--        		let tmp = "${res}"; --%>
<!--       			let mlist = tmp.split(' '); -->
<!--        		window.onload= function(){  -->
<!--        		for(let i = 0; i<mlist.length; i++){ -->
<!--                  (function (i){  -->
<!--                	   $.ajax({ -->
<!--                        type : "GET",            // HTTP method type(GET, POST) 형식이다. -->
<!--                        url : "https://dapi.kakao.com/v2/search/image",      // 컨트롤러에서 대기중인 URL 주소이다. -->
<!--                       dataTypee : 'json', -->
<!--                       headers : {'Authorization': 'KakaoAK fcbb5e354414be93d5289d773b6993c5'}, -->
<!--                       data :  {'query':mlist[i], 'size':5}, -->
<!--                        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다. -->
<!--                       	$.each(res.documents, function (z, search) { -->
<!--                      		$("#content"+mlist[i]).append("<img width='500px' height='600px' alt='"+ mlist[i]+ "' src=" + search.image_url+" onerror='this.remove ? this.remove() : this.removeNode();' />") -->
<!--       	                	console.log("#content"+mlist[i]) -->
<!--                           }); -->
<!--                         }, -->
<!--                        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다. -->
<!--                            alert("통신 실패.") -->
<!--                         } -->
<!--                     });})(i); -->
<!--        		} -->
<!--         		} -->
      
      
  
</body>
</html>