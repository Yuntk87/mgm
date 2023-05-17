<%@page import="java.util.HashMap"%>
<%@page import="dao.UserDao"%>
<%@page import="dto.MountainDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.MountainDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<%
	ServletContext sc = getServletContext();
	MountainDao dao = new MountainDao(sc);
	List<MountainDto> PopularList = dao.PopularList();
	UserDao udao = new UserDao(sc);
	
	String id = (String)session.getAttribute("UserId");
	List<HashMap<String, String>> uList = udao.RepeatMountain(id);
	
	udao.close();
	dao.close();
%>
<body>
	<div>
		<c:forEach items="<%=PopularList %>" var="b">
			<p>${b.m_num } / ${b.m_name } / ${b.m_addr_1 } / ${b.m_addr_2 } / ${b.level } / ${b.m_recommend }</p>
		</c:forEach>
	</div>
	<div>
		<c:forEach items="<%=uList %>" var="u">
			<p>${u.get('mname')}</p>
		</c:forEach>
	</div>
</body>
</html>