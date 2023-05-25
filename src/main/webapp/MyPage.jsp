
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/mypage2.css?v=1">
    <script src="https://kit.fontawesome.com/bb8da17f44.js" crossorigin="anonymous"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>

    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/5.0.7/sweetalert2.min.css'>
    <title>mypage</title>



</head>

<body>
    <%@ include file="Navi.jsp" %>
    <div class="wrapper">
  <ul class="accordion-tabs-minimal tabs">
    <li class="tab-header-and-content">
      <a href="#" class="tab-link is-active">나의 정보 </a>
      <div class="tab-content">
      <div class="mypage">
    <h1>My Page</h1>
    <h3>마이페이지</h3>
 </div>
    <div class="main1">
        <div id="userImg">
        	<img id="my-imge" src="./img/${uto.level}.jpg">
       	</div>
      
      
        
        	
       	 	<div id="info">
        	
          <ul>
          <li>${sessionScope.UserNickName }님 이 가입하신 정보입니다.</li>
          <li> 아이디 ${uto.id }</li> 
            <li>패스워드${uto.password }</li>
            <li>닉네임 ${uto.nickName } </li>
            <li>lv.${uto.level}
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
  	<a id="bt1" href="./user?mode=Modify"class="button1">수정하기</a>
	
	<button type="button" class="danger"> 탈퇴하기</button>
 
</div>
  </div>
  


        
	
        
    
 <li class="tab-header-and-content">
      <a href="#" class="tab-link">나의 활동</a>
      <div class="tab-content">
      
        <%@ include file='../Calendar.jsp'%>
        
        
 <div class="box-wrap">
   <div class="boox">
         
     <p>자유게시판에 쓴 글</p>
   
<c:forEach var="board" items="${boardLists}">
<ul>
 
   
    <li>제목 ${board.title }<br>
    내용 ${board.content }<br>
   작성일 ${board.postDate }</li>
  
 </ul>
</c:forEach>


     
   </div>
   <div class="boox">
       <p>내가 좋아하는 산  <i class="fa-solid fa-mountain"></i> </p>
      <p> ${mountainLists}</p>
     
    </div>
      <div class="boox">
    <p>내가 모은 뱃지 </p>
      <div id="patchbox">
	            	<c:forEach items="${RepeatMountain }" var="R">

						<div class="rm">
							<img class="Patch" src="./img/patch.jpg">
							<span class="rm">${R.get('mname')}</span>
						</div>
						
								
	            	</c:forEach>
</div>
    
  </div>    
      </div>
      
  </li>
  </ul>
  </div>
   <span></span>

       
<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/5.0.7/sweetalert2.min.js'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./js/mypage2.js"></script>
</body>

</html>