<%@page import="common.JSFunction"%>
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
	table {
		border-collapse : collapse;
	}
	#view_box {
		width:80%;
 		text-align:center;
		margin:0 auto;	
	}
	h2 {
		margin:30px;
	}
	textarea, input {
		vertical-align: middle;
	}
	textarea {
		border:none;
		background:#fff;
		width:98%;
		height:95%;
		resize:none;
	}
	input {
		margin-left:5px;
		border:none;
		left:0;
		background:#fff;
	}
	.title {
		text-align:left;
	}
</style>
</head>
<body>
<%@ include file="Navi.jsp" %>
	<div id="view_box">
		<h2>자유 게시판 - 상세보기</h2>
		<form name="writeFrm">
			<input type="hidden" name="num" value="${dto.fbnum }">
			
			<table border="1" width="100%">
				<tr>
					<td>번호</td>
					<td>${dto.fbnum }</td>
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
					<td>카테고리</td>
					<td>${dto.category }</td>
				</tr>
				<tr>
					<td>제목</td>
					<td class="title" colspan="3"><input type="text" name="title" value="${dto.title }" disabled></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3" height="100"><textarea type="text" name="content" disabled>${ dto.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
					<c:if test="${sessionScope.UserId != null && sessionScope.UserId eq dto.id }">
						<button type="button" onclick="location.href='./FreeBoardEdit${sc.getQueryString(param.page) }&num=${dto.fbnum }'">수정하기</button>
						<button tyep="button" onclick="deletePost()">삭제하기</button>
					</c:if>
					<button type="button" onclick="location.href='./FreeBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
					</td>
				</tr>
			</table>		
		</form>
		<%@ include file="./FreeBoardComment.jsp" %>
	</div>
<%@ include file="./Footer.jsp" %>
<script>
	function deletePost() {
		var confirmed = confirm("정말 삭제하시겠습니까?");
		if(confirmed) {
			var form = document.writeFrm;
			form.method = "post"
			form.action = "./FreeBoardDelete";
			form.submit();
		}
	}
</script>
</body>
</html>