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
   <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <link rel="stylesheet" href="./css/MateBoard.css">
   <script src="./js/BoardList.js"></script>
</head>
<body>
<%@ include file="Navi.jsp" %>
   	<div style="width: 100%; position: relative;">
        <img style="opacity: 0.7;" src="https://source.unsplash.com/random/?valley" width="100%" height="560px" alt="">
        <div style="position: absolute; top: 300px; left: 0; right: 0;">
            <h1 class="menuTitle">MATE BOARD</h1>
        </div>
    </div>
	<div id="all" style="width: 60%; margin: 0 auto; margin-top: 85px;">
		<form id="search_form">
			<table class="topTable">
				<tr>
					<td style="width:15%;">
						<input type="checkbox" id="joinCheck" name="joinCheck" value="0" ${param.joinCheck eq '0'? "checked" : "" } onclick="joinChk()">
						<label for="joinCheck" style="font-size:5px; position:relative; top:-1.5px;">참가가능만 보기</label>
					</td>
					<td style="width:15%;">
						<select id="sortField" name="sortField"  onchange="orders(this.value)">
							<option value="postDateDESC" ${param.sortField eq 'postDate DESC'? "selected" : "" }>최신순</option>
							<option value="postDate" ${param.sortField eq 'postDate'? "selected" : "" }>작성일자순</option>
							<option value="title" ${param.sortField eq 'title'? "selected" : "" }>제목순</option>
						</select>
					</td>
					<td>
						<select id="searchField" name="searchField">
							<option value="title" ${param.searchField eq 'title'? "selected" : "" }>제목</option>
							<option value="content" ${param.searchField eq 'content'? "selected" : "" } >내용</option>
							<option value="m_name" ${param.searchField eq 'm_name'? "selected" : "" } >산이름</option>
							<option value="nickName" ${param.searchField eq 'nickName'? "selected" : "" }>작성자</option>
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
					<tr class="zero"><td colspan="8">등록 된 게시물이 없습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardLists }" var="b">
						<tr style="border-top:1px solid darkgray">
							<td width="4%">${b.mate_num }.</td>
							<td width="10%">${b.m_name }</td>
							<td rowspan="2" style="font-size:18px; height:55px;"><a class="link" href='./MateBoardView${ph.sc.getQueryString(ph.sc.page) }&num=${b.mate_num }&nickName=${b.nickName }'>${b.title }</a></td>
							<fmt:formatDate value="${today }" type="date" pattern="yyyy-MM-dd" var="now"/>
							<fmt:formatDate value="${b.postDate }" type="date" pattern="yyyy-MM-dd" var="post"/>
							
							<c:choose>
								<c:when test="${now eq post }">
									<td colspan="4"><fmt:formatDate value="${b.postDate }" type="time" pattern="HH:mm" /></td>
									<td rowspan="2" width="1%"><i class="fa-solid fa-users" style="color:${b.joinCheck eq 0? "green" : "red"};"></i></td>
								</c:when>
								<c:otherwise>
									<td colspan="4">${post }</td>
									<td rowspan="2" width="1%"><i class="fa-solid fa-users" style="color:${b.joinCheck eq 0? "green" : "red"};"></i></td>
								</c:otherwise>
							</c:choose>

						</tr>
						<tr class="last">
							<td width="3%"><img style="width:50%;" src="https://img.icons8.com/?size=512&id=12438&format=png"></td>
							<td width="3%" class="subTd" style="cursor:pointer; position:relative;">
								${b.nickName }
								<div class="subMenu">
									<ul>
										<li><a href="./yourpage?id=${b.id}">프로필</a></li>
										<li><a href="./noteWrite?recipients=${b.nickName }">쪽지보내기</a></li>
									</ul>
								</div>
							</td>
							
							<td width="3%"><img style="width:70%;" src="https://img.icons8.com/?size=512&id=lJUgtSWOeJR9&format=png"></td>
							<td width="3%">${b.viewCount }</td>
							<td width="3%"><img style="width:67%;" src="https://img.icons8.com/?size=512&id=38977&format=png"></td>
							<td width="3%">${b.commentCount }</td>
						</tr>					
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<table class="bottomTable">
			<tr>
				<td colspan="7" class="write-btn">
					<button class="bttn" onclick="location.href='./MateBoardWrite${ph.sc.getQueryString(ph.sc.page) }'"><i class="fa-solid fa-pen i-con"></i>글쓰기</button>
				</td>
			</tr>
		</table>
		
		<table class="myTable" style="background-color: #f9f9f9;">
            <tr class="header">
                <th colspan="7" style="text-align: center; height:40px;" >
	        		<c:if test="${ph.showPrev }" >
	        			<a href ="<c:url value='/MateBoardList${ph.sc.getQueryString(ph.beginPage-1)}'/>" >&laquo;</a>
	       			</c:if>
	        		<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
						<c:choose>
							<c:when test="${not empty sortField}" >
								<a class='${ph.sc.page==i? "check" : "" }' href="<c:url value='./MateBoardList${ph.sc.getQueryString(i) }${not empty joinCheck? "&joinCheck=0" : "" }&sortField=${sortField }' />">${i }</a>
							</c:when>
							<c:otherwise>
								<a class='${ph.sc.page==i? "check" : "" }' href="<c:url value='./MateBoardList${ph.sc.getQueryString(i) }${not empty joinCheck? "&joinCheck=0" : "" }' />">${i }</a>
							</c:otherwise>
						</c:choose>
	        		</c:forEach>
	        		<c:if test="${ph.showNext }" >
	        			<a href ="<c:url value='/MateBoardList${ph.sc.getQueryString(ph.endPage+1)}'/>" >&raquo;</a>
	        		</c:if>
	        	</th>
            </tr>
            
        </table>
        <form method="GET">
	        <table class="myTable" style="background-color: #f9f9f9;">
	            <tr class="header">
	              <th style="text-align: center; height:50px;">
	                <select name="searchField"> 
	                    <option value="title" ${param.searchField eq 'title'? "selected" : "" }>제목</option>
						<option value="content" ${param.searchField eq 'content'? "selected" : "" } >내용</option>
						<option value="category" ${param.searchField eq 'category'? "selected" : "" } >카테고리</option>
						<option value="id" ${param.searchField eq 'id'? "selected" : "" }>작성자</option> 
	                </select>
	                <div id="textSearch">
	                	<input type="text" name="searchWord" id="search" value="${empty param.searchWord ? '' : param.searchWord }">
	               		<button class="page_btn"  ><i class="fa-solid fa-magnifying-glass i-con" style="color: white;"></i></button>
	                </div>
	              </th>
	            </tr>
	        </table>
         </form>
		
		
	</div>

<div style="height: 1000px;"></div>

<%@ include file="./Footer.jsp" %>
</body>
<script>
	$(document).ready(function() {
		
		$(".subTd").on("click", function(e) {
			$(this).children(".subMenu").toggleClass('son');
		});

        $(document).mouseup(function (e){
            if($(".subTd").has(e.target).length==0) {
                $(".subMenu").removeClass('son');
            } 
        });
		
	});
</script>
</html>