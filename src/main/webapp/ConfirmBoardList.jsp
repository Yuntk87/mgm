<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConfirmBoardList</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="./css/ConfirmBoardList.css?v=1">
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
	<div id="all" style="width: 60%; margin: 0 auto; margin-top: 85px;">
		
		<form id="search_form">
			<select name="searchField">
				<option value="id" ${param.searchField eq 'id'? "selected" : "" }>아이디</option>
			</select>
			<div id="textSearch">
				<input type="text" name="searchWord" id="search" placeholder="검색" value="${not empty param.searchWord? param.searchWord : '' }" >
				<button class="btn" style="height: 38px;"><i class="fa-solid fa-magnifying-glass i-con"></i></button>
			</div>
		</form>
		
		
		<table class="boardList">
			<tr>
			    <th style="background-color:#fafafa; text-align:center;">번호</th>
			    <th style="background-color:#fafafa; text-align:center;">아이디</th>
			    <th style="background-color:#fafafa; text-align:center;">산 번호</th>
			    <th style="background-color:#fafafa; text-align:center;">산 이름</th>
			    <th style="background-color:#fafafa; text-align:center;">등록일자</th>
			    <th style="background-color:#fafafa; text-align:center;">삭제</th>
		    </tr>
			<c:choose>
				<c:when test="${empty boardLists }" >
					<tr><td colspan="">등록 된 게시물이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardLists }" var="c">
					<input type="hidden" name="num" value="${dto.cd_num }">
						<tr>
							<td>${c.cd_num }.</td>
							<td>${c.id }</td>
							<td>${c.m_num }</td>
							<td>${c.m_name }</td>
							<fmt:formatDate value="${today }" type="date" pattern="yyyy-MM-dd" var="now"/>
							<fmt:formatDate value="${c.postDate }" type="date" pattern="yyyy-MM-dd" var="post"/>
							<c:choose>
								<c:when test="${now eq post }">
									<td><fmt:formatDate value="${c.postDate }" type="time" pattern="HH:mm" /></td>
								</c:when>
								<c:otherwise>
									<td>${post }</td>
								</c:otherwise>
							</c:choose>
							<td>
								<a href="./ConfirmBoardDelete?num=${c.cd_num }" onclick="return confirm('정말 삭제하시겠습니까?');">삭제하기</a>
							</td>
						</tr>
						</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<div id="pg">
			<c:if test="${ph.showPrev }">
				<a href="<c:url value='/admin${ph.sc.getQueryString(ph.beginPage-1) }' />">&laquo;</a>
			</c:if>
			<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
				<a class='${ph.sc.page==i? "check" : "" }' href="<c:url value='/admin${ph.sc.getQueryString(i) }' />">${i }</a>
			</c:forEach>
			<c:if test="${ph.showNext }">
				<a href="<c:url value='/admin${ph.sc.getQueryString(ph.endPage+1) }' />">&raquo;</a>
			</c:if>
		</div>
	</div>

</body>
</html>