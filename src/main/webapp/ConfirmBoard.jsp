<%@page import="dto.MountainDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:choose>
		<c:when test="${not empty mode && mode eq 'confirm'}">
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
		</c:when>
		
		<c:otherwise>
			<div id="ConfirmMain">
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
			
			        	<button id="mBtn" type="button" class="myButton">지도 검색</button>
				    </div>
				</div>
				<div id="map" class='qmap' style="width:100%; height: 30vh;"></div>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>