<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/AdminPage.css">
<script src=./js/AdminPage.js></script>
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
	<div class="tab">
	  <button id="tablinks1" class="tablinks" onclick="openCity(event, 'confirm')">인증게시글 관리</button>
	  <button class="tablinks" onclick="openCity(event, 'mountain')">산 관리</button>
	  <button class="tablinks" onclick="openCity(event, 'user')">회원 관리</button>
	</div>
	
	<div id="confirm" class="tabcontent">
	  	<h2>CONFIRM</h2>
		<c:import url="./ConfirmBoardList.jsp" />
	</div>

	<div id="mountain" class="tabcontent">
		<h2>MOUTAIN</h2>
		<c:import url="./MountainSearch_Register.jsp" />
	</div>
	
	<div id="user" class="tabcontent">
	    <h2>USER</h2>
	    <c:import url="./UserTable.jsp" />
	</div>

</body>
</html>