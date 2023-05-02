<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
<link href="./Main.css?v=1" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Navi</title>
</head>
<body>

        <nav class="navbar">
            <div class="navbar_logo">
                <i class="fa-solid fa-mountain-sun"></i>
                <a class="link" href="./Main.jsp">MGM</a>
            </div>
    
            <ul class="navbar_menu">
                <li><a class="link" href="#" >홈페이지 소개</a></li>
                <li><a class="link" href="./List.jsp">산 소개</a></li>
                <li><a class="link" href="./List?mode=FreeBoard">자유 게시판</a></li>
                <li><a class="link" href="./List?mode=ConfirmBoard">인증 게시판</a></li>
                <li><a class="link" href="./List?mode=CerBoard">메이트 게시판</a></li>
                <li><a class="link master" href="#">회원 관리 페이지</a></li>
            </ul>
        
	       	<c:choose>
	        	<c:when test="${empty sessionScope.UserId }" >
	        		<a class='link' href='./login'>로그인</a>
	       		</c:when>
	       		<c:otherwise>
	       			<a class='link' href='./logout'>로그아웃</a>
	  			</c:otherwise>
			</c:choose>
			<a class="link" href="./register" >회원가입</a>
        </nav>
        
<!--        	<div id="logo_box"> -->
<!-- 			<a href="./main" id="logo"><i class="fa-solid fa-pencil">study log</i></a> -->
<!-- 			<div id="mbox"> -->
<%-- 				<c:if test="${not empty sessionScope.UserName }"> --%>
<%-- 					<span class="username">${sessionScope.UserName }</span>님 환영합니다. --%>
<%-- 				</c:if> --%>
<!-- 			</div> -->
<!-- 		</div> -->


</body>
</html>