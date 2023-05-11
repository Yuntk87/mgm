<%@page import="dto.MountainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LocationCheck</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgWjfRDY2JDCNcxaKgoNBenu5o1POdE_c&callback=initMap&region=kr"></script>
<link rel="stylesheet" href="./css/LocationCheck.css">
<script src="./js/ConfirmBoard.js"></script>
</head>
<body>
<%@ include file="Navi.jsp" %>
	<div id="ConfirmMain">    	
		<h2>검색</h2>
	    <div id="search-panel">
	        <input id="address" type="text" placeholder="지역명 또는 주소 검색" />
	        <button id="searchMap" type="button" value="Geocode">지도 검색</button>
	    </div>
	    
	    <h2>봉우리 정보 검색</h2>
<!-- 		위치 정보 받아오기 -->
	    <div id="searchDiv">
	        <form id="searchFrm" action="./ConfirmBoardWrite" method="post">
	            <input type="text" id="mname" name="mName" placeholder="산 이름을 검색하세요." />
	            <button type="button" id="searchBtn">검색 요청</button>	  
				
				<select id="listBox" name="listName"></select>
	            <input type="hidden" id="mLocation" name="mLocation" value=""/>
	
	        	<button type="button" id="myLocationBtn" onclick="myLocations()">내위치확인</button>
	 	        <input type="hidden" id="myLocation" name="myLocation" value=""/> <br>
	        	<div id="myLocationInfo"></div>
	      
	        	<button id="mBtn" type="button">지도 검색</button>
				<div id="btnPo"></div>
	        </form>
	    </div>
	    
<!-- 		지도 API -->
	    <h2>지도</h2>

	 	<div id="map" style="width:30%; height: 30vh;"></div>
	</div>
	
<%@ include file="./Footer.jsp" %>
</body>
</html>