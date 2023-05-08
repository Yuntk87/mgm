<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul {
		border: 1px solid #999;
	}
</style>
</head>
<body>
	<div>
		<div>
			<form id="searchFrm">
				한페이지에 10개씩 출력<br>
				<select id="startNum">
					<option value="1">1페이지</option>
					<option value="2">2페이지</option>
					<option value="3">3페이지</option>
					<option value="4">4페이지</option>
					<option value="5">5페이지</option>
				</select>
				<input type="text" id="keyword" placeholder="검색어 입력">
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
				url: "./NaverSearchApi",
				type: "get",
				data : {keyword: $('#keyword').val(), startNum: $('#startNum option:selected').val() },
				dataType: "json",
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
			str +="    <li>" + item.title + "</li>";
			str +="    <li>" + item.description + "</li>";
			str +="    <li>" + item.bloggername + "</li>";
			str +="    <li>" + item.bloggerlink + "</li>";
			str +="    <li>" + item.postdate + "</li>";
			str +="    <li><a href='"+item.link+"' target='_blank'>바로가기</a></li>";
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