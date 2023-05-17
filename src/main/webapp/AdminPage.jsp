<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/AdminPage.css">
<script src=./js/AdminPage.js></script>
</head>

<body>
<%-- <%@ include file="./Navi.jsp" %> --%>
	
	<div class="tab">
	  <h1>관리자 페이지</h1>
	  <button class="tablinks" onclick="openCity(event, 'confirm')">인증게시글 관리</button>
	  <button class="tablinks" onclick="openCity(event, 'mountain')">산 관리</button>
	  <button class="tablinks" onclick="openCity(event, 'user')">회원 관리</button>
	</div>
	
	<div id="confirm" class="tabcontent">
	  <h3>confirm</h3>
	  <p>인증게시판</p>
	</div>
	
	<div id="mountain" class="tabcontent">
		  <h2>mountain</h2>
		  <div class="container">
			<div class="search-bar">
				<form class="d-flex" >
					<input class="form-control me-2" id="keyword" type="search" placeholder="산 검색" aria-label="Search">
					<button class="btn btn-outline-secondary" id="searchBtn"  type="button"><i class="fa-solid fa-magnifying-glass i-con"></i></button>
				</form>
			</div>
			
			<div class="card">
				<div class="card-body">
					<div>
						<h5 class="card-title searchName"></h5>
						<i class="fa-solid fa-location-dot" style="line-height: 100px;"></i>
						<span class="card-text resultAddress"></span>
					</div>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<i class="fa-solid fa-person-hiking" style="line-height: 100px;"></i>
	          			<span class="resultHeight"></span>
				  	</li>
				  	<li class="list-group-item">
			  	  		<i class="fa-solid fa-code" style="line-height: 100px;"></i>
	          	  		<span class="resultCode"></span>
				    </li>
				    <li class="list-group-item">
				    	<div class="card-body result" id="searchResult" ></div>
				    </li>
				</ul>
			</div>

	        <form action="./MountainRegister" method="post" onsubmit="return formCheck(this)">
	            <table id="mTable">
	                <thead>
	                  <tr>
	                    <th scope="col">이름</th>
	                    <th scope="col">주소(1)</th>
	                    <th scope="col">주소(2)</th>
	                    <th scope="col">레벨(1~5)</th>
	                    <th scope="col">등록하기</th>
	                  </tr>
	                </thead>
	                <tbody>
	                  <tr>
	                    <td><input type="text" id="m_name" value="" name="m_name" placeholder="이름"></td>
	                    <td><input type="text" id="m_addr_do"  name="m_addr_1" placeholder="주소(1)"></td>
	                    <td><input type="text" id="m_addr_si"  name="m_addr_2" placeholder="주소(2)"></td>
	                    <td><input type="number" min="1" max="5" id="level" name="level" placeholder="레벨"></td>
	                    <td class="table-secondary" colspan="8" style="text-align: right;"><button type="submit">등록하기</button></td>
	                  </tr> 
	                </tbody>
	            </table>
	        </form>
		</div> 
	</div>
	
	<div id="user" class="tabcontent">
	    <h2>user</h2>
		<div class="search">
			<div class="search-container">
				<input class="form-control" id="nickName" onkeyup="searchFunction()"type="text" size="20" placeholder="닉네임 검색">
			</div>
			<div>
				<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
			</div>
		</div>
		 
	    <table class="table" style="text-align:center;border:1px solid #dddddd">
		    <tr>
			    <th style="background-color:#fafafa; text-align:center;">번호</th>
			    <th style="background-color:#fafafa; text-align:center;">아이디</th>
			    <th style="background-color:#fafafa; text-align:center;">비밀번호</th>
			    <th style="background-color:#fafafa; text-align:center;">닉네임</th>
			    <th style="background-color:#fafafa; text-align:center;">이름</th>
			    <th style="background-color:#fafafa; text-align:center;">전화번호</th>
			    <th style="background-color:#fafafa; text-align:center;">생년월일</th>
			    <th style="background-color:#fafafa; text-align:center;">성별</th>
			    <th style="background-color:#fafafa; text-align:center;">주소1</th>
			    <th style="background-color:#fafafa; text-align:center;">주소2</th>
			    <th style="background-color:#fafafa; text-align:center;">레벨</th>
			    <th style="background-color:#fafafa; text-align:center;">가입일자</th>
			    <th style="background-color:#fafafa; text-align:center;">삭제</th>
		    </tr>
		    <tbody id="ajaxtable">
		    <c:forEach items="${userList }" var="u">
		        <tr>
		        	<td>${u.user_num }</td>
		      		<td>${u.id }</td>
			      	<td>${u.password }</td>
			      	<td>${u.nickName }</td>
			      	<td>${u.name }</td>
			      	<td>${u.phone }</td>
			      	<td>${u.pNumber }</td>
			      	<td>${u.gender }</td>
			      	<td>${u.addr1 }</td>
			      	<td>${u.addr2 }</td>
			      	<td>${u.level }</td>
			      	<td>${u.postDate }</td>
		      		<td><a href="./user?mode=del&userNum=${u.user_num }">삭제</a>
		        </tr>
		    </c:forEach>
	</div>

</body>
</html>