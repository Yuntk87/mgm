<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="./css/FindPwd.css">
<meta charset="UTF-8">
<title>비밀번호찾기 성공</title>
</head>
<body>
<%@ include file="Navi.jsp" %>

<div class="rightbox">

    
    <h2 class="titlee"> <div class="icon" ><i class="fa-solid fa-unlock-keyhole"></i></div><span>find</span><br>password</h2>
    <p class="desc"> 회원가입시 사용한 비밀번호는<br><span class="fid">${pwd}<br></span>입니다</p>
     
      
<<<<<<< HEAD
      <button onclick="location.href='http://localhost:8081/Mgm/LoginForm.jsp'" class="buttonn" id="signup">로그인화면으로 가기 </button>
=======
      <button onclick="location.href='./LoginForm.jsp'" class="button" id="signup">로그인화면으로 가기 </button>
>>>>>>> branch 'DEVELOP' of https://github.com/Yuntk87/mgm.git
    </div>
</body>
</html>