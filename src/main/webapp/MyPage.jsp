<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/mypage.css">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
    <title>mypage</title>



</head>

<body>
    <%@ include file="Navi.jsp" %>
 <div class="mypage">
    <h1>My Page</h1>
    <h3>마이페이지</h3>
 </div>
    <div class="main1">
        <div id="userImg">
        	<img src="./imges/1.jpg">
       	</div>
       	<div id="info">
       	 	${sessionScope.UserNickName }님 이 가입하신 정보입니다.<br>
          <ul>
          
          <li> 아이디 ${uto.id }</li> 
            <li>패스워드${uto.password }</li>
            <li>닉네임 ${uto.nickName }</li>
           <li>이름 ${uto.name }</li> 
            <li>전화번호 ${uto.phone }</li>
           <li>주민번호 ${uto.pNumber }</li> 
            <li>성별 ${uto.gender }</li>
           <li>주소1 ${uto.addr1 }</li>
            <li>주소2 ${uto.addr2 }</li>
         </ul>   
        </div>
	</div>
<div class="data-container">

	
<span class="btn"><a href="./user?mode=Modify">수정하기</a></span>
<span class="btn"><a href="./user?mode=Withdrawal">탈퇴하기</a></span>
</div>
    <!-- 
        <div class="update"><a href="./update">수정하기</a></div>
        <div class="delete"><a href="./delete">탈퇴하기</a></div>
    </div> -->


</body>

</html>