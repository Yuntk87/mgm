
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
<style>
	table {
		border-collapse : collapse;
	}
	#edit_box {
		width:80%;
		text-align:center;
		margin:0 auto;	
	}
	h2 {
		margin:30px;
	}
	input, textarea {
		width:98%;
		border:none;
		vertical-align: middle;
	}
	textarea {
		
		height:90%;
		resize:none;
	}
</style>
</head>
<body>
<%@ include file="Navi.jsp" %>
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

	<div id="edit_box">		
		<h2>메이트 게시판 - 수정하기(Edit)</h2>
		
		<form name="editFrm" action="./MateBoardEdit" method="post" onsubmit="return formCheck(this)">
			<table border="1" width="100%">
			<input type="hidden" name="num" value="${dto.mate_num }">
			<input type="hidden" name="mNum" value="${dto.m_num }">
				<tr>
					<td>번호</td>
					<td>${dto.mate_num }</td>
					<td>작성자</td>
					<td>${dto.id }</td>
				</tr>
				<tr>
					<td>작성일</td>
					<fmt:formatDate value="${dto.postDate }" type="both" pattern="yyyy-MM-dd hh:mm" var="post"/>
					<td>${post }</td>
					
					<td>조회수</td>
					<td>${dto.viewCount }</td>
				</tr>
				<tr>
					<td>산이름(변경불가)</td>
					<td>
						<input type="text" name="mName" value="${param.mName }" readonly>
					</td>
					<td>${dto.m_name }</td>
					
					<td>예정일</td>
					<fmt:formatDate value="${dto.dDay }" type="both" pattern="yyyy-MM-dd hh:mm:ss" var="dDay"/>
					<td><input type="datetime-local" name="dDay" value="${dDay }"></td>
					

					<td>인원</td>
					<td>
						<select name="limit">
							<option value="0" ${dto.mateLimit=='0'? 'selected' : '' }>제한없음</option>
							<option value="5" ${dto.mateLimit=='5'? 'selected' : '' }>1~5명</option>
							<option value="10" ${dto.mateLimit=='10'? 'selected' : '' }>6~10명</option>
							<option value="20" ${dto.mateLimit=='20'? 'selected' : '' }>11~20명</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input id="wtitle" type="text" name="title" value="${dto.title }""></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3" height="100"><textarea id="wcontent" type="text" name="content">${dto.content }</textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<button type="button" onclick="editPost()">작성완료</button>
						<button type="reset">다시입력</button>
						<button type="button" onclick="location.href='./MateBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
					</td>
				</tr>
			</table>
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