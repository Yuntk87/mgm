<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h2>자유게시판 글 쓰기</h2>	
		
		<form id="write_board" action="./FreeBoardWrite" method="post" onsubmit="return formCheck(this)">
			<input type="hidden" name="id" value="${sessionScope.UserId }">
			<input type="hidden" name="nickName" value="${sessionScope.UserNickName }">
			<select name="category">
				<option value="산">산</option>
				<option value="맛집">맛집</option>
				<option value="기타">기타</option>
			</select>
			<label for="wtitle">제목</label><br>
			<input id="wtitle" type="text" name="title"><br>
			<label for="wcontent">내용</label><br>
			<textarea id="wcontent" name="content"></textarea>
			<div id="wbtns">
			<button type="submit">등록</button>
			<button type="reset">다시 입력</button>
			<button type="button" onclick="location.href='./FreeBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
			</div>
		</form>
	</div>
<%@ include file="./Footer.jsp" %>
</body>
</html>