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
        url : "https://apis.data.go.kr/1400000/service/cultureInfoService2/mntInfoOpenAPI2?searchWrd="+searchWrd+"&pageNo="+startNum+"&numOfRows=10&serviceKey=IH%2FFylG0PKLPyzuOHgowwTNUjXYmvfHezQs5DiP%2BBTKnTqM2tIGJrAQ4doZJXneQQyiYneOemge%2FSNXCOmxarA%3D%3D",  // 요청 URL
//		url : "mountain.do",
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
		list+='<li>'+$(this).find('mntilistno').text()+'</li>'; //산코드
		list+='<li>'+$(this).find('mntiadd').text()+'</li>'; //소재지
		list+='<li>'+$(this).find('mntiadmin').text()+'</li>'; // 관리주체명
		list+='<li>'+$(this).find('mntiadminnum').text()+'</li>'; // 관리자 전화번호
		list+='<li>'+$(this).find('mntidetails').text()+'</li>'; //상세정보
		list+='<li>'+$(this).find('mntilistno').text()+'</li>'; //산코드
		list+='<li>'+$(this).find('mntiname').text()+'</li>'; //산명
		list+='<li>'+$(this).find('mntihigh').text()+'</li>'; //산높이
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
<div>
    <div>
        <form id="searchFrm">
            한 페이지에 10개씩 출력됨 <br />
            <select id="startNum">
                <option value="1">1페이지</option>
                <option value="11">2페이지</option>
                <option value="21">3페이지</option>
                <option value="31">4페이지</option>
                <option value="41">5페이지</option>
            </select>
            <input type="text" id="keyword" placeholder="검색어를 입력하세요." />
            <button type="button" id="searchBtn">검색 요청</button>
        </form>
    </div>
    <div class="row" id="searchResult">
        여기에 검색 결과가 출력됩니다.
    </div>
</div>
</body>
</html>