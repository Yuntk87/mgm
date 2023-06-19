<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AskBoardList</title>
<link rel="stylesheet" href="./css/AskBoardList.css">
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<%@ include file="Navi.jsp" %>
    <h2>Q&A</h2>
	<div id="all" style="width: 65%; margin: 0 auto; margin-top:70px;">
		
		<form id="search_form">
			<div class="topTable" <c:if test="${sessionScope.UserId != null && sessionScope.UserId != 'admin'}"> style="display:block;" </c:if>>
				<c:if test="${sessionScope.UserId != null && sessionScope.UserId eq 'admin'}">
					<div class="sh">
						<select name="searchField">
							<option value="title" ${param.searchField eq 'title'? "selected" : "" }>제목</option>
							<option value="id" ${param.searchField eq 'id'? "selected" : "" }>작성자</option>
						</select>
						<div id="textSearch">
							<input type="text" name="searchWord" id="search" placeholder="검색" value="${not empty param.searchWord? param.searchWord : '' }" >
							<button class="btn"><i class="fa-solid fa-magnifying-glass i-con"></i></button>
						</div>
					</div>
				</c:if>
				<select id="rep" name="rep">
					<option value="">--선택--</option>
					<option value="wait">답변대기</option>
					<option value="complete">답변완료</option>
				</select>
			</div>
		</form>
		<div class="boardList">
				<!-- <tr>
					<th width="5%">번호</th>
					<th width="10%">카테고리</th>
					<th width="50%">제목</th>
					<th width="10%">작성자</th>
					<th width="10%">조회수</th>
					<th width="10%">댓글수</th>
					<th width="25%">등록날짜</th>
				</tr> -->
				<c:choose>
					<c:when test="${empty boardLists }" >
						<div>등록 된 게시물이 없습니다.</div>
						<c:if test="${sessionScope.UserId != null && sessionScope.UserId != 'admin'}">
							<div class="write-btn">
								<button class="wrBttn" type="button" onclick="location.href='./AskBoardWrite${ph.sc.getQueryString(ph.sc.page) }'">문의하기</button>
							</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<div id="T">
							<div class="ask">답변상태</div>
							<div class="new"></div>
							<div class="tt" style="text-align:center;">제목</div>
							<div class="writer">작성자</div>
							<div class="askdate">작성일</div>
							<div class="del">삭제</div>
						</div>
						<div id="M">
							<c:forEach items="${boardLists }" var="b">
							<div <c:if test="${b.a_count eq 0 }"> class="no" </c:if> <c:if test="${b.a_count != 0 }"> class="yes" </c:if>>
								<input type="hidden" name="num" value="${b.ask_num }">
								<input type="hidden" name="num" value="${b.id }">
									<div class="me">
										<c:choose>
											<c:when test="${b.a_count eq 0 }">
												<div class="ask">답변대기</div>
											</c:when>
											<c:otherwise>
												<div class="ask">답변완료</div>
											</c:otherwise>
										</c:choose>
										<fmt:formatDate value="${b.postDate }" type="time" pattern="yyyy-MM-dd" var="post"/>
										<fmt:formatDate value="${today }" type="date" pattern="yyyy-MM-dd" var="now"/>
										<c:choose>
											<c:when test="${now eq post }">
												<div class="new"><img width="100%" style="margin-top:3px;" src="./img/new.png"></div>
											</c:when>
											<c:otherwise>
												<div class="new"></div>
											</c:otherwise>
										</c:choose>
										<div class="tt"><a href="#" class="tit" id ="${b.ask_num }" >${b.title }</a></div>
										<div class="writer">${b.nickName }</div>
										
										<div class="askdate">${post }</div>
										<div class="del"><button class="deel" type="button" onclick="deletePost('./AskBoardDelete?num=${b.ask_num }')">삭제하기</button></div>
									</div>
									<div class="reply" id="reply${ b.ask_num}">
										<div class="askcon">
										<p>${b.content }</p>
											<c:if test="${sessionScope.UserId != null && sessionScope.UserId eq 'admin'}">
												<div class="write-btn">
													<button class="reBttn" type="button" onclick="location.href='./AskCommentWrite?ask_num=${b.ask_num}'">답변하기</button>
												</div>
											</c:if>
										</div>
										<div class="commentAll">
											<div class="lists"id="commentList${b.ask_num }"></div>
										</div>
									</div>
							</div>
							</c:forEach>
						</div>
						<c:if test="${sessionScope.UserId != null && sessionScope.UserId != 'admin'}">
							<div class="write-btn">
								<button class="wrBttn" type="button" onclick="location.href='./AskBoardWrite${ph.sc.getQueryString(ph.sc.page) }'">문의하기</button>
							</div>
						</c:if>
						<div id="pg">
							<p>
								<c:if test="${ph.showPrev }">
									<a href="<c:url value='/AskBoardList${ph.sc.getQueryString(ph.beginPage-1) }' />">&laquo;</a>
								</c:if>
								<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
									<a class='${ph.sc.page==i? "check" : "" }' href="<c:url value='/AskBoardList${ph.sc.getQueryString(i) }' />">${i }</a>
								</c:forEach>
								<c:if test="${ph.showNext }">
									<a href="<c:url value='/AskBoardList${ph.sc.getQueryString(ph.endPage+1) }' />">&raquo;</a>
								</c:if>
							</p>
						</div>
					</c:otherwise>
				</c:choose>
		</div>
	</div>
	<script>
	function deletePost(url) {
		var confirmed = confirm("정말 삭제하시겠습니까?");
		if(confirmed) {
			location.replace(url);
		}
	}
	
	$(document).ready(function(){
		$("#rep").change(function(){
			var result = $("#rep option:selected").val();
			if(result == 'wait'){
				$('.yes').hide();
				$('.no').show();
			}else if(result == 'complete'){
				$('.no').hide();
				$('.yes').show();
			}else{
				$('.no').show();
				$('.yes').show();
			}
		});
	});
	
	$(".tit").click(function(event){
		let tmp = event.target.id;
		console.log(tmp)
		$("#reply"+tmp).toggleClass("one")
		showList(tmp)
		
	});
	
	

	let showList=function(ask_num) {
		//let comment = $('input[name=comment]').val("");
		$.ajax({
			type:'GET',
			url:'./AskComment?ask_num='+ask_num,
			contentType: "application/json; charset=utf-8",
			success:function(result) {
				$("#commentList"+ask_num).html(toHtml(result));
			},
			error:function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
			}
		});
	}
		
	$(document).ready(function() {
		//showList(ask_num);
		//삭제
		$(".lists").on("click", ".delBtn", function() {
			console.log("__________")
			let ac_num = $(this).parent().parent().attr('data-ac_num');
			let ask_num = $(this).parent().parent().attr('data-ask_num');
			console.log(ask_num)
			$.ajax({
				type:'GET',
				url: './AskComment?ac_num=' + ac_num + '&ask_num=' + ask_num + "&mode=del",
				success : function(result) {
					showList(ask_num);
				},
				error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) }
			});
		});
		
		//수정
		$(".lists").on("click", ".modBtnb", function() {
			let ac_num = $(this).parent().parent().attr('data-ac_num');
			let ask_num = $(this).parent().parent().attr('data-ask_num');
			console.log(ac_num)
			
			location.href ='./AskCommentEdit?ac_num=' + ac_num;
		}); 
		
	}); //ready
	
	let toHtml = function(comments){
		let tmp = "<div class=clist>";
		comments.forEach(function(comment) {
			tmp += '<div data-ac_num=' + comment.ac_num
			tmp += ' data-ask_num=' + comment.ask_num + '>'
			tmp += '<div class="comTop" style="margin-top:20px;"><span class="commenter"> 담당자 : ' + comment.commenter + '</span>'
			tmp += '<span class="c_postDate"> ' + comment.c_postDate + '</span></div>'
			tmp += '<div class="comment"> ' + comment.comment + '</div>'
			if(comment.commenter == "${sessionScope.UserId}" || "admin" == ("${sessionScope.UserId}")) {
				tmp += '<div class="commentButton"><button class="modBtnb">수정</button>'
				tmp += '<button class="delBtn">삭제</button></div>'
			}
			tmp += '</div>'
		})
		return tmp + '</div>';
	}
	</script>
</body>
</html>