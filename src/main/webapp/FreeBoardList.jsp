<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FreeBoard</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="./css/FreeBoardList.css?v=1">
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
<%@ include file="Navi.jsp" %>
   	<div style="width: 100%; position: relative;">
        <img style="opacity: 0.7;" src="https://source.unsplash.com/random/?valley" width="100%" height="560px" alt="">
        <div style="position: absolute; top: 300px; left: 0; right: 0;">
            <h1 class="menuTitle">FREE BOARD</h1>
        </div>
    </div>
	<div id="all" style="width: 60%; margin: 0 auto; margin-top: 85px;">
		
		<form id="search_form">
			<table colspan="7" class="topTable">
				<tr>
					<td>
						<select name="searchField">
							<option value="title" ${param.searchField eq 'title'? "selected" : "" }>제목</option>
							<option value="content" ${param.searchField eq 'content'? "selected" : "" } >내용</option>
							<option value="category" ${param.searchField eq 'category'? "selected" : "" } >카테고리</option>
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
					<tr id="zero"><td colspan="">등록 된 게시물이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardLists }" var="b">
						<tr style="border-top:1px solid darkgray;">
							<td width="4%;">${b.fbnum }.</td>
							<td width="10%;">${b.category }</td>
							<td rowspan="2" style="font-size:18px; height:55px;"><a class="link" href='./FreeBoardView${ph.sc.getQueryString(ph.sc.page) }&num=${b.fbnum }'>${b.title }</a></td>
							<fmt:formatDate value="${today }" type="date" pattern="yyyy-MM-dd" var="now"/>
							<fmt:formatDate value="${b.postDate }" type="date" pattern="yyyy-MM-dd" var="post"/>
							<c:choose>
								<c:when test="${now eq post }">
									<td colspan="4"><fmt:formatDate value="${b.postDate }" type="time" pattern="HH:mm" /></td>
								</c:when>
								<c:otherwise>
									<td colspan="4">${post }</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr class="last">
							<td width="3%;"><img style="width:50%;" src="https://img.icons8.com/?size=512&id=12438&format=png"></td>
							<td width="3%" style="cursor:pointer;" onClick="location.href='./yourpage?id=${b.id}'">${b.nickName }</td>
							<td width="3%"><img style="width:70%;" src="https://img.icons8.com/?size=512&id=lJUgtSWOeJR9&format=png"></td>
							<td width="3%;">${b.viewCount }</td>
							<td width="3%;"><img style="width:67%;" src="https://img.icons8.com/?size=512&id=38977&format=png"></td>
							<td width="3%;">${b.c_count }</td>
						</tr>
					</c:forEach>
						<tr class="page_bar">
							<td colspan="7">
								<c:if test="${ph.showPrev }">
									<a href="<c:url value='/FreeBoardList${ph.sc.getQueryString(ph.beginPage-1) }' />">&laquo;</a>
								</c:if>
								<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
									<a class='${ph.sc.page==i? "check" : "" }' href="<c:url value='/FreeBoardList${ph.sc.getQueryString(i) }' />">${i }</a>
								</c:forEach>
								<c:if test="${ph.showNext }">
									<a href="<c:url value='/FreeBoardList${ph.sc.getQueryString(ph.endPage+1) }' />">&raquo;</a>
								</c:if>
							</td>
						</tr>
				</c:otherwise>
			</c:choose>
		</table>
		
		<table class="bottomTable">
			<tr>
				<td colspan="7" class="write-btn">
					<button class="bttn" onclick="location.href='./FreeBoardWrite${ph.sc.getQueryString(ph.sc.page) }'"><span id="goWrite"><i class="fa-solid fa-pen i-con"></i>글쓰기</span></button>
				</td>
			</tr>
		</table>
	</div>
	<script>
	  $(".boardList tr").hover(function(){
	        $(this).addClass("one")
	        if($(this).hasClass("last"))
	       	 	$(this).prev().addClass("one")
	        else
	       	 	$(this).next().addClass("one")
	       	 	
			if($(this).hasClass("page_bar"))
	       	 	$(this).removeClass("one")
	       	 	
	       	if($(this).hasClass("zero"))
				$(this).removeClass("one")
	    }, function(){
	    	 $(this).removeClass("one")
	        if($(this).hasClass("last"))
	       	 	$(this).prev().removeClass("one")
	        else
	       	 	$(this).next().removeClass("one")	    	  

	  });
	  
	</script>

<div style="height: 400px;"></div>

<%@ include file="./Footer.jsp" %>
</body>
</html>