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
	#write_box {
		width:80%;
		font-family: 'Noto Sans KR', sans-serif;
 		text-align:center;
		margin:0 auto;
		margin-top: 100px;
		border:1px solid lightgray;
		border-radius : 5px;
		padding: 20px;
	}
	#write_box img{
		width:35px;
		height:35px;
	}
	textarea, input {
		vertical-align: middle;
	}
	textarea {
		border:none;
		background:#fff;
		width:98%;
		min-height: 500px;
		resize: none;
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
	.cate{
		padding-top: 10px;
		padding-bottom: 10px;
		text-align:left;
	}
	select{
	    width: 200px;
   		height: 40px;
    	border-color: lightgray;
	}
	.title1 {
		text-align:left;
		font-weight: bold;
		font-size: 23px;
		margin-bottom: 10px;
		border: 1px solid lightgray;
		line-height:12px;
	}
	.title1 input {
		width:100%;
		padding: 11px 12px 10px;
		height:45px;
	}
	.content {
		min-height: 500px;
		border: 1px solid lightgray;
	}
	.myButton {
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
		margin-top:10px;
	}
	.myButton:hover {
		background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
		background-color:#dfdfdf;
	}
	.myButton:active {
		position:relative;
		top:1px;
	}
</style>
</head>
<body>
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
<%@ include file="Navi.jsp" %>

	<div id="write_box">
	<h3>자유 게시판 글쓰기 <img src="https://img.icons8.com/?size=512&id=47749&format=png"></h3>

		<form id="write_board" action="./FreeBoardWrite" method="post" onsubmit="return formCheck(this)">
			<input type="hidden" name="id" value="${sessionScope.UserId }">
			<input type="hidden" name="nickName" value="${sessionScope.UserNickName }">
			<div class="cate">
				<select name="category">
					<option value="산">산</option>
					<option value="맛집">맛집</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div class="title1">
				<input id="wtitle" type="text" name="title" placeholder="제목을 입력해주세요.">
			</div>
			<div class="content">
				<textarea id="wcontent" name="content" placeholder="내용을 입력하세요."></textarea>
			</div>
			<div class="btnDiv">
				<button type="submit" class="myButton">등록하기</button>
				<button type="reset" class="myButton">다시입력</button>
				<button type="button" class="myButton" onclick="location.href='./FreeBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
			</div>
		</form>
	</div>
<%@ include file="./Footer.jsp" %>
</body>
</html>