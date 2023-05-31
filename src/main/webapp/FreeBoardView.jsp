<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FreeBoardView</title>
<link rel="stylesheet" href="./css/FreeBoardView.css">

</head>
<body>
<%@ include file="Navi.jsp" %>
	<div id="view_box">
		<form name="writeFrm">
			<input type="hidden" name="num" value="${dto.fbnum }">
			<div class="category">
				${dto.category }
			</div>
			<div class="fbtitle">
				<div class="title1">
					<input type="text" class="title1" name="title" value="${dto.title }" disabled>
				</div>
				<div class="titleRight">
						<a href="#commentList"><i class="fa-regular fa-comment"> 댓글</i></a>
						<a href='./FreeBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'><i class="fa-solid fa-list"> 목록보기</i></a>
				</div>
			</div>
			<div class="profile">
				<div class="profile1">
						<span class="nickName" style="cursor:pointer;" onClick="location.href='./yourpage?id=${dto.id}'">${dto.nickName }</span>
						<span class="lv">Lv.${udto.level }</span>
						<fmt:formatDate value="${dto.postDate }" type="both" pattern="yyyy-MM-dd hh:mm" var="post"/>
						<span class="days">${post } &nbsp;&nbsp; 조회 : &nbsp;${dto.viewCount }</span>
				</div>
				<div class="btnDiv">
					<c:choose>
						<c:when test="${sessionScope.UserId != null && sessionScope.UserId eq dto.id || sessionScope.UserId eq 'admin'}">
							<button type="button" class="boButton" onclick="location.href='./FreeBoardEdit${sc.getQueryString(param.page) }&num=${dto.fbnum }'">수정하기</button>
							<button type="button" class="boButton" onclick="deletePost()">삭제하기</button>
						</c:when>
					</c:choose>		
				</div>
			</div>
			
			<div class="content">
				<textarea type="text" name="content" disabled>${ dto.content}</textarea>
			</div>		
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