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
    <div class="navi" id="c-board">
        <ul class="navi_menu" >
            <li><a class="active" href="./Main.jsp" style="font-size: 40px">MGM</a></li>
            <li><a href="./HomepageIntroduction.jsp" >홈페이지 소개</a></li>
            <li><a href="./MountainList">산 소개</a></li>
            <li><a href="./FreeBoardList">자유 게시판</a></li>
            <li><a href="./MateBoardList">메이트 게시판</a></li>
            <li><a href="./ConfirmBoard?mode=confirm">인증 게시판</a></li>
            <c:if test="${not empty sessionScope.UserId && sessionScope.UserId eq 'admin'}">
            	<li><a href="./admin" class="master">관리자</a></li>
            </c:if>
        </ul>

        <div class="navi_login">
            <c:choose>
                <c:when test="${empty sessionScope.UserId }" >
                    <a class='link' href='./login'>로그인</a>
                    <a class="link" href="./register" >회원가입</a>
                   </c:when>
                   <c:otherwise>
                       <a class='link' href='./mypage'>회원정보</a>
                       <a class='link' href='./logout'>로그아웃</a>
                  </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="master_menu">
        <a href="#">산 관리</a>
        <a href="#">회원 관리</a>
    </div>

</body>
</html>