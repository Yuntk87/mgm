<%@page import="dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/Navi.css">
    <title>Main</title>
</head>

<body>
    <div class="navi">
        <ul class="navi_menu" >
            <li><a class="active" href="./Main.jsp" style="font-size: 40px">MGM</a></li>
            <li><a href="./HomepageIntroduction.jsp" >홈페이지 소개</a></li>
            <li><a href="./MountainList">산 소개</a></li>
            <li><a href="./FreeBoardList">자유 게시판</a></li>
            <li><a href="./MateBoardList">메이트 게시판</a></li>
            <li><a href="./ConfirmBoard?mode=confirm">인증 게시판</a></li>
            <c:if test="${not empty sessionScope.UserId && sessionScope.UserId eq 'admin'}">
            	<li><a href="./admin" class="master">관리자</a></li>
            </c:if>
        </ul>
        <ul>
  			<%@ include file="./Weather.jsp" %>
        </ul>
        <div class="navi_login">
            <c:choose>
                <c:when test="${empty sessionScope.UserId }" >
                    <a class='link' href='./login'>로그인</a>
                    <a class="link" href="./register" >회원가입</a>
                   </c:when>
                   <c:otherwise>
                       <a class='link' href='./mypage'>회원정보</a>
                       <a class='link' href='./logout'>로그아웃</a>
                  </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="master_menu">
        <a href="#">산 관리</a>
        <a href="#">회원 관리</a>
    </div>
    
    
    
    
    
    
    <div class="quick-menu" id="quick" >
    
    
    	<div class="quick-btn-box">
        	<button class="q-box-btn" ><i class="fa-solid fa-angles-right right-btn" style="color:white;"></i><i class="fa-solid fa-angles-left left-btn" style="color: white;"></i></button>
        </div>
        
        
    	<div class="quick-text">
    		<span style="font-family: 'Oswald', sans-serif; color:white;">Quick</span>
    	</div>
    	
        <div class="quick-box">
          <i class="fa-solid fa-comment"></i><br>
		  <input type="hidden" value=${sessionScope.UserNickName } id="chatId"/>   
          <button class="btn">Talk</button>
        </div>
        <div class="modal">
            <div class="modal-content">
              <span class="close">&times;</span>
              <c:choose>
                  <c:when test="${empty sessionScope.UserNickName}">
                  	  <div class="loginlink">
                  	  	   로그인이 필요한 기능입니다
                	  </div>
                      <div class="loginlink">
	                      <a href="./login" style="font-size:14px;">로그인으로 이동 <i class="fa-solid fa-right-to-bracket"></i></a>
                      </div>
                  </c:when>
                  <c:otherwise>
                      <%@ include file="./ChatWindow.jsp" %>
                  </c:otherwise>
              </c:choose>        
            </div>
        </div>
        
        
     
        <div class="quick-box">
        
          <i class="fa-solid fa-location-dot"></i><br>
          <button class="btn">Map</button>
        </div>
        
        <div class="modal">
 
<!--             두 번째 Modal의 내용 -->
            <div class="modal-content">
              <span class="close">&times;</span>
				<c:import url="./ConfirmBoard.jsp" />
            </div>
        </div>


       
        <div class="quick-box">
          <i class="fa-solid fa-cloud"></i><br>
          <button class="btn">Weather</button>
        </div>
        
        <div class="modal">
 
<!--             세 번째 Modal의 내용 -->
            <div class="modal-content">
              <span class="close">&times;</span>
              <c:import url="./Weather10.jsp" />
            </div>
          </div>



        <div class="quick-box">
            <i class="fa-solid fa-ranking-star"></i><br>
            <button class="btn">Ranking</button>
        </div>
        
        <div class="modal">
	        <div class="modal-content">
              <span class="close">&times;</span>
              <c:import url="./Ranking.jsp" />
            </div>
        </div>
        
        <div class="quick-box">
            <i class="fa-solid fa-envelope"></i><br>
            <a id="abtn" href="./noteList" type="button">Note</a>
        </div>
     </div>
     


	<script src=./js/QuickMenu.js></script>
    
    
    <script>
    
        window.addEventListener('scroll', function(){
            if(window.scrollY > 80) {
                $('.navi').css('backgroundColor', "black");
                $('.navi').css('opacity', '1');
                $('.navi').css("transition", "0.5s");
            } else {
                $('.navi').css('backgroundColor', "rgba(0, 0, 0, 0.5)");
                $('.navi').css('opacity', '0.5');
                $('.navi').css("transition", "0.5s");
            }
            
        });
        window.addEventListener('scroll', function(){
            if(window.scrollY > 80) {
                $('.master-menu').css('backgroundColor', "black");
                $('.master-menu').css('opacity', '1');
                $('.master-menu').css("transition", "0.5s");
            } else {
                $('.master-menu').css('backgroundColor', "rgba(0, 0, 0, 0.5)");
                $('.master-menu').css('opacity', '0.5');
                $('.master-menu').css("transition", "0.5s");
            }
            
        });
       

        
        var quickBox = $('.quick-menu');
        var quick_top = 250; 
        quickBox.css('top', $(window).height() );
        $(document).ready(function(){
        quickBox.animate( { "top": $(document).scrollTop() + quick_top +"px" },  100 );
         $(window).scroll(function(){
          quickBox.stop();
          quickBox.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 100 ); 
         });
        });
        
        var quickBox2 = $('.q-box-btn'); 
        var quick_top2 = 150;
        quickBox2.css('top', $(window).height() );
        $(document).ready(function(){
        quickBox2.animate( { "top": $(document).scrollTop() + quick_top2 +"px" },  100 ); 
         $(window).scroll(function(){
          quickBox2.stop();
          quickBox2.animate( { "top": $(document).scrollTop() + quick_top2 + "px" }, 100 );
         });
        });
      

       

		
        $(document).ready(function(){
        	  textchange = true;
        	  $('.right-btn').css("display","none");
        	  $('.q-box-btn').click(function(){
        		
        	    if(textchange){
        	      textchange = false;
        	      $('.quick-menu').css("right", "0px");
        	      $('.right-btn').css("display", "block");
        	      $('.left-btn').css("display", "none");
//         	      $('.quick-btn-box').html("<button class='q-box-btn'><i class='fa-solid fa-angles-right' style='white;'></i></button>")
        	    }else{
        	      textchange = true;
        	      $('.quick-menu').css("right", "-60px");
        	      $('.right-btn').css("display", "none");
        	      $('.left-btn').css("display", "block");
        	    }
        	    
        	  })
        	})
        
    </script>

</body>
</html>