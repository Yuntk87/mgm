<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note List</title>
<link rel="stylesheet" href="./css/note.css">
</head>
<body>
<%@ include file="./Navi.jsp" %>
<%@ include file="./NoteNavi.jsp" %>
	<div id="noteList_box">
		<div class="noteList">
			<h2><i class="fa-regular fa-envelope"></i> 보낸쪽지함</h2>
			<form id="noteDelForm" action="./noteDel?mode=del" method="post">
				<table>
					<tr>
						<input name="RecycleBtn" type="submit" value="삭제❌">
					</tr>
					<tr class="tableHead">
						<th width="5%"></th>
						<th width="10%">보낸사람</th>
						<th width="60%">내용</th>
						<th width="20%">날짜</th>
					</tr>
					<c:choose>
						<c:when test="${empty noteListsSend }">
							<tr>
								<th colspan="4">보낸쪽지함이 비어있습니다</th>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noteListsSend }" var="nd">
								<tr>
									<td style="text-align:center;"><input name="inputNoteNum" type="checkbox" value="${nd.note_num }"></td>
									<td>${nd.recipients }</td>
									<td>
										<c:if test="${nd.readCheck eq 1}">
											<a style="color:gray;" class="noteTitle" href="./noteView?noteNum=${nd.note_num }">${nd.content }</a>
										</c:if>
										<c:if test="${nd.readCheck ne 1}">
											<a class="noteTitle" href="./noteView?noteNum=${nd.note_num }">${nd.content }</a>
										</c:if>
									</td>
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