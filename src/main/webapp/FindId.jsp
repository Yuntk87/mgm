<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <link rel="stylesheet" href="./css/FindId.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script src="https://kit.fontawesome.com/bb8da17f44.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 성공</title>
</head>
<body>


<div class="rightbox">

    
    <h2 class="title"> <div class="icon" ><i class="fa-solid fa-key"></i></div><span>find</span><br>ID</h2>
    <p class="desc"> 회원가입시 사용한 아이디는<br><span class="fid">${id}<br></span>입니다</p>
     
      
      <button onclick="location.href='./LoginForm.jsp'" class="button" id="signup">로그인화면으로 가기 </button>
    </div>
</body>
</html>