<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>아이디 비밀번호찾기</title>
  <link rel="stylesheet" href="./css/ForgetId.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script src="https://kit.fontawesome.com/bb8da17f44.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">
  <div class="welcome">
    <div class="pinkbox">
      <div class="signup nodisplay">
        <h1>find<br>Password</h1>
        <form method="post" action="/mgm1/find?mode=pwd">
            <input type="text" name="id2" id="id2" placeholder="아이디" required>
            <input type="text" name="phone2" id="phone2" placeholder="핸드폰번호" required>
            <input type="text" name="name2" id="name2" placeholder="이름" required>
          <button class="button submit">찾기 </button>
        </form>
      </div>
      <div class="signin">
        <h1>find<br>id</h1>
        <form class="more-padding" method="post" action="/mgm1/find?mode=id">
            <input type="text" name="name" id="name" placeholder="이름" required>
            <input type="text" name="phone" id="phone" placeholder="핸드폰번호" required>
          

          <button class="button submit">찾기</button>
        </form>
      </div>
    </div>
    <div class="leftbox">
      <h2 class="title"><span>find</span><br>password</h2>
      <p class="desc"><br>  <span>아이디 <br>핸드폰번호 <br>이름</span>으로 찾을수 있습니다</p>
      <div class="icon" ><i class="fa-solid fa-unlock-keyhole"></i></div>
      <p class="account"></p>
      <button class="button" id="signin">아이디찾기</button>
    </div>
    <div class="rightbox">
      <h2 class="title"><span>find</span><br>ID</h2>
      <p class="desc"> <span>이름과<br>핸드폰번호</span>로<br> 찾을 수 있습니다</p>
      <div class="icon" ><i class="fa-solid fa-key"></i></div>
      <p class="account"></p>
      <button class="button" id="signup">비밀번호찾기 </button>
    </div>
  </div>
 </div>

</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="./Forget.js"></script>

</body>
</html>
