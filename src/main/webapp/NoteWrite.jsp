<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="note_box">
		<form id="noteWrt" action="./noteWrite" method="post">
			<input type="text" name="recipients" value="qwer" readonly>받는사람
			<textarea name="content"></textarea>
			<button type="submit">전송</button><button type="reset">다시작성</button>
		</form>
	</div>
	<a href="./noteList">쪽지함</a>
</body>
</html>