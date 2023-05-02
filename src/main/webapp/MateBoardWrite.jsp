<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MateBoardWrite</title>
 <link rel="stylesheet" href="<c:url value="/webjars/jquery-ui/1.11.4/jquery-ui.min.css"/>" type="text/css"/>
 <script src="<c:url value="/webjars/jquery/2.2.1/jquery.min.js"/>"></script>
 <script src="<c:url value="/webjars/jquery-ui/1.11.4/jquery-ui.min.js"/>"></script>
<style>
	#write_box {
		width:80%;
		margin:0 auto;
	}
	#wtitle {
		width: 100%;
		margin-bottom:10px;
	}
	#wcontent {
		width: 100%;
		height: 500px;
	}
</style>
</head>
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
		<form id="mSearch" action="./mountain">
			<input type="text" name="mName" value="${dto.m_name }">
			<button type="submit" id="mSearchBtn">검색</button>
		</form>
		
		<form id="write_board" action="./write?mode=MateBoard" method="post" onsubmit="return formCheck(this)">
			<input type="text" name="mNum" value="${dto.m_num }">
			<input type="text" name="id" value="${sessionScope.UserId }">
			<p>난이도 : ${dto.level }</p>
			<p>추천수 : ${dto.m_recommend }</p>
			
			<select name="limit">
				<option value="0" selected>제한없음</option>
				<option value="5">1~5명</option>
				<option value="10">6~10명</option>
				<option value="20">11~20명</option>
			</select>
			
	        <p><input type="datetime-local" name="dDay"></p>
		
			<input id="wtitle" type="text" name="title">제목<br>
			<textarea id="wcontent" name="content">
			</textarea>		
			
			<div id="wbtns">
			<button type="submit">등록</button>
			<button type="reset">다시 입력</button>
			<button type="button" onclick="location.href='./list?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
			</div>
		</form>
	</div>
<%@ include file="./Footer.jsp" %>
</body>
</html>