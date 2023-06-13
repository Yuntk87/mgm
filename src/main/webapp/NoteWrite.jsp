<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTE WRITE</title>
<link rel="stylesheet" href="./css/note.css">
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="./Navi.jsp" %>
<%@ include file="./NoteNavi.jsp" %>
	<div id="noteWrite_box">
		<div class="noteList">
		<h2><i class="fa-regular fa-envelope"></i> 쪽지 보내기</h2>
			<form id="noteWrt" action="./noteWrite" method="post">
				<table>
					<tr>
						<th>받는사람</th>
						<td><input type="text" name="recipients" value="${recipients }"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">전송 <i class="fa-solid fa-arrow-right"></i></button><button type="reset">다시작성 <i class="fa-solid fa-rotate-right"></i></button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>