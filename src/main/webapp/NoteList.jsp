<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note List</title>
<style>
	#noteList_box {
		width:80%;
		margin:0 auto;
	}
	table {
		width:100%;
		
		border-collapse: collapse;
	}
	th, td {
		border:1px solid black;
		overflow:hidden;
		text-overflow: ellipsis;
	}
</style>
</head>
<body>
	<div id="noteList_box">
		<div id="noteList">
		<p>읽지 않은 메세지 ${cnt }</p>
			<form id="noteRecycleform" action="./noteDel?mode=Recycle" method="post">
				<table>
					<tr>
						<input name="RecycleBtn" type="submit" value="휴지통으로">
					</tr>
					<tr>
						<th width="2%"></th>
						<th width="10%">보낸사람</th>
						<th width="60%">내용</th>
						<th width="20%">날짜</th>
					</tr>
					<c:choose>
						<c:when test="${empty noteLists }">
							<tr>
								<th colspan="4">받은 쪽지가 없습니다</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noteLists }" var="n">
								<tr>
									<td><input name="inputNoteNum" type="checkbox" value="${n.note_num }"></td>
									<td>${n.senders }</td>
									<td><p><a class="noteTitle" href="./noteView?noteNum=${n.note_num }">${n.content }</a></p></td>
									<td>${n.sendDate }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</form>
		</div>
		<div id="noteListDel">
			<form id="noteDelForm" action="./noteDel" method="post">
				<table>
					<tr>
						<input name="RecycleBtn" type="submit" value="삭제">
					</tr>
					<tr>
						<th width="2%"></th>
						<th width="10%">보낸사람</th>
						<th width="60%">내용</th>
						<th width="20%">날짜</th>
					</tr>
					<c:choose>
						<c:when test="${empty noteListsDel }">
							<tr>
								<th colspan="4">휴지통이 비어있습니다</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noteListsDel }" var="nd">
								<tr>
									<td><input name="inputNoteNum" type="checkbox" value="${nd.note_num }"></td>
									<td>${nd.senders }</td>
									<td><p><a class="noteTitle" href="./noteView?noteNum=${nd.note_num }">${nd.content }</a></p></td>
									<td>${nd.sendDate }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</form>
		</div>
		
	</div>
</body>
</html>