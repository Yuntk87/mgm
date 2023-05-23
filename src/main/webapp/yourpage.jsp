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
    <link rel="stylesheet" href="./css/yourpage.css">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
    <title>yourpage</title>



</head>

<body>
    <%@ include file="Navi.jsp" %>
 <div class="mypage">
 
 
    <h1>${uto.id} Page</h1>
    <h3>${uto.id}페이지</h3>
 </div>
    <div class="main1">
        <div id="userImg">
        
 <c:choose>
<c:when test="${uto==null}"> 
<img src="./img/nno.jpg" style="width:300px; height:300px;">
</c:when>
<c:otherwise> <img src="./img/${uto.level}.jpg" >
 </c:otherwise>
</c:choose>
        
       	</div>
       	<div id="info">
       	 	${uto.id}님 정보입니다.<br>
          <ul>
          
          <li> 아이디 ${uto.id }</li> 
           <li>닉네임 ${uto.nickName }</li>
           <li>레벨 ${uto.level}
           <li>이름 ${uto.name }</li> 
          <li>성별 ${uto.gender }</li>
         </ul>   
        </div>
	</div>
	<h1>게시판에 작성한글</h1>
   
 <div class="box-wrap">
   <div class="box">
     
<c:forEach var="board" items="${boardLists}">
<ul>
 
   
    <li>제목 ${board.title }<br>
    내용 ${board.content }<br>
   작성일 ${board.postDate }</li>
  
 </ul>
</c:forEach>         
           
     </div>

</body>

</html>