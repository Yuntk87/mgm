<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MateBoardWrite</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 <script src="https://kit.fontawesome.com/a8d8408c2e.js" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="./css/MateBoardWrite.css">
 <script src=./js/MateBoardWrite.js></script>
</head>
<%
	Date mToday = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	String now = sdf.format(mToday);	
%>
<body>
<%@ include file="Navi.jsp" %>

	<div id="write_box">
		<h2>메이트게시판 글 쓰기</h2>
		<div class="searchDiv">
			<div class="searchDiv1">
				<h2>일정</h2>
				<form id="mSearch" action="./mountain" method="post">
					<input type="hidden" name="mode" value="searchWrite">
					<div>
						<input type="text" id="mountainName" name="mountainName" placeholder="산을 검색하세요">
						<button type="button" id="mSearchBtn" onclick="mSearch()" class="myButton">검색</button>
						<table id="MTable"></table>
					</div>
					<div>
						제한인원 : 
						<select id="limitVal" name="limitVal" required>
							<option value="1000">인원제한 없음</option> 
							<option value="5">1~5명</option>
							<option value="10">6~10명</option>
							<option value="20">11~20명</option>
						</select>
						날짜 : <input type="datetime-local" id="dDayVal" name="dDayVal" min="<%=now %>" required>
					</div>
					<div>
						<button id="scheduleBtn" type="submit">등록</button><button id="scheduleBtnC" type="button">닫기</button>
					</div>
				</form>
			</div>

		</div>
		
		<div class="content">
			<form id="write_board" action="./MateBoardWrite" method="post" onsubmit="return formCheck(this)">
				<input type="hidden" name="mNum" value="${dto.m_num }">
				<input type="hidden" id="mName" name="mName" value="${dto.m_name }">
				<input type="hidden" id="limit" name="limit" value="${limit }">
				<input type="hidden" id="dDay" name="dDay" value="${dDay }" >

				<div id="scheduleBox">
					<div>
						<span class="sbSpan"><i id="scheduleModal" class="fa-solid fa-calendar-days">일정</i></span>
						<span class="sbSpan">
							목적지 : <input type="text" id="mName1" name="mName1" value="${dto.m_name }" placeholder="일정을 선택해 주세요" disabled>
							<span class="mInfo">난이도 : ${dto.level } 추천수 : ${dto.m_recommend }</span>
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
				<input id="wtitle" type="text" name="title" placeholder="제목을 입력해 주세요"><br>
				<textarea id="wcontent" name="content" placeholder="내용을 입력해 주세요"></textarea>		
				
				<div id="btnBox">
					<div class="wbtns">
						<button type="submit" class="myButton">등록</button>
						<button type="reset" class="myButton">다시 입력</button>
					</div>
				</div>
			</form>
		</div>
	</div>
<%@ include file="./Footer.jsp" %>
</body>
</html>