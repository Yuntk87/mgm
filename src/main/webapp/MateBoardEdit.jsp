
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

	<div id="edit_box">		
		<h2>메이트게시판 수정하기</h2>	
		<hr>
		<form name="editFrm" action="./MateBoardEdit" method="post" onsubmit="return formCheck(this)">
			<div class="content">
				<input type="hidden" name="num" value="${dto.mate_num }">
				<input type="hidden" name="mNum" value="${dto.m_num }">
				<input type="hidden" name="id" value="${sessionScope.UserId }">
				<input type="hidden" name="nickName" value="${sessionScope.UserNickName }">

				<div id="scheduleBox">
					<div>
						<i class="fa-solid fa-calendar-days"></i>
					</div>
					<div>
						산 이름(변경불가) : <input type="text" name="mName" value="${param.mName }" readonly>
					</div>
					<div>
						제한인원 : <select name="limit" required>
							<option value="1000" ${dto.mateLimit=='0'? 'selected' : '' }>제한없음</option>
							<option value="5" ${dto.mateLimit=='5'? 'selected' : '' }>1~5명</option>
							<option value="10" ${dto.mateLimit=='10'? 'selected' : '' }>6~10명</option>
							<option value="20" ${dto.mateLimit=='20'? 'selected' : '' }>11~20명</option>
						</select>
					</div>
					<div>
						<fmt:formatDate value="${dto.dDay }" type="both" pattern="yyyy-MM-dd hh:mm:ss" var="dDay"/>
						날짜 : <input type="datetime-local" name="dDay" value="${dDay }">
					</div>
				</div>


				<input id="wtitle" type="text" name="title" value="${dto.title }">
				<textarea id="wcontent" type="text" name="content">${dto.content }</textarea>	
				
				<div id="btnBox">
					<button type="button" class="boButton" onclick="editPost()">작성완료</button>
					<button type="reset" class="boButton">다시입력</button>
					<button type="button" class="boButton" onclick="location.href='./MateBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
				</div>
			</div>
		</form>
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