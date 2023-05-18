<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MateBoardView</title>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://kit.fontawesome.com/a8d8408c2e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/MateBoardView.css">
    <script src="./js/MateBoardView.js"></script>
</head>
<body>
<%@ include file="Navi.jsp" %>
	<div id="view_box">
		<form name="writeFrm">
			<input type="hidden" id="num" name="num" value="${dto.mate_num }">
			<input type="hidden" id="id" name="id" value="${dto.id }">
			<input type="hidden" id="mNum" name="mNum" value="${dto.m_num }">
			<div></div>
			<div class="mbtitle">
				<input type="text" class="mbtitle1" name="title" value="${dto.title }" disabled>
			</div>
			<div class="profile">
				<div class="profile1">
					<span class="nickName" style="cursor:pointer;" onClick="location.href='./yourpage?id=${dto.id}'">${dto.id }</span><span class="lv">Lv.${udto.level }</span>
					<fmt:formatDate value="${dto.postDate }" type="both" pattern="yyyy-MM-dd hh:mm" var="post"/>
					<span class="days">${post } &nbsp;&nbsp; 조회 : &nbsp;${dto.viewCount }</span>
				</div>
				<div class="profile2">
					<a href="#commentList"><i class="fa-regular fa-comment"> 댓글</i></a>
					<a href='./MateBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'><i class="fa-solid fa-list"> 목록보기</i></a>
				</div>
			</div>
			<div class="schedule">
				<div>
					<fmt:formatDate value="${dto.dDay }" type="both" pattern="yyyy-MM-dd hh:mm:ss" var="dDay"/>
					
					<i class="fa-solid fa-calendar-days"></i> &nbsp;&nbsp;&nbsp; <b>장소 :</b> ${dto.m_name } &nbsp;&nbsp;&nbsp;&nbsp; <b>예정일 :</b> &nbsp;&nbsp;<span id="dDay">${dDay }</span>  &nbsp;&nbsp;&nbsp;&nbsp; <b>제한 인원 : </b>&nbsp;&nbsp;${dto.mateLimit } &nbsp;/&nbsp; <span id="cnt">${cnt }
				</div>
				<div class="btnDiv">
					<c:choose>
						<c:when test="${sessionScope.UserId != null && sessionScope.UserId eq dto.id || sessionScope.UserId eq 'admin'}">
							<button type="button" class="myButton" onclick="location.href='./MateBoardEdit${sc.getQueryString(param.page) }&num=${dto.mate_num }&mName=${dto.m_name }'">수정하기</button>
							<button type="button" class="myButton" onclick="deletePost()">삭제하기</button>
						</c:when>
						<c:when test="${mdto != null}">
							<button id="joinBtn" type="button" class="myButton" type="button" >참가취소</button>
						</c:when>
						<c:when test="${dto.mateLimit eq cnt}">
							<button id="joinBtn" type="button" class="myButton" type="button" disabled>참가불가</button>
						</c:when>
						<c:otherwise>
							<button id="joinBtn" type="button" class="myButton" type="button" >참가하기</button>
						</c:otherwise>
					</c:choose>		
				</div>
			</div>
			<div class="content">
				<textarea type="text" name="content" disabled>${ dto.content}</textarea>
			</div>
		</form>
		<%@ include file="./MateBoardComment.jsp" %>
	</div>
<%@ include file="./Footer.jsp" %>

</body>
</html>