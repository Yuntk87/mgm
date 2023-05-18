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
<!-- <script src="./js/LocationCheck.js"></script> -->
</head>
<body>
	<div id="Location">
		<div class="tab">
			<button class="tablinks" onclick="opendiv(event, 'myPosition')">내위치 확인</button>
			<button class="tablinks" onclick="opendiv(event, 'search-panel')">주소로 검색</button>
			<button class="tablinks" onclick="opendiv(event, 'searchDiv')">남은거리 보기</button>
		</div>
		
	    <div id="myPosition" class="tabcontent">
	    	<h3>현재위치 확인</h3>
	    	<button type="button" id="myLocationBtn1" class="myButton" onclick="myLocations1()">지도 검색</button>
   	        <input id="address1" type="hidden"/>
   	        <button id="searchMap1" type="button" value="Geocode" style="display:none">지도 검색</button>
	    </div>
	    
	    <div id="search-panel" class="tabcontent">
			<h3>주소 검색</h3>
	        <input id="address" type="text" placeholder="지역명 또는 주소 검색" />
	        <button id="searchMap" type="button" class="myButton" value="Geocode">지도 검색</button>
	    </div>
	    

	    <div id="searchDiv" class="tabcontent">
		    <h3>남은거리 보기</h3>
        	<button type="button" id="myLocationBtn" class="myLocationBtn myButton" onclick="myLocations()">현재위치 확인</button>
 	        <input type="hidden" id="myLocation" name="myLocation" value=""/>
 	        
            <input type="text" id="mname" name="mName" placeholder="산 이름을 검색하세요." />
            <button type="button" id="searchBtn" class="myButton">검색 요청</button>	  
			
			<select id="listBox" name="listName"></select>
            <input type="hidden" id="mLocation" name="mLocation" value=""/>

        	<button id="qmBtn" type="button" class="myButton">지도 검색</button>
	    </div>

	    
<!-- 		지도 API -->
	    <h2>지도</h2>
	 	<div id="map" class='qmap' style="width:100%; height: 30vh;"></div>
	</div>
</body>
</html>