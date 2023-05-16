<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="./css/Navi.css?v=1" rel="stylesheet">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<script src="Navi.js"></script>
<style>
	#dDay {
		color: black;
	}
</style>
<body>
	 <nav class="navbar" style="position: fixed; top:0; left:0; width: 100%; z-index: 1;">
            <div class="navbar_logo">
                <i class="fa-solid fa-mountain-sun"></i>
                <a class="link" href="./Main.jsp">MGM</a>
            </div>
    
            <ul class="navbar_menu">
                <li><a class="link" href="./HomepageIntroduction.jsp" >홈페이지 소개</a></li>
                <li><a class="link" href="./MountainList">산 소개</a></li>
                <li><a class="link" href="./FreeBoardList">자유 게시판</a></li>
                <li><a class="link" href="./ConfirmBoardList">인증 게시판</a></li>
                <li><a class="link" href="./MateBoardList">메이트 게시판</a></li>
                <li><a class="link master" href="#">회원 관리 페이지</a></li>
            </ul>
      
            <div>
        		<c:choose>
	        		<c:when test="${empty sessionScope.UserId }" >
	        			<a class='alink' href='./login'>로그인</a>
	       			</c:when>
	       			<c:otherwise>
	       				<a class='alink' href='./MyPage'>회원정보</a>
	       				<a class='alink' href='./logout'>로그아웃</a>
	  				</c:otherwise>
				</c:choose>
				<a class="alink" href="./register" >회원가입</a>
        	</div>
        </nav>
        <!-- 메인 네비게이션 -->
<%@include file="./Weather.jsp" %>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
</body>
</html>