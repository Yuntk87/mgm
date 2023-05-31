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
</head>
<%
	Date mToday = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	String now = sdf.format(mToday);	
%>
<body>
<script>
	function formCheck(frm) {
		if(frm.title.value.trim() == "") {
			alert("제목을 입력하세요.");
			frm.title.focus();
			return false;
		}
		if(frm.content.value.trim() == "") {
			alert("내용을 입력하세요.");
			frm.content.focus();
			return false;
		}
		return true;
	}
</script>
<%@ include file="Navi.jsp" %>

	<div id="write_box">
		<h2>메이트게시판 글 쓰기</h2>	
		<hr>
		<div class="searchDiv">
			<div class="searchDiv1">
				<form id="mSearch" action="./mountain" method="post">
					<input type="hidden" name="mode" value="write">
					<input type="text" name="mName" value="${dto.m_name }" style="height:20px;" placeholder="산을 검색하세요">
					<button type="submit" id="mSearchBtn" class="myButton">검색</button>
				</form>
			</div>
			<div class="searchDiv2">
				<a href='./MateBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'><i class="fa-solid fa-list"> 목록보기</i></a>
			</div>
		</div>
		
		<div class="content">
			<form id="write_board" action="./MateBoardWrite" method="post" onsubmit="return formCheck(this)">
				<input type="hidden" name="mNum" value="${dto.m_num }">
				<input type="hidden" name="id" value="${sessionScope.UserId }">
				<input type="hidden" name="nickName" value="${sessionScope.UserNickName }">

				<div id="scheduleBox">
					<div>
						<i class="fa-solid fa-calendar-days"></i>
					</div>
					<div>목적지 : ${dto.m_name }</div>
					<div><span class="mInfo">난이도 : ${dto.level } 추천수 : ${dto.m_recommend }</div>
					<div>
						<select name="limit" required>
							<option disabled selected>제한인원</option> 
							<option value="1000">제한없음</option> 
							<option value="5">1~5명</option>
							<option value="10">6~10명</option>
							<option value="20">11~20명</option>
						</select>
					</div>
					<div>
						날짜 : <input type="datetime-local" name="dDay" min="<%=now %>" required>
					</div>
				</div>


			
				<input id="wtitle" type="text" name="title" placeholder="제목을 입력해 주세요"><br>
				<textarea id="wcontent" name="content" placeholder="내용을 입력해 주세요"></textarea>		
				
				<div id="btnBox">
					<div class="wbtns">
						<button type="submit" class="myButton">등록</button>
						<button type="reset" class="myButton">다시 입력</button>
	<%-- 				<button type="button" onclick="location.href='./MateBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button> --%>
					</div>
				</div>
			</form>
		</div>
	</div>
<%@ include file="./Footer.jsp" %>
</body>
</html>