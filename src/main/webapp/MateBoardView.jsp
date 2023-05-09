<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MateBoardView</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
		<h2>메이트 게시판 - 상세보기</h2>
		<form name="writeFrm">
			<input type="hidden" name="num" value="${dto.mate_num }">
			
			<table border="1" width="100%">
				<tr>
					<td>번호</td>
					<td id="mateNum">${dto.mate_num }</td>
					<td>작성자</td>
					<td id="id">${dto.id }</td>
				</tr>
				<tr>
					<td>작성일</td>
					<fmt:formatDate value="${dto.postDate }" type="both" pattern="yyyy-MM-dd hh:mm" var="post"/>
					<td>${post }</td>
					
					<td>조회수</td>
					<td>${dto.viewCount }</td>
				</tr>
				<tr>
					<td>산이름</td>
					<td id="mNum">${dto.m_num }</td>
					<td>${dto.m_name }</td>
					<td>예정일</td>
					<fmt:formatDate value="${dto.dDay }" type="both" pattern="yyyy-MM-dd hh:mm:ss" var="dDay"/>
					<td id="dDay">${dDay }</td>
					<td>인원</td>
					<td>${dto.mateLimit } / ${cnt }</td>
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
					<c:choose>
						<c:when test="${sessionScope.UserId != null && sessionScope.UserId eq dto.id }">
							<button type="button" onclick="location.href='./MateBoardEdit${sc.getQueryString(param.page) }&num=${dto.mate_num }&mName=${dto.m_name }'">수정하기</button>
							<button type="button" onclick="deletePost()">삭제하기</button>
						</c:when>
						<c:when test="${mdto != null}">
							<button id="joinBtn" type="button" type="button" >참가취소</button>
						</c:when>
						<c:when test="${dto.mateLimit eq cnt}">
							<button id="joinBtn" type="button" type="button" disabled>참가불가</button>
						</c:when>
						<c:otherwise>
							<button id="joinBtn" type="button" type="button" >참가하기</button>
						</c:otherwise>
					</c:choose>
					<button type="button" onclick="location.href='./MateBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
					</td>
				</tr>
			</table>
			<div>
				<c:forEach items="${mList }" var="m">
					${m }
				</c:forEach>
			</div>
				
		</form>
		<%@ include file="./MateBoardComment.jsp" %>
	</div>
<%@ include file="./Footer.jsp" %>
<script>
	function deletePost() {
		var confirmed = confirm("정말 삭제하시겠습니까?");
		if(confirmed) {
			var form = document.writeFrm;
			form.method = "post"
			form.action = "./MateBoardDelete";
			form.submit();
		}
	}

	let joinBtn = function(res){
		let tmp = "";
		if(res == "y") {
			console.log("참가신청 완료");
			$("#joinBtn").text("참가취소");
		} else {
			console.log("참가취소");
			$("#joinBtn").text("참가하기");
		}
		return tmp;
	}
	
	
	$(document).ready(function() {
		//등록
		$("#joinBtn").click(function() {
			let mateNum = $('#mateNum').text();
			let id = $('#id').text();
			let mNum = $('#mNum').text();
			let dDay = $('#dDay').text();
			$.ajax({
		        type:'POST',       // 요청 메서드
		        url: './MateJoin',
		        dataType : "text",
		        data : { mateNum:mateNum , id:id, mNum:mNum, dDay:dDay  } ,// 전달 데이터
		        success : function(result){ // 요청이 성공일 때 실행되는 이벤트
		        	const res = $.trim(result);
		        	if(res == "y") alert("참가신청 완료");
		        	if(res == "n") alert("참가신청 취소");
		        	if(res == "re") alert("예정일에 이미 참가일정이 있습니다. 일정을 확인 해 주세요");
		        	joinBtn(res);
		        },
		        error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) } // 에러가 발생했을 때, 호출될 함수
		    }); // $.ajax()
		});
	});

</script>

</body>
</html>