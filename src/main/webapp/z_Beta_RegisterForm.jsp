<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
    #register_box {
        width: 400px;
        height: 380px;
        padding: 10px;
        text-align: center;
        border: 1px solid #999;
        border-radius: 10px;
        margin: 10px auto;
    }
    #register_box h3 {
        font-size: 20px;
        font-weight: bold;
        color: rgba(1, 61, 1, 0.836);
    }
    #register_box input {
        margin: 5px;
        width: 210px;
    }
    #register_box input::placeholder {
        font-size: 5px;
    }
    #sns_box {
        margin-top: 30px;
        font-size: 10px;
    }
    #sns_box input {
        vertical-align: middle;
        width: 20px;
    }
    #input-submit {
        width: 200px;
        height: 30px;
        font-size: 10px;
        font-weight: bold;
        margin-top: 20px;
        border-radius: 5px;
        background: rgba(1, 61, 1, 0.836);
        color: #fff;
    }
    #msg {
    	height: 10px;
    	font-size: 5px;
    	color: red;
    	margin-bottom:5px;
    }
    .msg {
    	font-size: 5px;
    }
    #idchk {
    	padding:0;
    	font-size: 5px;
    }
</style>
</head>
<body>
	<div id="register_box">
		<form id="user" action="./register" method="post">
			<h3>StudyLog</h3>
			<div id="msg" class="msg">${msg }</div>
			
			<input id="id-field" type="text" name="id" placeholder="아이디 : 4~8자리의 영대소문자와 숫자 조합" value="${udt.id }" autofocus required>
			<button id="idchk" type="button">중복체크</button>
			<div id="id-msg" class="msg"></div>
			<input id="pw-field" type="password" name="pass" placeholder="비밀번호 : 8~12자리의 영대소문자와 숫자 조합" onchange="pwchk()" required>
			<div id="pw-msg" class="msg"></div>
			<input id="cpw-field" type="password" name="cpwd" placeholder="비밀번호 확인" onchange="pwchk()">
			<div id="cpw-msg" class="msg"></div>
			<input id="name-field" type="text" name="name" placeholder="홍길동" value="${udt.name }" required>
			<div id="name-msg" class="msg"></div>
			
			<button id="input-submit" type="submit">회원가입</button>
		</form>
	</div>
	
<script>
	$("#id-field").blur(function() {
		if($("#id-field").val() == "") $("#id-msg").text("필수입력");
		else $("#id-msg").text("");
	});
	$("#pw-field").blur(function() {
		if($("#pw-field").val() == "") $("#pw-msg").text("필수입력");
		else $("#pw-msg").text("");
	});
	$("#name-field").blur(function() {
		if($("#name-field").val() == "") $("#name-msg").text("필수입력");
		else $("#name-msg").text("");
	});

	
	//비밀번호 확인 
	function pwchk() {
		let pw = $("#pw-field").val();
		let cpw = $("#cpw-field").val();
		if(pw != '' && cpw != '') {
			if(pw == cpw) {
				$("#cpw-msg").text("비밀번호 일치");
				$("#cpw-msg").css("color", "blue");
			} else {
				$("#cpw-msg").text("비밀번호 불일치");
				$("#cpw-msg").css("color", "red");
			}
		}
	}
	
	//아이디 중복체크
	$("#idchk").click(function() {
		let id = $("#id-field").val();
		if(id.trim() == '') {
			alert("아이디를 입력해주세요.");
			return;
		}
		$.ajax({
	        type:'GET',       // 요청 메서드
	        url: './register?id='+id+"&mode=idchk",  // 요청 URI	
	        success : function(result){ // 요청이 성공일 때 실행되는 이벤트
	        	if(result == 1) {
	        		$("#id-msg").text("아이디 중복");
	        		$("#id-msg").css("color","red");
	        	}
	        	else {
	        		$("#id-msg").text("사용가능");
	        		$("#id-msg").css("color","blue");
	        	}
	        },
	        error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) } // 에러가 발생했을 때, 호출될 함수
	    }); // $.ajax()
	});


 
</script>
</body>
</html>