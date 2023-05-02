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
		margin-top:10px;
		border-collapse : collapse;
	}
	th {
		border-top:1px solid #333;
		border-bottom:1px solid #333;
		text-align:center;
	}
	td {
		border-top:1px solid #999;
		border-bottom:1px solid #999;
		text-align:center;
	}
	#list_box {
		width: 80%;
		margin:0 auto;
	}
	.check {
		display: inline-block;
		padding:1px;
		text-align:center;
		border: 1px solid #999;
		border-radius:2px;
		color:red;
	}
	.search td{
		border: none;
	}
</style>
</head>
<body>
<%@ include file="Navi.jsp" %>
	<div id="list_box">
		<h2>자유 게시판</h2>
		<form id="search_form">
			<table class="search">
				<tr>
					<td>
						<select name="searchField">
							<option value="title" ${param.searchField eq 'title'? "selected" : "" }>제목</option>
							<option value="content" ${param.searchField eq 'content'? "selected" : "" } >내용</option>
							<option value="id" ${param.searchField eq 'id'? "selected" : "" }>작성자</option>
						</select>
						<input type="text" name="searchWord" id="search" value="${not empty param.searchWord? param.searchWord : '' }" >
						<button>검색</button>
					</td>
				</tr>		
			</table>
		</form>
		<table class="table">
			<tr>
				<th width="5%">번호</th>
				<th width="5%">카테고리</th>
				<th width="40%">제목</th>
				<th width="10%">작성자</th>
				<th width="10%">조회수</th>
				<th width="10%">댓글수</th>
				<th width="30%">등록날짜</th>
			</tr>
			<c:choose>
				<c:when test="${empty boardLists }" >
					<tr><td colspan="6">등록 된 게시물이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardLists }" var="b">
						<tr>
							<td>${b.fbnum }</td>
							<td>${b.category }</td>
							<td><a href='./view${ph.sc.getQueryString(ph.sc.page) }&num=${b.fbnum }&mode=FreeBoard'>${b.title }</a></td>
							<td>${b.id }</td>
							<td>${b.viewCount }</td>
							<td>${b.c_count }</td>
							
							<fmt:formatDate value="${today }" type="date" pattern="yyyy-MM-dd" var="now"/>
							<fmt:formatDate value="${b.postDate }" type="date" pattern="yyyy-MM-dd" var="post"/>
							<c:choose>
								<c:when test="${now eq post }">
									<td><fmt:formatDate value="${b.postDate }" type="time" pattern="HH:mm" /></td>
								</c:when>
								<c:otherwise>
									<td>${post }</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<button class="rbttn" onclick="location.href='./write${ph.sc.getQueryString(ph.sc.page) }&mode=FreeBoard'">글쓰기</button>
		
		<div id="page">
			<c:if test="${ph.showPrev }">
				<a href="<c:url value='/list${ph.sc.getQueryString(ph.beginPage-1) }' />">&laquo;</a>
			</c:if>
			<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
				<a class='${ph.sc.page==i? "check" : "" }' href="<c:url value='/list${ph.sc.getQueryString(i) }' />">${i }</a>
			</c:forEach>
			<c:if test="${ph.showNext }">
				<a href="<c:url value='/list${ph.sc.getQueryString(ph.endPage+1) }' />">&raquo;</a>
			</c:if>
		</div>
	</div>
<%@ include file="./Footer.jsp" %>
</body>
</html>