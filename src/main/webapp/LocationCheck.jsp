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
</head>
<body>
<%@ include file="Navi.jsp" %>
	<div id="ConfirmMain">
		    	<h2>인증게시판</h2>
		
	<!-- 		위치 정보 받아오기 -->
		    <div id="searchDiv">
		        <form id="searchFrm" action="./ConfirmBoardWrite" method="post">
		            <input type="text" id="mname" name="mName" placeholder="산 이름을 검색하세요." />
		            <button type="button" id="searchBtn">검색 요청</button>	  
					
					<select id="listBox" name="listName"></select>
		            <input type="text" id="mLocation" name="mLocation" value=""/> <br>
		
		        	<button type="button" id="myLocationBtn" onclick="myLocations()">내위치확인</button>
		 	        <input type="text" id="myLocation" name="myLocation" value=""/> <br>
		        	<div id="myLocationInfo"></div>
		        	
		        	<button id="mBtn" type="button">인증확인</button>
		        	
					<div id="btnPo"></div>
		        </form>
		    </div>
		    
	<!-- 		지도 API -->
		    <h2>지도</h2>
		    <div id="search-panel">
		        <input id="address" type="text" placeholder="주소입력" />
		        <button id="searchMap" type="button" value="Geocode">지도 검색</button>
		    </div>
		 	<div id="map" style="width:30%; height: 30vh;"></div>
	</div>
	
		 
 <script>
	$(document).ready(function() {
		
		//봉우리 선택 시 위.경도 자동 가져오기
		$("#listBox").on('change', function() {
			$("#mLocation").val(this.value);
		});

	});
	
	
	//목적지 위치정보
	$(function() {
	    $('#searchBtn').click(function() {
	   		let searchWrd = $('#mname').val();
	   		console.log(searchWrd)
	      $.ajax({
	    	url : 'http://apis.data.go.kr/B553662/peakPoiInfoService/getPeakPoiInfoList?serviceKey=IH%2FFylG0PKLPyzuOHgowwTNUjXYmvfHezQs5DiP%2BBTKnTqM2tIGJrAQ4doZJXneQQyiYneOemge%2FSNXCOmxarA%3D%3D&srchFrtrlNm=' + searchWrd,  // 요청 URL
			type : "get", 
	        dataType : "xml",
	        success : lists,
	        error : errFunc
	      });
	    });
	});
	
	function errFunc(request, status, error) {
        console.log("code: " + request.status)
        console.log("message: " + request.responseText)
        console.log("error: " + error);
    }
	
	function lists(l) {
		console.log(l)
		var list ='';
		$(l).find('item').each(function(index, item){
			list += '<option value="'+ $(this).find('lat').text() +" " +$(this).find('lot').text() +'">';
			list += $(this).find('placeNm').text() +'</option>';
		});
	    $('#listBox').html(list);

	}
	
	function errFunc(e) {
	    alert("실패: " + e.status);
	}
	
	
	//내 위치정보
	function whereami(elt) {
	    var options = {
	        enableHighAccuracy: false,
	        maximumAge: 30000,
	        timeout: 15000
	    }

	    if(navigator.geolocation)
	        navigator.geolocation.getCurrentPosition(success, error, options);
	    else
	        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
	
	    function error(e) {
	        alert("Geolocation 오류 "+e.code +": " + e.message);
	    }

	    function success(pos) {
	        console.log(pos);
	        var msg = pos.coords.latitude +" "+ pos.coords.longitude;
	        $('input[name=myLocation]').attr('value',msg);
    	}    
	}

	function myLocations() {
		var elt = document.getElementById("myLocation");
		whereami(elt);
	}
	
	
  		//위치정보 계산하여 등록버튼 출력
	$(function() {
		$("#mBtn").click(function() {
			
			let myLocation = document.getElementById('mLocation').value;
			let mLocation = document.getElementById('myLocation').value;
			$.ajax({
				url: "./distance?myLocation="+myLocation+"&mLocation="+mLocation,
				type: "get",
				dataType : "json",
				success: function(d) {
					let result = "";
					let res = (d/1000);
					
					if(res > 1.5) {
						alert((res>=1)? "목적지 까지"+res+"km 남았습니다." : "목적지 까지"+(res*100)+"m 남았습니다.");
						result = "<button type='button' id='confirmBtn' disabled >등록불가</button>";
					} else if(res < 1.5) {
						alert((res>=1)? "목적지 까지"+res+"km 남았습니다." : "목적지 까지"+(res*100)+"m 남았습니다.");
						result = "<button type='submit' id='confirmBtn'>등록가능</button>";
					} else {
						result = "알 수 없는 오류";
					}
					$("#btnPo").html(result);
				},
				error: errFunc
			});
		});
	});
	
	function errFunc(e) {
		alert("실패??" + e.status);
	}
	
	
 //주소 입력시 지도 표시
   function initMap() {
	 var map = new google.maps.Map(
	   document.getElementById('map'), {
	     zoom: 12,
	     center: {
	    	 let: -34.397, lng: 150.644
	     }
	   });
	 
	 let addr;
	 var geocoder = new google.maps.Geocoder();
	    document.getElementById('mBtn').addEventListener('click', function() {
	    	var address = document.getElementById('mLocation').value;
	    	var addr1 = document.getElementById('myLocation').value;
	        geocodeAddress(geocoder, map, address, addr1);
	    });
	    document.getElementById('searchMap').addEventListener('click', function() {
	    	var address = document.getElementById('address').value;
	    	var addr1 = document.getElementById('myLocation').value;
	        geocodeAddress(geocoder, map, address, addr1);
	    });
	 
	    function geocodeAddress(geocoder, resultMap, address, addr1) {
	        // 주소 설정		         
	        geocoder.geocode({"address":address}, function(result, status) {
	            if (status === 'OK') {
	                console.log("주소1" + addr1);
	                // 맵의 중심 좌표
	                resultMap.setCenter(result[0].geometry.location);
	                // 맵의 확대 정도
	                resultMap.setZoom(12);
	                // 맵 마커
	                var markers = [{position: new google.maps.LatLng(address.split(' ')[0], address.split(' ')[1])},{position: new google.maps.LatLng(addr1.split(' ')[0], addr1.split(' ')[1])}];
	                console.log(markers)
	                console.log('위도(latitude) : ' + markers[0].position);
	                console.log('경도(longitude) : ' +markers[1].position);
	                for(let i=0; i<markers.length; i++) {
		                var mMarker = new google.maps.Marker({
		                    map: resultMap,
		                    position: markers[i].position
		                });

	                };
	                
	                var Circle = new google.maps.Circle({
	                	center: markers[0].position,
	                    radius: 1500,
	                    strokeColor: "green",
	                    strokeOpacity: 0.8,
	                    strokeWeight: 2,
	                    fillColor: "green",
	                    fillOpacity: 0.4
	                });
	                Circle.setMap(resultMap);
	                

		            console.log('위도(latitude) : ' + mMarker.position.lat());
	                console.log('경도(longitude) : ' + mMarker.position.lng());
	            } else {
	                alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
	            }
	        });
	    }     
   }
 </script>

<br>
<br>
<%@ include file="./Footer.jsp" %>
</body>
</html>