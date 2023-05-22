<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/MountainView.css">
    <title>Document</title>
</head>
<body>

<%@ include file="./Navi.jsp" %>  
    <div style="width: 100%;">
    	<input id="boardNum" type="hidden" value="${mountainList.m_num }">
        <div style="width: 100%; position: relative;">
            <img style="opacity: 0.6;" src="https://source.unsplash.com/random/?mountain" width="100%" height="500px" alt="">
            <div style="position: absolute; top: 300px; left: 0; right: 0;">
                <h1 style="text-align: center; color: black; font-family: 'Oswald', sans-serif;"">VIEW</h1>
            </div>
        </div>
        <table class="myTable" style="margin-top: 150px;">
            <tr class="header">
              <th style="text-align: left;">
                <p>상세보기(페이지)</p>
              </th>
              <th style="text-align: right;">
                <a href="./MountainList">목록보기</a>
              </th>
            </tr>
        </table>
        <table class="myTable">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">이름</th>
                    <th scope="col">주소_1</th>
                    <th scope="col">주소_2</th>
                    <th scope="col">레벨</th>
                    <th scope="col">좋아요</th>
                </tr>
            </thead>
            <tbody>
                
                <c:choose>
                	<c:when test="${empty mountainList }">
                		<tr>
                			<td colspan="6" align="center">
                				등록된 게시물이 없습니다.
                			</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
                			<tr>
                				<td>${mountainList.m_num }</td>
                				<td>${mountainList.m_name }</td>
                				<td>${mountainList.m_addr_1 }</td>
                				<td>${mountainList.m_addr_2 }</td>
                				<td>${mountainList.level }</td>
                				<td id="likeNum">${mountainList.m_recommend }</td>
                			</tr>
                	</c:otherwise>
                </c:choose>
            </tbody>
        </table>
        
        <div class="content_box">
            <img src="https://source.unsplash.com/random/?mountain" width="100%" height="600px" alt="">
            
            
            
            <div class="btn-box">
				<c:choose>
       				<c:when test="${res==1 }">
       					<button type="button" class="btn_like btn_unlike " onClick="unlike()">
       						<span class="img_emoti"></span>
       						<span class="ani_heart_m hi"></span>
						</button>    
       				</c:when>
       				<c:otherwise>
			       		<button type="button" class="btn_like " onClick="like()">
			       			<span class="img_emoti"></span>
			       			<span class="ani_heart_m"></span>
						</button>
       				</c:otherwise>
       			</c:choose>
             </div>
        </div>
        
        <div class="info_box">
            	<input type="hidden" id="mname1" value="${mname }">
            	<table class="myTable">
		            <tr class="header">
			          	
			            <th style="text-align: left;">
			           		<p style="margin-left: 35px">높이<p>
			            </th>

			            <th style="text-align: left;">
			              산 소개
			            </th>
		            </tr>
		        </table>
		        <table class="myTable">		 
		                <tr class="header">
		                    <th></th>
		                    <th style="text-align: center;" id='minfo'></th> 
		                    <th></th>           
		               	</tr>       
		    	</table>
            </div>
    </div>
	
	<div style="height: 400px"></div>
	<%@ include file="./Footer.jsp" %>
   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    
    //산이름 검색하여 API 정보출력

    window.onload=function() {
		 let keyword = $("#mname1").val();
  	     $.ajax({
  	         url: "./api?keyword="+keyword, // 요청 URL
  	         type: "get", // HTTP 메서드
  	         dataType: "xml", // 응답 데이터 형식
  	         success: sucFuncJson10, // 요청 성공 시 호출할 메서드 설정,
  	         error: errFunc // 요청 실패 시 호출할 메서드 설정
  	    });
   };
    
    
     function sucFuncJson10(d) {
         console.log(d)
         var list = '';

         $(d).find('item').each(function(index, item) {      
         	list+='<td>'+$(this).find('mntninfohght').text()+"m"+'</td>';
         	list+='<td>'+'</td>'
         	list+='<td>'+$(this).find('mntninfodtlinfocont').text().replaceAll("&lt;br /&gt;" , "")+'</td>'    
         });
         $('#minfo').html(list);
     }
     // 실패 시 경고창을 띄워줍니다.
     function errFunc(e) {
         alert("실패: " + e.status);
     }
    
       
        $('.btn_like').click(function(){
  		if($(this).hasClass('btn_unlike')){
			$(this).removeClass('btn_unlike');
			$('.ani_heart_m').removeClass('hi');
			$('.ani_heart_m').addClass('bye');
			$(this).attr('onClick', 'like()');
			
  		}
  		else{
			$(this).addClass('btn_unlike');
			$('.ani_heart_m').addClass('hi');
			$('.ani_heart_m').removeClass('bye');
			$(this).attr('onClick', 'unlike()');
  		}
  		});
        
        function like(){
        	let board_num = $('#boardNum').val();
     	   	$.ajax({
    		   url: './like?board_num='+board_num+"&mode=like",
    		   type: 'GET',
    		   dataType: 'json',
    		   success: function (data) {
    			   console.log(data);
    			   console.log(data.res);
    			   $("#likeNum").text(data.res);
    		   },
    		   error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) }
    	   });
        }
        
        function unlike(){
        	let board_num = $('#boardNum').val();
      	   $.ajax({
    		   url: './like?board_num='+board_num+"&mode=ulike",
    		   type: 'GET',
    		   success: function (data) {
    			   console.log(data);
    			   console.log(data.res);
    			   $("#likeNum").text(data.res);
    		   },
    		   error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) }
    	   });
        }
        </script>  
  
</body>
</html>