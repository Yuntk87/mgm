<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTE NAVI</title>
<link rel="stylesheet" href="./css/note.css">
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="noteNavi_box">
		<div class="sidenav">
			<a href="./noteList"><i class="fa-regular fa-envelope"></i> 쪽지함</a>
			<a href="./noteWrite"><i class="fa-regular fa-envelope"></i> 쪽지보내기</a>
			<a href="./noteList?mode=Recycle"><i class="fa-regular fa-trash-can"></i> 휴지통</a>
<!-- 			<a href="#clients">Clients</a> -->
		</div>
	</div>
</body>
</html>