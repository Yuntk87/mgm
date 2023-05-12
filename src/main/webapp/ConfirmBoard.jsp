<%@page import="dto.MountainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>confirmBoard</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/a8d8408c2e.js" crossorigin="anonymous"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgWjfRDY2JDCNcxaKgoNBenu5o1POdE_c&callback=initMap&region=kr"></script>
<link rel="stylesheet" href="./css/confirmBoard.css">
<script src="./js/ConfirmBoard.js"></script>
</head>
<body>
<%@ include file="Navi.jsp" %>
	<div id="ConfirmMain">
	    <div id="searchDiv">
	    	<h3>인증하기</h3><hr>
	        <form id="searchFrm" action="./ConfirmBoardWrite" method="post">
	        	<table class="table">
	        	<tr>
	        		<th>목적지(산)</th>
		            <th>목적지(봉우리)</th>
		            <th>내위치 확인</th>
		            <th>등록확인</th>
	        	</tr>
	        	<tr>
	        		<td>
		           		<input type="text" id="mname" name="mName" placeholder="산 이름을 검색하세요." />
		            	<button type="button" id="searchBtn" class="myButton">검색 요청</button><br>
					</td>
		            <td>
						<select id="listBox" name="listName"></select>					
			            <input type="hidden" id="mLocation" name="mLocation" value=""/><br>
		            </td>	
					<td>
			        	<button type="button" id="myLocationBtn" class="myButton" onclick="myLocations()">위치 확인</button>
			 	        <input type="hidden" id="myLocation" name="myLocation" value=""/>
			        	<div id="myLocationInfo"></div>
					</td>
					<td>
						<div id="btnPo">
							<button id="mBtn" class="myButton" type="button">등록확인</button>
						</div>
					</td>
	        	</tr>
				</table>
				<p><i class="fa-solid fa-circle-exclamation"></i> 해당 목적지 1.5km내에 위치해야 등록됩니다</p>
	        </form>
	    </div>
	    
<!-- 		지도 API -->
	    <div id="mapDiv">
	    	<h4><i class="fa-regular fa-map"></i>지도</h4>
	        <input id="address" type="hidden" placeholder="주소입력" />
		 	<div id="map"></div>
	    </div>
	</div>

<%@ include file="./Footer.jsp" %>
</body>
</html>