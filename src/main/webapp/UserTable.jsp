<%@page import="java.util.List"%>
<%@page import="java.io.Console"%>
<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserTable</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src=./js/UserTable.js></script>
<style>
#user {
	width:80%;
	margin: 0  auto;
	margin-top:200px;
}
#user input[type="text"] {
  width: 1000px;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
}

#user button {
  width: 200px;
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin:9px;
}

#user button:hover {
  background-color: #45a049;
}

#user table {
  font-family: Arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
}

#user td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

#user th {
  background-color: #dddddd;
  color: #333;
  font-weight: bold;
}
.search {
  display: flex;
}
.tabcontent {
	width:90%;
	margin:0 auto;
}
#search_form {
	text-align:center;
}
.search-container {
	margin:0 auto;
}
</style>
</head>
<%
	ServletContext sc = getServletContext();
	UserDao userdao = new UserDao(sc);
	ArrayList<UserDto> userList = userdao.selectAll();
	System.out.print(userList);
	userdao.close();
%>
<body>
<%@ include file="./AdminNavi.jsp" %>
	<div id="user">
		<div id="userSearch" class="search">
			<div class="search-container">
				<input class="form-control" id="nickName" onkeyup="searchFunction()"type="text" size="20" placeholder="닉네임 검색">
				<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
			</div>
		</div>
		 
	    <table class="table" style="text-align:center;border:1px solid #dddddd">
		    <tr>
			    <th style="background-color:#fafafa; text-align:center;">번호</th>
			    <th style="background-color:#fafafa; text-align:center;">아이디</th>
			    <th style="background-color:#fafafa; text-align:center;">비밀번호</th>
			    <th style="background-color:#fafafa; text-align:center;">닉네임</th>
			    <th style="background-color:#fafafa; text-align:center;">이름</th>
			    <th style="background-color:#fafafa; text-align:center;">전화번호</th>
			    <th style="background-color:#fafafa; text-align:center;">생년월일</th>
			    <th style="background-color:#fafafa; text-align:center;">성별</th>
			    <th style="background-color:#fafafa; text-align:center;">주소1</th>
			    <th style="background-color:#fafafa; text-align:center;">주소2</th>
			    <th style="background-color:#fafafa; text-align:center;">레벨</th>
			    <th style="background-color:#fafafa; text-align:center;">가입일자</th>
			    <th style="background-color:#fafafa; text-align:center;">삭제</th>
		    </tr>
		    
		    <tbody id="ajaxtable">
		    <c:forEach items="<%= userList %>" var="u">
		        <tr>
		        	<td>${u.user_num }</td>
		      		<td>${u.id }</td>
			      	<td>${u.password }</td>
			      	<td>${u.nickName }</td>
			      	<td>${u.name }</td>
			      	<td>${u.phone }</td>
			      	<td>${u.pNumber }</td>
			      	<td>${u.gender }</td>
			      	<td>${u.addr1 }</td>
			      	<td>${u.addr2 }</td>
			      	<td>${u.level }</td>
			      	<td>${u.postDate }</td>
		      		<td><a href="./user?mode=del&userNum=${u.user_num }">삭제</a>
		        </tr>
		    </c:forEach>
			</tbody>
		</table>
</div>
	
</body>
</html>