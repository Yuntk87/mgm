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
    <link rel="stylesheet" href="./css/MateBoardView.css">
</head>
<body>
<%@ include file="Navi.jsp" %>
	<div id="view_box">
		<form name="writeFrm">
			<input type="hidden" id="num" name="num" value="${dto.mate_num }">
			<input type="hidden" id="id" name="id" value="${dto.id }">
			<input type="hidden" id="mNum" name="mNum" value="${dto.m_num }">
			
			<table>
				<tr>
					<th>번호</th>
					<td>${dto.mate_num }</td>
					<th>작성자</th>
					<td>${sessionScope.UserNickName }</td>
					<th>작성일</th>
					<fmt:formatDate value="${dto.postDate }" type="both" pattern="yyyy-MM-dd hh:mm" var="post"/>
					<td>${post }</td>
					<th>조회수</th>
					<td>${dto.viewCount }</td>
				</tr>
				<tr>
					<th>산이름</th>
					<td>${dto.m_name }</td>
					<th>예정일</th>
					<fmt:formatDate value="${dto.dDay }" type="both" pattern="yyyy-MM-dd hh:mm:ss" var="dDay"/>
					<td id="dDay">${dDay }</td>
					<th>제한인원</th>
					<td>${dto.mateLimit }</td>
					<th>현재 참가인원</th>
					<td id="cnt">${cnt }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="7" class="title" colspan="3"><input type="text" name="title" value="${dto.title }" disabled></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="7" height="100"><textarea type="text" name="content" disabled>${ dto.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="8" align="center">
					<c:choose>
						<c:when test="${sessionScope.UserId != null && sessionScope.UserId eq dto.id }">
							<button type="button" class="myButton" onclick="location.href='./MateBoardEdit${sc.getQueryString(param.page) }&num=${dto.mate_num }&mName=${dto.m_name }'">수정하기</button>
							<button type="button" class="myButton" onclick="deletePost()">삭제하기</button>
						</c:when>
						<c:when test="${mdto != null}">
							<button id="joinBtn" type="button" class="myButton" type="button" >참가취소</button>
						</c:when>
						<c:when test="${dto.mateLimit eq cnt}">
							<button id="joinBtn" type="button" class="myButton" type="button" disabled>참가불가</button>
						</c:when>
						<c:otherwise>
							<button id="joinBtn" type="button" class="myButton" type="button" >참가하기</button>
						</c:otherwise>
					</c:choose>
					<button type="button" class="myButton" onclick="location.href='./MateBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
					</td>
				</tr>
			</table>
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
			let mateNum = $('#num').val();
			let id = $('#id').val();
			let mNum = $('#mNum').val();
			let dDay = $('#dDay').text();
			$.ajax({
		        type:'POST',       // 요청 메서드
		        url: './MateJoin',
		        dataType : "json",
		        data : { mateNum:mateNum , id:id, mNum:mNum, dDay:dDay  } ,// 전달 데이터
		        success : function(data){ // 요청이 성공일 때 실행되는 이벤트
		        	let obj = data;
		        	let res = obj.result;
					$("#cnt").text(obj.cnt);
					if(res == "y") alert("참가신청 완료");
					if(res == "n") alert("참가신청 취소");
					if(res == "re") alert("예정일에 이미 참가일정이 있습니다. 일정을 확인 해 주세요");
		        	joinBtn(obj.result);
		        },
		        error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) } // 에러가 발생했을 때, 호출될 함수
		    }); // $.ajax()
		});
		
		
	});

</script>

</body>
</html>