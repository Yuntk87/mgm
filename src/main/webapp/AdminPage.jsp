<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/AdminPage.css">
<script src=./js/AdminPage.js></script>
</head>

<body>
<%-- <%@ include file="./Navi.jsp" %> --%>
	
	<div class="tab">
	  <h1>관리자 페이지</h1>
	  <button id="tablinks1" class="tablinks" onclick="openCity(event, 'confirm')">인증게시글 관리</button>
	  <button class="tablinks" onclick="openCity(event, 'mountain')">산 관리</button>
	  <button class="tablinks" onclick="openCity(event, 'user')">회원 관리</button>
	</div>
	
	<div id="confirm" class="tabcontent">
	  	<h2>confirm</h2>
<%-- 		<%@include file="ConfirmBoardList.jsp" %> --%>
		<c:import url="./ConfirmBoardList.jsp" />
	</div>

	<div id="mountain" class="tabcontent">
		<h2>mountain</h2>
<%-- 		<%@include file="MountainSearch_Register.jsp" %> --%>
		<c:import url="./MountainSearch_Register.jsp" />
	</div>
	
	<div id="user" class="tabcontent">
	    <h2>user</h2>
	    <c:import url="./UserTable.jsp" />
	</div>

</body>
</html>