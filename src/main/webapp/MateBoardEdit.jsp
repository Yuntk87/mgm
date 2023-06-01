
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MateBoardEdit</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/a8d8408c2e.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/MateBoardEdit.css">
<script src=./js/MateBoardWrite.js></script>
</head>
<%
	Date mToday = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	String now = sdf.format(mToday);	
%>
<body>
<%@ include file="Navi.jsp" %>

	<div id="edit_box">		
		<h2>메이트게시판 수정하기</h2>	
		<div class="searchDiv">
			<div class="searchDiv1">
			<h2>일정</h2>
				<form id="mSearch" action="./mountain" method="post">
					<input type="hidden" name="mode" value="searchEdit">
					<input type="hidden" name="num" value="${dto.mate_num }">
					<input type="hidden" name="title1" value="${dto.title}">
					<input type="hidden" name="content1" value="${dto.content}">
					
					<div>
						<input type="text" id="mountainName" name="mountainName" value="${param.mName }">
						<button type="button" id="mSearchBtn" onclick="mSearch()" class="myButton">검색</button>
						<table id="MTable"></table>
					</div>
					<div>
						제한인원 : 
						<select id="limitVal" name="limitVal" required>
							<option value="1000" ${dto.mateLimit=='0'? 'selected' : '' }>제한없음</option>
							<option value="5" ${dto.mateLimit=='5'? 'selected' : '' }>1~5명</option>
							<option value="10" ${dto.mateLimit=='10'? 'selected' : '' }>6~10명</option>
							<option value="20" ${dto.mateLimit=='20'? 'selected' : '' }>11~20명</option>
						</select>
						<fmt:formatDate value="${dto.dDay }" type="both" pattern="yyyy-MM-dd hh:mm:ss" var="dDay"/>
						날짜 : <input type="datetime-local" id="dDayVal" name="dDayVal" min="<%=now %>" value="${dDay }" required>
					</div>
					<div>
						<button id="scheduleBtn" type="submit">등록</button><button id="scheduleBtnC" type="button">닫기</button>
					</div>
				</form>
			</div>
		</div>
		<div class="content">
			<form name="editFrm" action="./MateBoardEdit" method="post" onsubmit="return formCheck(this)">
				<input type="hidden" name="num" value="${num }">
				<input type="hidden" name="mNum" value="${mdto.m_num }">
				<input type="hidden" id="mName" name="mName" value="${mdto.m_name }">
				<input type="hidden" id="limit" name="limit" value="${limit }">
				<input type="hidden" id="dDay" name="dDay" value="${dDay }" >
				
				<div id="scheduleBox">
					<div>
						<span class="sbSpan"><i id="scheduleModal" class="fa-solid fa-calendar-days">일정</i></span>
						<span class="sbSpan">
							목적지 : <input type="text" id="mName1" name="mName1" value="${mdto.m_name }" placeholder="일정을 다시 선택해 주세요" disabled>
						</span>
						<span class="sbSpan">
							인원제한 : <input type="text" id="limit1" name="limit1" value="${limit }" disabled>
						</span>
						<span class="sbSpan">
							예정일 : <input type="text" id="dDay1" name="dDay1" value="${dDayF }" disabled>
						</span>
					</div>
					<div class="searchDiv2">
						<a href='./MateBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'><i class="fa-solid fa-list"> 목록보기</i></a>
					</div>
				</div>
				<input id="wtitle" type="text" name="title" value="${not empty dto.title? dto.title : title}"><br>
				<textarea id="wcontent" name="content">${not empty dto.content? dto.content : content}</textarea>		
				
				<div id="btnBox">
					<button type="button" class="boButton" onclick="editPost()">작성완료</button>
					<button type="reset" class="boButton">다시입력</button>
				</div>
			</form>
		</div>
	</div>
<%@ include file="./Footer.jsp" %>
<script>
	function editPost() {
		var confirmed = confirm("게시글을 수정하시겠습니까?");
		if(confirmed) {
			var form = document.editFrm;
			form.method = "post"
			form.action = "./MateBoardEdit";
			if(formCheck(form)) {
				form.submit();	
			}
		}
	}
</script>
</body>
</html>