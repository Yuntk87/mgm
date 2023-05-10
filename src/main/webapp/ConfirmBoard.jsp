<%@page import="dto.MountainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>confirmBoard</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgWjfRDY2JDCNcxaKgoNBenu5o1POdE_c&callback=initMap&region=kr"></script>
<link rel="stylesheet" href="./css/confirmBoard.css">
<script src="./ConfirmBoard.js"></script>
</head>
<body>
<%@ include file="Navi.jsp" %>
	<div id="ConfirmMain">
		    	<h2>인증게시판</h2>
		
	<!-- 		위치 정보 받아오기 -->
		    <div id="searchDiv">
		        <form id="searchFrm" action="./ConfirmBoardWrite" method="post">
		            <label for="mname">목적지(산) : </label>
		            <input type="text" id="mname" name="mName" placeholder="산 이름을 검색하세요." />
		            <button type="button" id="searchBtn">검색 요청</button><br>
		            	
					<label for="mLocation">목적지(봉우리) : </label>
					<select id="listBox" name="listName"></select>					
		            <input type="text" id="mLocation" name="mLocation" value=""/><br>
					
		        	<button type="button" id="myLocationBtn" onclick="myLocations()">현재위치 확인</button>
		 	        <input type="text" id="myLocation" name="myLocation" value=""/>
		        	<div id="myLocationInfo"></div>
		        	
		        	<button id="mBtn" type="button">등록확인</button>
		        	
					<div id="btnPo"></div>
		        </form>
		    </div>
		    
	<!-- 		지도 API -->
		    <div id="mapDiv">
		    	<h2>지도</h2>
		        <input id="address" type="hidden" placeholder="주소입력" />
			 	<div id="map" style="width:400px; height: 400px;"></div>
		    </div>
	</div>
<%@ include file="./Footer.jsp" %>
</body>
</html>