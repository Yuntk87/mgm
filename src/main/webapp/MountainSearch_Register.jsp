<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="./css/MountainSearch_Register.css">
    <title>MountainSearch_Register</title>
  </head>
  <body>
 <%@ include file="Navi.jsp" %>

	<div class="container">
		<div class="search-bar">
			<form class="d-flex" >
				<input class="form-control me-2" id="keyword" type="search" placeholder="산 검색" aria-label="Search">
				<button class="btn btn-outline-secondary" id="searchBtn"  type="button"><i class="fa-solid fa-magnifying-glass i-con"></i></button>
			</form>
		</div>
		
		<div class="card">
			<div class="menu">
				<div>
					 <a class="back-btn" href="#"><i  class="fa-solid fa-angles-left top"></i></a>
				</div>
				<div class="searchName"></div>
				<div><span>레벨</span></div>
			</div>
			<img src="https://source.unsplash.com/random/?mountain" class="card-img-top" alt="...">
			<div class="card-body" style="background-color: lightgray;">
				<div>
					<h5 class="card-title searchName"></h5>
					<i class="fa-solid fa-location-dot" style="line-height: 100px;"></i>
					<span class="card-text resultAddress"></span>
				</div>
				<div>
					
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
				<div class="card-body result" id="searchResult" >
				
				</div>
			  </li>
			</ul>
			
		  </div>
		  <div style="height:500px"></div>
        <form action="./m_register" method="post" onsubmit="return formCheck(this)">
            <table class="table">
                <tr>
                    <th class="table-secondary" colspan="6" style="text-align: center;">산 등록 페이지</th>
                </tr>
            </table>
            <table class="table" >
                <thead>
                  <tr>
                    <th scope="col" style="color: white;">#</th>
                    <th scope="col" style="color: white;">이름</th>
                    <th scope="col" style="color: white;">주소(1)</th>
                    <th scope="col" style="color: white;">주소(2)</th>
                    <th scope="col" style="color: white;">레벨(1~5)</th>
                    <th scope="col" style="color: white;">추천</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row"></th>
                    <td><input type="text" id="m_name" value="" name="m_name" placeholder="이름"></td>
                    <td><input type="text" id="m_addr_do"  name="m_addr_1" placeholder="주소(1)"></td>
                    <td><input type="text" id="m_addr_si"  name="m_addr_2" placeholder="주소(2)"></td>
                    <td><input type="number" min="1" max="5" id="level" name="level" placeholder="레벨"></td>
                    <td><input type="text" id="m_recommend" name="m_recommend" placeholder="추천수"></td>
                  </tr> 
                </tbody>
            </table>
            <table class="table">
                <tr>
                    <th class="table-secondary" colspan="8" style="text-align: right;"><button type="submit">등록하기</button></th>
                </tr>
            </table>
        </form>
	</div>
	
	<script>
	function formCheck(form) {
		if (form.m_name.value.trim() == "") {
			alert("산이름 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.m_addr_1.value.trim() == "") {
			alert("주소(1) 입력하세요");
			form.content.focus();
			return false;
		}
		if (form.m_addr_2.value.trim() == "") {
			alert("주소(2) 입력하세요");
			form.content.focus();
			return false;
			
		}
		if (form.level.value.trim() == "") {
			alert("레벨을 입력하세요");
			form.content.focus();
			return false;
			
		}
	}
	</script>


    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	
		 $(function() {
       	 $('#searchBtn').click(function() {
       	     let keyword = $('#keyword').val();
       	     $.ajax({
       	         url: "./api?keyword="+keyword, // 요청 URL
       	         type: "get", // HTTP 메서드
       	         dataType: "xml", // 응답 데이터 형식
       	         success: sucFuncJson1, // 요청 성공 시 호출할 메서드 설정,
       	         error: errFunc // 요청 실패 시 호출할 메서드 설정
        	    });
       		 });
    	});
		
		$(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson2, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
		$(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson3, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
		$(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson4, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
		
		$(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson5, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
		function sucFuncJson1(d) {
            console.log(d)
            var list = '';       
            $(d).find('item').each(function(index, item) {
				list+='<h2>'+$(this).find('mntnnm').text()+'</h2>'; //산명
				temp = $(this).find('mntnnm').text().split(' ');
				$('input[name=m_name]').attr('value', temp[0]);
            });
            $('.searchName').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
		
        // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson2(d) {
            console.log(d)
            var list = '';
       
            $(d).find('item').each(function(index, item) {               
                list+='<p>'+$(this).find('mntninfodtlinfocont').text()+'</p>'; //상세정보 산               
                
                temp = $(this).find('mntninfopoflc').text().split(' ');
                
                $('input[name=m_addr_1]').attr('value', temp[0]);
                $('input[name=m_addr_2]').attr('value', temp[1]);
            });
            $('#searchResult').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
     // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson3(d) {
            console.log(d)
            var list = '';
         
            $(d).find('item').each(function(index, item) {         
                list+='위치 : '+$(this).find('mntninfopoflc').text(); //소재지           
            });
            $('.resultAddress').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
     // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson4(d) {
            console.log(d)
            var list = '';
   
            $(d).find('item').each(function(index, item) {      
            	list+='높이 : '+$(this).find('mntninfohght').text()+'m'; //산높이      
            });
            $('.resultHeight').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
        
     // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson5(d) {
            console.log(d)
            var list = '';

            $(d).find('item').each(function(index, item) {
            	list+= '산코드 : ' + $(this).find('mntnid').text() ; //산코드             
            });
            $('.resultCode').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
    

		$('button').click(function(){
  		if($(this).hasClass('btn_unlike')){
			$(this).removeClass('btn_unlike');
			$('.ani_heart_m').removeClass('hi');
			$('.ani_heart_m').addClass('bye');
  		}
  		else{
			$(this).addClass('btn_unlike');
			$('.ani_heart_m').addClass('hi');
			$('.ani_heart_m').removeClass('bye');
  		}
  		});
		
		
		
			
			
		
  </script>
<%@ include file="./Footer.jsp" %>   
  </body>
</html>