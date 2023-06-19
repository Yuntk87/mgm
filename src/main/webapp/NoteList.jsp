<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note List</title>
<link rel="stylesheet" href="./css/note.css">
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="./Navi.jsp" %>
<%@ include file="./NoteNavi.jsp" %>
	<div id="noteList_box">
		<div class="noteList">
			<h2 id="noteTitle""><i class="fa-regular fa-envelope"><span id="noteCnt"><sup>${cnt }</sup></span></i> 쪽지함</h2>
			<form id="noteRecycleform" action="./noteDel?mode=recycle" method="post">
				<table>
					<tr>
						<input name="RecycleBtn" type="submit" value="휴지통으로🗑️">
					</tr>
					<tr class="tableHead">
						<th width="5%"></th>
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
									<td style="text-align:center;"><input name="inputNoteNum" type="checkbox" value="${n.note_num }"></td>
									<td>${n.senders }</td>
									<td>
										<c:if test="${n.readCheck eq 1}">
											<a style="color:gray;" class="noteTitle" href="./noteView?noteNum=${n.note_num }">${n.content }</a>
										</c:if>
										<c:if test="${n.readCheck ne 1}">
											<a class="noteTitle" href="./noteView?noteNum=${n.note_num }">${n.content }</a>
										</c:if>
									</td>
									<td>${n.sendDate }</td>
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