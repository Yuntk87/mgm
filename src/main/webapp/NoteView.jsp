<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#noteView_box {
		width:80%;
		margin:0 auto;
	}
	.noteViewHead table {
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
		width:100%;
	}
</style>
</head>
<body>
	<div id="noteView_box">
		<h3>쪽지 읽기</h3>
		<div class="noteViewHead">
			<table>
				<tr>
					<th width="3%">${dto.note_num }</th>
					<th width="10%">보낸사람</th>
					<td width="40%">${dto.senders }</td>
					<th width="10%">날짜</th>
					<td width="25%">${dto.sendDate }</td>
					<td width="10%">
						<button type="button" onclick="location.href='./noteWrite?recipients=${dto.senders }'">답장</button>
						<button type="button" onclick="location.href='./noteDel'">삭제</button>
					</td>
				</tr>
			</table>
		</div>
		<div class="noteViewBody">${dto.content }</div>
	</div>
</body>
</html>