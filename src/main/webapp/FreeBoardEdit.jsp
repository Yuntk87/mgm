
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FreeBoardEdit</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#edit_box {
		width:80%;
		font-family: 'Noto Sans KR', sans-serif;
 		text-align:center;
		margin:0 auto;
		margin-top: 100px;
		border:1px solid lightgray;
		border-radius : 5px;
		padding: 20px;
	}
	textarea, input {
		vertical-align: middle;
	}
	textarea {
		border:none;
		background:#fff;
		width:98%;
		min-height: 500px;
		resize:none;
		padding:20px 0;
	}
	input {
		margin-left:5px;
		border:none;
		left:0;
		background:#fff;
	}
	input:focus {
		outline:none;
	}
	textarea:focus{
		outline:none;
	}
	select:focus{
		outline:none;
	}
	.title1 {
		text-align:left;
		margin-bottom: 10px;
		border: 1px solid lightgray;
	}
	.title1 input {
		width:96%;
		padding: 11px 12px 10px;
		height:45px;
	}
	.nickName {
		font-size: 20px;
		color:black;
	}
	.lv {
		color:black;
		font-size:12px;
	}
	.days {
		color: #999;
		font-size: 12px;
	}
	.boardTop {
		display: flex;
		justify-content: space-between;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.boardTop span {
		margin-right: 10px;
	}
	.boardTop img{
		width:40px;
		height:40px;
	}
	select{
	    width: 200px;
   		height: 40px;
    	border-color: lightgray;
	}
	.content {
		min-height: 500px;
		border: 1px solid lightgray;
		margin-bottom:20px;
	}
	.boButton {
		box-shadow:inset 0px 1px 0px 0px #ffffff;
		background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
		background-color:#ededed;
		border-radius:6px;
		border:1px solid #dcdcdc;
		display:inline-block;
		cursor:pointer;
		color:#777777;
		font-family:Arial;
		font-size:12px;
		font-weight:bold;
		padding:5px 10px;
		margin-right: 2px;
	}
	.boButton:hover {
		background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
		background-color:#dfdfdf;
	}
	.boButton:active {
		position:relative;
		top:1px;
	}
</style>
</head>
<body>
<%@ include file="Navi.jsp" %>
<script>
	function formCheck(frm) {
		if(frm.title.value.trim() == "") {
			alert("제목을 입력하세요.");
			frm.title.focus();
			return false;
		}
		if(frm.content.value.trim() == "") {
			alert("내용을 입력하세요.");
			frm.content.focus();
			return false;
		}
		return true;
	}

</script>

	<div id="edit_box">		
		<h3>자유게시판 수정하기</h3>
		<form name="editFrm" action="./FreeBoardEdit" method="post" onsubmit="return formCheck(this)">
			<input type="hidden" name="num" value="${dto.fbnum }">
			<div class="boardTop">
				<div class="cate">
					<select name="category">
							<option value="산" ${dto.category=='산'? 'selected' : '' }>산</option>
							<option value="맛집" ${dto.category=='맛집'? 'selected' : '' }>맛집</option>
							<option value="기타" ${dto.category=='기타'? 'selected' : '' }>기타</option>
					</select>
				</div>
				<div class="profile1">
						<span class="nickName" style="cursor:pointer;" onClick="location.href='/mgm1/yourpage?id=${dto.id}'">${dto.id }</span>
						<span class="lv">Lv.${udto.level }</span>
						<fmt:formatDate value="${dto.postDate }" type="both" pattern="yyyy-MM-dd hh:mm" var="post"/>
						<span class="days">${post } &nbsp;&nbsp; 조회 : &nbsp;${dto.viewCount }</span>
				</div>
				
			</div>
			<div class="title1">
				<input type="text" name="title" value="${dto.title }">
			</div>
			
			<div class="content">
				<textarea type="text" name="content">${ dto.content}</textarea>
			</div>
			<div class="btnDiv">
				<button type="button" class="boButton" onclick="editPost()">작성완료</button>
				<button type="reset" class="boButton">다시입력</button>
				<button type="button" class="boButton" onclick="location.href='./FreeBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
			</div>
		</form>
	</div>
<%@ include file="./Footer.jsp" %>
<script>
	function editPost() {
		var confirmed = confirm("게시글을 수정하시겠습니까?");
		if(confirmed) {
			var form = document.editFrm;
			form.method = "post"
			form.action = "./FreeBoardEdit";
			if(formCheck(form)) {
				form.submit();	
			}
		}
	}
</script>
</body>
</html>