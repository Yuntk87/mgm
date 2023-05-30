<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/Navi.css">
    <title>Main</title>
</head>
<body>
    <div class="navi">
        <ul class="navi_menu" >
            <li><a class="active" href="./Main.jsp" style="font-size: 40px">MGM<span class="smallLogo" style="font-size:15px;"> : ADMIN</span></a></li>
            <li><a href="./admin">산 관리</a></li>
            <li><a href="./ConfirmBoardList">인증게시글 관리</a></li>
            <li><a href="./UserTable.jsp">회원 관리</a></li>
            <li><a href="./AskBoardList">문의 확인</a></li>
        </ul>
        <div class="navi_login">
        	<a class='link' href='./logout'>로그아웃</a>
        </div>
    </div>
</body>
</html>