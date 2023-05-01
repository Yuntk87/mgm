<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/a8d8408c2e.js" crossorigin="anonymous"></script>
<title>index</title>
    <style>
	    #logo_box a {
	    	font-size:30px;
	    	font-weight:bold;
	    	color: rgba(1, 61, 1, 0.836);
	    }
        .topnav {
            background-color: #333;
            overflow: hidden;
        }

        /* Style the links inside the navigation bar */
        .topnav a {
            line-height: 30px;
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        /* Change the color of links on hover */
        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Create a right-aligned (split) link inside the navigation bar */
        .topnav a.split {
            line-height: 30px;
            float: right;
            font-size: 10px;
            color: white;
        }
        .topnav a.split:hover {
        	background-color: #ddd;
            color: black;
        }
        #mbox {
        	font-size:5px;
        	color: black;
			float:right;
			margin-top:20px;
        }
        a {
        	text-decoration: none;
        	color: black;
        }
        .username {
        	color:blue;
        	font-size:12px;
        }
        
    </style>
</head>
<body>

	<div id="logo_box">
		<a href="./main" id="logo"><i class="fa-solid fa-pencil">study log</i></a>
		<div id="mbox">
			<c:if test="${not empty sessionScope.UserName }">
				<span class="username">${sessionScope.UserName }</span>님 환영합니다.
			</c:if>
		</div>
	</div>

    <div class="topnav">
        <a href="./main">Home</a>
        <a href="./MountainRegister.jsp">산등록</a>
        <a href="./List?mode=FreeBoard">자유게시판</a>
        <a href="./List?mode=ConfirmBoard">인증게시판</a>
        <a href="./List?mode=CerBoard">메이트게시판</a>
        <a href="./userList">회원목록</a>
        <a href="./register" class="split">회원가입</a>
        <c:choose>
        	<c:when test="${empty sessionScope.UserId }" >
        		<a class='split' href='./login'>로그인</a>
       		</c:when>
       		<c:otherwise>
       			<a class='split' href='./logout'>로그아웃</a>
  			</c:otherwise>
		</c:choose>
    </div>
</body>
</html>