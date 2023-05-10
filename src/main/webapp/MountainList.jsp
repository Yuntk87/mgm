<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>MountainList</title>
  </head>
  <style>
    form {
        width: 80%;
        margin: 0 auto;
        margin-top: 200px;
    }
    button {
        width: 100px;
        height: 30px;
    }
    td {
        text-align: center;
    }
    .row {
    	width: 80%;
    	margin: 0 auto;
    }
    .col {
    	display:flex;
    	justify-content: center;
    }
    .card {
    	margin-top: 10px;
    }
    .card-body {
    	background-color: lightgray;
    }
    .btn-box {
    
    	text-align: center;
    	padding-bottom: 10px; 
    }
    a {
    	text-decoration: none;
    	color:black;
    }
   
  </style>
  <body>
 <%@ include file="Navi.jsp" %>
 <div style="width: 100%;">
        <form method="get">
            <table class="table table-dark" style="margin-top: 200px;">
                <tr class="border-none">
                    <td class="border-none" >
                        <select name="searchField"> 
                            <option value="m_name"  ${"m_name" eq param.searchField? "selected" : "" } >산이름</option> 
                            <option value="m_addr_1" ${"m_addr_1" eq param.searchField? "selected" : ""} >주소</option>
                        </select>
                        <input type="text" name="searchWord" id="search" value="${empty param.searchWord ? '' : param.searchWord }">
                        <button class="fa-lg fa-sharp fa-solid fa-magnifying-glass border-none" id="sBtn" >검색</button>
                    </td>
                </tr>   
            </table>
        </form>
        
        <div class="row">
        	<c:choose>
        		<c:when test="${empty mountainList }">
        			<h1>등록된 게시물이 없습니다.</h1>
        		</c:when>
        		<c:otherwise>
        			<c:forEach var="dto" items="${ mountainList }">
        				<div class="col-md-6 col-lg-3">
                			<div class="card card-bg">
                				<a href="./MountainView?searchWord=${dto.m_name }&m_num=${dto.m_num}"><img src="https://source.unsplash.com/random/355x300/?mountain"></a>
                    			
                    			<div class="card-body">
                        			<h5 class="card-title"><i class="fa-solid fa-mountain"></i> : ${dto.m_name} </h5>
                        			<p class="card-text"><i class="fa-solid fa-location-dot"></i> : ${dto.m_addr_1} ${dto.m_addr_2 }</p>
                        			<p class="card-text"><i class="fa-solid fa-person-hiking"></i> : ${dto.level }</p>
                        			<div class="btn-box">
                          				<a href="./view?searchWord=${dto.m_name }&m_num=${dto.m_num}"><span class="badge bg-success">상세보기</span></a>
                        			</div>
                        			<div class="row row-icon">
                          				<div class="col">
                            				<i class="fa-regular fa-eye"></i>
                            				<span style="margin-left: 10px;">${dto.m_recommend}</span>
                          				</div>
                          				
                        			</div>
                    			</div>
                			</div>
            			</div>
        			</c:forEach>
        		</c:otherwise>
      
        	</c:choose>
            
        </div>
		
		<table class="table table-dark" style="width:80%; margin: 0 auto; margin-top: 10px">
		<tr>
        	<td colspan="6" style="text-align: center; color: white;" >
        		<c:if test="${ph.showPrev }" >
        			<a href ="<c:url value='/list${ph.sc.getQueryString(ph.beginPage-1)}'/>" >&laquo;</a>
       			</c:if>
        		<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
        			<a href ="<c:url value='/list${ph.sc.getQueryString(i)}'/>" >${i }</a>
        		</c:forEach>
        		<c:if test="${ph.showNext }" >
        			<a href ="<c:url value='/list${ph.sc.getQueryString(ph.endPage+1)}'/>" >&raquo;</a>
        		</c:if>
        	</td>
        </tr>
		</table>
</div>    
    


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<%@ include file="./Footer.jsp" %>  
  </body>
</html>