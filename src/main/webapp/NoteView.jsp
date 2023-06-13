<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note View</title>
<link rel="stylesheet" href="./css/note.css">
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="./Navi.jsp" %>
<%@ include file="./NoteNavi.jsp" %>
	<div id="noteView_box">
		<div class="noteList">
		<h2><i class="fa-regular fa-envelope"></i> 쪽지 읽기</h2>
			<table>
				<tr>
					<th width="3%">${dto.note_num }</th>
					<th width="10%">보낸사람 : </th>
					<td width="40%">${dto.senders }</td>
					<th width="10%">날짜 : </th>
					<td width="25%">${dto.sendDate }</td>
				</tr>
				<tr>
					<td class="noteViewCon" colspan="5" style="text-align: left;">${dto.content }</td>
				</tr>
				<tr>
					<td colspan="5" style="text-align:center;">
						<button type="button" onclick="location.href='./noteWrite?recipients=${dto.senders }'">답장 <i class="fa-solid fa-arrow-right"></i></button>
						<button type="button" onclick="location.href='./noteDel'">삭제 <i class="fa-solid fa-xmark"></i></button>
					</td>
				</tr>
			</table>


		</div>
	</div>
</body>
</html>