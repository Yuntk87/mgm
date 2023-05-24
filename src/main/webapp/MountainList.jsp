<%@page import="dto.MountainDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.MountainDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/MountainList.css?v=1">
    <title>Document</title>
</head>
<%
	ServletContext sc = getServletContext();
	MountainDao dao = new MountainDao(sc);
	dao.close();
%>
<body>

<%@ include file="./Navi.jsp" %>   

    <div style="width: 100%;">
    	<div style="width: 100%; position: relative;">
            <img style="opacity: 0.7;" src="https://source.unsplash.com/random/?valley" width="100%" height="560px" alt="">
            <div style="position: absolute; top: 300px; left: 0; right: 0;">
                <h1 class="menuTitle">MOUNTAIN</h1>
            </div>
        </div>
        <form method="GET">
	        <table class="myTable" style="margin-top: 150px;">
	            <tr class="header">
	              <th>
	                <select name="searchField"> 
	                    <option value="m_name"  ${"m_name" eq param.searchField? "selected" : "" } >산이름</option> 
	                </select>
	                <input type="text" name="searchWord" id="search" value="${empty param.searchWord ? '' : param.searchWord }">
	               	<button class="fa-lg fa-sharp fa-solid fa-magnifying-glass border-none" id="sBtn" >검색</button>
	              </th>
	            </tr>
	        </table>
        </form>
        <div class="list_row">
        	<c:choose>
        		<c:when test="${empty mountainList }">
        			<h1>등록된 게시물이 없습니다.</h1>
        		</c:when>
        		<c:otherwise>
        			<c:forEach var="dto" items="${ mountainList }">
        				<div class="card">
        					<input type="hidden" class="query" value="${dto.m_name }">
        					<div class="content" id="content${dto.m_name }">
        					
        					</div>
                            <h3 class="card-title"><i class="fa-solid fa-mountain"></i> : ${dto.m_name} </h3>
                            <p class="card-text"><i class="fa-solid fa-location-dot"></i> : ${dto.m_addr_1} ${dto.m_addr_2 }</p>
                            <p class="card-text"><i class="fa-solid fa-person-hiking"></i> : ${dto.level }</p>
                            <i class="fa-solid fa-heart"></i>
                            <span style="margin-left: 10px;">${dto.m_recommend}</span>
                            <a href="./view?searchWord=${dto.m_name }&m_num=${dto.m_num}&m_name=${dto.m_name}"><button class="view_btn">상세보기</button></a>
                            
                        </div>
        			</c:forEach>
        		</c:otherwise>
        	</c:choose>  
        </div>

        
        




        <table class="myTable">
            <tr class="header">
                <th colspan="6" style="text-align: center; color: white;" >
	        		<c:if test="${ph.showPrev }" >
	        			<a href ="<c:url value='/list${ph.sc.getQueryString(ph.beginPage-1)}'/>" >&laquo;</a>
	       			</c:if>
	        		<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
	        			<a href ="<c:url value='/list${ph.sc.getQueryString(i)}'/>" >${i }</a>
	        		</c:forEach>
	        		<c:if test="${ph.showNext }" >
	        			<a href ="<c:url value='/list${ph.sc.getQueryString(ph.endPage+1)}'/>" >&raquo;</a>
	        		</c:if>
	        	</th>
            </tr>
        </table>
    </div>
    <div style="height: 400px"></div>
	<%@ include file="./Footer.jsp" %>


    <script>
    	let tmp = "${res}";
    	console.log(tmp);
		let mlist = tmp.split(' ');
		window.onload= function(){ 
		for(let i = 0; i<mlist.length; i++){
           (function (i){ 
        	   $.ajax({
                type : "GET",            // HTTP method type(GET, POST) 형식이다.
                url : "https://dapi.kakao.com/v2/search/image",      // 컨트롤러에서 대기중인 URL 주소이다.
                dataTypee : 'json',
                headers : {'Authorization': 'KakaoAK fcbb5e354414be93d5289d773b6993c5'},
                data :  {'query':mlist[i], 'size':4},
                success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
                	$.each(res.documents, function (z, search) {
                		$("#content"+mlist[i]).append("<img width='300px;' height='400px;' alt='"+ mlist[i]+ "' src=" + search.image_url+" onerror='this.remove ? this.remove() : this.removeNode();' />")
	                	console.log("#content"+mlist[i])
                    });
                },
                error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                    alert("통신 실패.")
                }
            });})(i);
		}
		}
        
    
        
    </script>
    
</body>
</html>