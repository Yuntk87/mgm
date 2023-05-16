<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuickMenu</title>
<link href="./css/QuickMenu.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<!-- 첫 번째 Modal을 여는 클래스 -->
	
	<input type="hidden" value=${sessionScope.UserNickName } id="chatId"/>   
	<button class="btn" onclick="chatWinOpen()">MODAL_1</button>
	
	<!-- 첫 번째 Modal -->
	<div class="modal">
 
	  <!-- 첫 번째 Modal의 내용 -->
	  <div class="modal-content">
		<span class="close">&times;</span>
		<c:choose>
		    <c:when test="${empty sessionScope.UserNickName}">
				<p>*로그인이 필요한 기능입니다*</p>
				<a href="./login">로그인으로 이동</a>
		    </c:when>
		    <c:otherwise>
				<%@ include file="./ChatWindow.jsp" %>
		    </c:otherwise>
		</c:choose>        
	  </div>
	</div>
 
	<hr>
	<!-- 두 번째 Modal을 여는 클래스 -->
	<button class="btn">MODAL_2</button>
 
	<!-- 두 번째 Modal -->
	<div class="modal">
 
	  <!-- 두 번째 Modal의 내용 -->
	  <div class="modal-content">
		<span class="close">&times;</span>
		<%@ include file="./LocationCheck.jsp" %>
	  </div>
	</div>
 
	<hr>
	<!-- 세 번째 Modal을 여는 클래스 -->
	<button class="btn">MODAL_3</button>
 
	<!-- 세 번째 Modal -->
	<div class="modal">
 
	  <!-- 세 번째 Modal의 내용 -->
	  <div class="modal-content">
		<span class="close">&times;</span>
		<c:import url="./Weather10.jsp" />
  	  </div>
	</div>
 
<script src=./js/QuickMenu.js>
/*modal.js */
</script>

</body>
</html>