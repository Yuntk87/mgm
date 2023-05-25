<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AskBoardWrite</title>
<style>
	#write_box {
		width:80%;
		font-family: 'Noto Sans KR', sans-serif;
 		text-align:center;
		margin:0 auto;
		margin-top: 150px;
		border:1px solid lightgray;
		border-radius : 5px;
		padding: 30px 20px 20px 20px;
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
		padding-top: 15px;
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
	.title1 {
		text-align:left;
		font-weight: bold;
		font-size: 23px;
		margin-bottom: 10px;
		border: 1px solid lightgray;
		line-height:12px;
	}
	.title1 input {
		width:96%;
		padding: 11px 12px 10px;
		height:45px;
	}
	.content {
		min-height: 500px;
		border: 1px solid lightgray;
		margin-bottom:20px;
	}
	.coButton {
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
	.coButton:hover {
		background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
		background-color:#dfdfdf;
	}
	.coButton:active {
		position:relative;
		top:1px;
	}
</style>
</head>
<body>
<%@ include file="Navi.jsp" %>
<script>
	function formCheck(frm) {
		change();
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
	function change(){
 		var str = $('#wcontent').val();
		str = str.replaceAll('\n', '<br/>');
		$('#wcontent').val(str);
	}
</script>
	<div id="write_box">
	<h3>문의하기</h3>

		<form id="write_board" action="./AskBoardWrite" method="post" onsubmit="return formCheck(this)">
			<input type="hidden" name="id" value="${sessionScope.UserId }">
			<input type="hidden" name="nickName" value="${sessionScope.UserNickName }">
			<div class="title1">
				<input id="wtitle" type="text" name="title" placeholder="제목을 입력해주세요.">
			</div>
			<div class="content">
				<textarea id="wcontent" name="content" placeholder="내용을 입력하세요."></textarea>
			</div>
			<div class="btnDiv">
				<button type="submit" class="coButton">등록하기</button>
				<button type="reset" class="coButton">다시입력</button>
				<button type="button" class="coButton" onclick="location.href='./AskBoardList?page=${empty param.page? '1' : param.page}&pageSize=${param.pageSize }&searchWord=${param.searchWord }&searchField=${param.searchField }'">목록보기</button>
			</div>
		</form>
	</div>

</body>
</html>