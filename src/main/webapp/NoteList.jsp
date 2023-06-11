<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.noteTitle {
		display:inline-block;
		width:50px;
		overflow:hidden;
		text-overflow: ellipsis;
	}
</style>
</head>
<body>
	<div id="noteList_box">
		<c:forEach items="${noteLists }" var="n">
			<div>${n.senders }</div>
			<div><p><a class="noteTitle" href="./NoteView.jsp">${n.content }</a></p></div>
			<div>${n.sendDate }</div>	
		</c:forEach>
	</div>
</body>
</html>