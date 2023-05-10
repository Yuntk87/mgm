<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MateBoard</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="./FreeBoard.css">
</head>
<body>
<%@ include file="Navi.jsp" %>

	<div style="width: 60%; margin: 0 auto; margin-top: 60px">
		<h2>메이트 게시판</h2>
		<form id="search_form">
			<table colspan="7" class="table table-dark">
				<tr>
					<td>
						<select name="searchField">
							<option value="title" ${param.searchField eq 'title'? "selected" : "" }>제목</option>
							<option value="content" ${param.searchField eq 'content'? "selected" : "" } >내용</option>
							<option value="m_name" ${param.searchField eq 'category'? "selected" : "" } >산이름</option>
							<option value="id" ${param.searchField eq 'id'? "selected" : "" }>작성자</option>
						</select>
						<input type="text" name="searchWord" id="search" value="${not empty param.searchWord? param.searchWord : '' }" >
						<button class="btn btn-light" style="height: 35px;"><i class="fa-solid fa-magnifying-glass i-con"></i>검색</button>
					</td>
				</tr>		
			</table>
		</form>
		
		
		<table class="boardList">
			<tr>
				<th width="5%">번호</th>
				<th width="10%">산이름</th>
				<th width="50%">제목</th>
				<th width="10%">작성자</th>
				<th width="10%">조회수</th>
				<th width="10%">댓글수</th>
				<th width="25%">등록날짜</th>
			</tr>
			<c:choose>
				<c:when test="${empty boardLists }" >
					<tr><td colspan="7">등록 된 게시물이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardLists }" var="b">
						<tr>
							<td>${b.mate_num }</td>
							<td>${b.m_name }</td>
							<td><a href='./MateBoardView${ph.sc.getQueryString(ph.sc.page) }&num=${b.mate_num }'>${b.title }</a></td>
							<td>${b.id }</td>
							<td>${b.viewCount }</td>
							<td>${b.commentCount }</td>
							
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
						<tr>
							<td colspan="7">
								<c:if test="${ph.showPrev }">
									<a href="<c:url value='/MateBoardList${ph.sc.getQueryString(ph.beginPage-1) }' />">&laquo;</a>
								</c:if>
								<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
									<a class='${ph.sc.page==i? "check" : "" }' href="<c:url value='/MateBoardList${ph.sc.getQueryString(i) }' />">${i }</a>
								</c:forEach>
								<c:if test="${ph.showNext }">
									<a href="<c:url value='/MateBoardList${ph.sc.getQueryString(ph.endPage+1) }' />">&raquo;</a>
								</c:if>
							</td>
						</tr>
				</c:otherwise>
			</c:choose>
		</table>
		
		<table class="table table-dark">
			<tr>
				<td colspan="7" class="write-btn">
					<button class="rbttn" onclick="location.href='./MateBoardWrite${ph.sc.getQueryString(ph.sc.page) }'"><span><i class="fa-solid fa-pen i-con"></i>글쓰기</span></button>
				</td>
			</tr>
		</table>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@ include file="./Footer.jsp" %>
</body>
</html>