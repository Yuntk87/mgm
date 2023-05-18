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
			<table colspan="7" class="topTable">
				<tr>
					<td>
						<select name="searchField">
							<option value="id" ${param.searchField eq 'id'? "selected" : "" }>작성자</option>
						</select>
						<div id="textSearch">
							<input type="text" name="searchWord" id="search" placeholder="검색" value="${not empty param.searchWord? param.searchWord : '' }" >
							<button class="btn" style="height: 38px;"><i class="fa-solid fa-magnifying-glass i-con"></i></button>
						</div>
					</td>
				</tr>		
			</table>
		</form>
		
		
		<table class="boardList">
			<c:choose>
				<c:when test="${empty boardLists }" >
					<tr><td colspan="">등록 된 게시물이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardLists }" var="c">
					<input type="hidden" name="num" value="${dto.cd_num }">
						<tr style="border-top:1px solid darkgray;">
							<td id="num" width="5%;" style="font-size:14px;">${c.cd_num }.</td>
							<td width="5%;"><img style="width:50%;" src="https://img.icons8.com/?size=512&id=12438&format=png"></td>
							<td width="15%" style="text-align:left; font-size:15px; cursor:pointer;" onClick="location.href='/mgm1/yourpage?id=${dto.id}'">${c.id }</td>
							<td width="15%;"style="font-size:15px;">${c.m_num }</td>
							<fmt:formatDate value="${today }" type="date" pattern="yyyy-MM-dd" var="now"/>
							<fmt:formatDate value="${c.postDate }" type="date" pattern="yyyy-MM-dd" var="post"/>
							<c:choose>
								<c:when test="${now eq post }">
									<td style="font-size:15px; text-align:right;"><fmt:formatDate value="${c.postDate }" type="time" pattern="HH:mm" /></td>
								</c:when>
								<c:otherwise>
									<td style="font-size:15px; text-align:right;">${post }</td>
								</c:otherwise>
							</c:choose>
							<td width="20%" class="del-btn">
								<button type="button" class="bttn" onclick="location.href='./ConfirmBoardDelete?num=${c.cd_num }'"><span id="delete">삭제하기</span></button>
							</td>
						</tr>
					</c:forEach>
						<tr class="page_bar">
							<td colspan="7">
								<c:if test="${ph.showPrev }">
									<a href="<c:url value='/admin${ph.sc.getQueryString(ph.beginPage-1) }' />">&laquo;</a>
								</c:if>
								<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
									<a class='${ph.sc.page==i? "check" : "" }' href="<c:url value='/admin${ph.sc.getQueryString(i) }' />">${i }</a>
								</c:forEach>
								<c:if test="${ph.showNext }">
									<a href="<c:url value='/admin${ph.sc.getQueryString(ph.endPage+1) }' />">&raquo;</a>
								</c:if>
							</td>
						</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<script>
	  function deletePost() {
			var confirmed = confirm("정말 삭제하시겠습니까?");
			if(confirmed) {
				${c.cd_num }
				this.method = "post"
				this.action = "./ConfirmBoardDelete";
			}
		}
	</script>

</body>
</html>