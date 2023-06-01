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
    <link rel="stylesheet" href="./css/MountainList.css">
    <title>Document</title>
</head>
<body>

<%@ include file="./Navi.jsp" %>   

    <div style="width: 100%;">
    	<div style="width: 100%; position: relative;">
            <img style="opacity: 0.7;" src="./img/page_bg1.jpg" width="100%" height="560px" alt="">
            <div style="position: absolute; top: 300px; left: 0; right: 0;">
                <h1 class="menuTitle">MOUNTAIN</h1>
            </div>
        </div>
<!--         <form method="GET"> -->
<!-- 	        <table class="myTable" style="margin-top: 150px;"> -->
<!-- 	            <tr class="header"> -->
<!-- 	              <th> -->
<!-- 	                <select name="searchField">  -->
<%-- 	                    <option value="m_name"  ${"m_name" eq param.searchField? "selected" : "" } >산이름</option>  --%>
<!-- 	                </select> -->
<%-- 	                <input type="text" name="searchWord" id="search" value="${empty param.searchWord ? '' : param.searchWord }"> --%>
<!-- 	               	<button class="fa-lg fa-sharp fa-solid fa-magnifying-glass border-none" id="sBtn" >검색</button> -->
<!-- 	              </th> -->
<!-- 	            </tr> -->
<!-- 	        </table> -->
<!--         </form> -->



			







        <div class="list_row">
        	<c:choose>
        		<c:when test="${empty mountainList }">
        			<table class="myTable">
			            <tr class="header">
			              <th style="text-align:center;">
			              	<h1 style="font-family: 'LINESeedKR-Bd';">등록된 게시물이 없습니다.</h1>
			              </th>
			            </tr>
			        </table>
        			
        		</c:when>
        		<c:otherwise>
        			
        			<c:forEach var="dto" items="${ mountainList }">
        				<div class="card">
                            <a href="#"><img class="mimg"></a>
                            <h2 class="card-title"><i class="fa-solid fa-mountain-sun"></i> ${dto.m_name} </h2>
                            <p class="card-text"><i class="fa-solid fa-location-dot"></i> ${dto.m_addr_1} ${dto.m_addr_2 }</p>
                            <p class="card-text"><i class="fa-solid fa-person-hiking"></i> ${dto.level }<i class="fa-regular fa-thumbs-up" style="margin-left: 40px;"></i> ${dto.m_recommend}</p>   
                            <a href="./view?searchWord=${dto.m_name }&m_num=${dto.m_num}&m_name=${dto.m_name}"><button class="view_btn">상세보기</button></a>
                            
                        </div>
        			</c:forEach>
        			
					<c:forEach begin="1" end="${size }">
       				<div class="card">
      				</div>                    
					</c:forEach>
        		</c:otherwise>
        	</c:choose>  
        </div>

        
        




        <table class="myTable" style="background-color: #f9f9f9;">
            <tr class="header">
                <th colspan="6" style="text-align: center; color: white;" >
	        		<c:if test="${ph.showPrev }" >
	        			<a href ="<c:url value='/MountainList${ph.sc.getQueryString(ph.beginPage-1)}'/>" >&laquo;</a>
	       			</c:if>
	        		<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
	        			<a href ="<c:url value='/MountainList${ph.sc.getQueryString(i)}'/>" >${i }</a>
	        		</c:forEach>
	        		<c:if test="${ph.showNext }" >
	        			<a href ="<c:url value='/MountainList${ph.sc.getQueryString(ph.endPage+1)}'/>" >&raquo;</a>
	        		</c:if>
	        	</th>
            </tr>
            <tr>
            	<th style="text-align: center;">
            		<select name="searchField">
						<option value="m_name"  ${"m_name" eq param.searchField? "selected" : "" } >산이름</option>
						<option value="level" ${"level" eq param.searchField? "selected" : "" }>난이도</option>
					</select>
					<div id="textSearch">
						<input type="text" name="searchWord" id="search" placeholder="검색" value="${not empty param.searchWord? param.searchWord : '' }" >
						<button class="page_btn" style="height: 38px;"><i class="fa-solid fa-magnifying-glass i-con"></i></button>
					</div>
            	</th>
            </tr>
        </table>
    </div>
    <div style="height: 400px"></div>
	<%@ include file="./Footer.jsp" %>


    <script>
    const images = ["mountain", "rocky mountains", "hill", "hanla mountain", "hiking", "highlands", "fuji mountain", "annapurna", "trekking", "Everest"];
    
    for(let i =0; i<document.getElementsByClassName('mimg').length; i++){
        document.getElementsByClassName('mimg')[i].src = "https://source.unsplash.com/random/300x300/?"+images[i]
    }
        
        
    
        
    </script>
    
</body>
</html>