<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 API</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
// [검색 요청] 버튼 클릭 시 실행할 메서드를 정의합니다.
$(function() {
    $('#searchBtn').click(function() {
   		let searchWrd = $('#keyword').val();
   		let startNum = $('#startNum option:selected').val();
   		console.log(searchWrd)
      $.ajax({
        url : "https://apis.data.go.kr/1400000/service/cultureInfoService2/mntInfoOpenAPI2?searchWrd="+searchWrd+"&pageNo="+startNum+"&numOfRows=10&ServiceKey=IH%2FFylG0PKLPyzuOHgowwTNUjXYmvfHezQs5DiP%2BBTKnTqM2tIGJrAQ4doZJXneQQyiYneOemge%2FSNXCOmxarA%3D%3D",  // 요청 URL
		type : "get",                  // HTTP 메서드
        dataType : "xml",      // 응답 데이터 형식
        success : sucFuncJson,  // 요청 성공 시 호출할 메서드 설정
        error : errFunc         // 요청 실패 시 호출할 메서드 설정
      });
    });
});
// 검색 성공 시 결과를 화면에 뿌려줍니다.
function sucFuncJson(d) {
	console.log(d)
	var list ='';
	$(d).find('item').each(function(index, item){
		list+='<ul>'
		list+='<li>'+$(this).find('mntiadd').text()+'</li>';
		list+='<li>'+$(this).find('mntiadmin').text()+'</li>';
		list+='<li>'+$(this).find('mntiadminnum').text()+'</li>';
		list+='<li>'+$(this).find('mntidetails').text()+'</li>';
		list+='<li>'+$(this).find('mntilistno').text()+'</li>';
		list+='<li>'+$(this).find('mntiname').text()+'</li>';
		list+='</ul>'
	});
    $('#searchResult').html(list);
}
// 실패 시 경고창을 띄워줍니다.
function errFunc(e) {
    alert("실패: " + e.status);
}
</script>

<style>
    ul{border:2px #cccccc solid;}
</style>
</head>
<body>


<!-- 지도 API -->
    <div id="search-panel">
        <input id="address" type="text" placeholder="주소입력" />
        <button id="submit" type="button" value="Geocode">지도 검색</button>
    </div>
 	<div id="map" style="width:30%; height: 30vh;"></div>
	 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgWjfRDY2JDCNcxaKgoNBenu5o1POdE_c&callback=initMap&region=kr"></script>
	 
	 <script>
	   function initMap() {
	     var map = new google.maps.Map(
	       document.getElementById('map'), {
	         zoom: 12,
	         center: {
	        	 let: -34.397, lng: 150.644
	         }
	       });
	     
	     var geocoder = new google.maps.Geocoder();
         document.getElementById('submit').addEventListener('click', function() {
             console.log('submit 버튼 클릭 이벤트 실행');

             // 여기서 실행
             geocodeAddress(geocoder, map);
         });
	     
         function geocodeAddress(geocoder, resultMap) {
             console.log('geocodeAddress 함수 실행');

             // 주소 설정
             var address = document.getElementById('address').value;
              
             geocoder.geocode({'address': address}, function(result, status) {
                 console.log(result);
                 console.log(status);

                 if (status === 'OK') {
                     // 맵의 중심 좌표
                     resultMap.setCenter(result[0].geometry.location);
                     // 맵의 확대 정도
                     resultMap.setZoom(12);
                     // 맵 마커
                     var marker = new google.maps.Marker({
                         map: resultMap,
                         position: result[0].geometry.location
                     });

                     // 위도
                     console.log('위도(latitude) : ' + marker.position.lat());
                     // 경도
                     console.log('경도(longitude) : ' + marker.position.lng());
                 } else {
                     alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                 }
             });
         }     
	   }
	 </script>



<!-- 검색 API -->
	<div>
		<div>
			<form id="searchFrm">
				한페이지에 10개씩 출력<br>
				<select id="pageNo">
					<option value="1">1페이지</option>
					<option value="2">2페이지</option>
					<option value="3">3페이지</option>
					<option value="4">4페이지</option>
					<option value="5">5페이지</option>
				</select>
				<input type="text" id="searchWrd" placeholder="검색어 입력">
				<button type="button" id="searchBtn">검색</button>
			</form>
		</div>
		<div class="row" id="searchResult">
			검색결과 출력 <br>
		</div>
	</div>
	
<script>
	$(function() {
		$("#searchBtn").click(function() {
			$.ajax({
				url: "https://apis.data.go.kr/1400000/service/cultureInfoService2/mntInfoOpenAPI2?serviceKey=IH%2FFylG0PKLPyzuOHgowwTNUjXYmvfHezQs5DiP%2BBTKnTqM2tIGJrAQ4doZJXneQQyiYneOemge%2FSNXCOmxarA%3D%3D",
				type: "get",
				data : {searchWrd: $('#searchWrd').val(), pageNo: $('#pageNo option:selected').val() },
				dataType: "xml",
				success: sucFuncJson,
				error: errFunc
			});
		});
	});
	
	function sucFuncJson(d) {
		let str = "";
		$.each(d.items, function(index, item) {
			str += "<ul>";
			str +="    <li>" + (index + 1) + "</li>";
			str +="    <li>" + item.mntiadd + "</li>";
			str +="    <li>" + item.mntiadmin + "</li>";
			str +="    <li>" + item.mntiadminnum + "</li>";
			str +="    <li>" + item.mntidetails + "</li>";
			str +="    <li>" + item.mntilistno + "</li>";
			str += "</ul>";
		});
		$('#searchResult').html(str);
	}
	
	function errFunc(e) {
		alert("실패" + e.status);
	}
</script>
</body>
</html>
