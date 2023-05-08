<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#login_box {
		width: 250px;
		height: 250px;
		text-align:center;
		margin:10px auto;
		border: 1px solid #999;
		border-radius: 10px;
	}
	#login_box input {
		margin:10px;
	}
	#title {
		color: rgba(1, 61, 1, 0.836);
		text-weight : bold;
	}
    #login_box button {
          width: 200px;
          height: 30px;
          font-size: 12px;
          font-weight: bold;
          margin-top: 20px;
          border-radius: 5px;
          background: rgba(1, 61, 1, 0.836);
          color: #fff;
    }
    #msg {
    	color:red;
    	font-size:8px;
    }
    a {
    	font-size:5px;
    	margin-left:10px;
    	text-decoration: none;
    	color:black;
    }
</style>
</head>
<body>

	<div id="login_box">
		<form action="./login" method="post" onsubmit="return formCheck(this)">
			<h3 id="title">StudyLog</h3>
			<div id="msg"></div>
			<input type="text" name="id" placeholder="아이디 입력" value="${rememberId }" autofocus>
			<input type="password" name="pass" placeholder="비밀번호 입력">
			<button type="submit">로그인</button>
			<div id="link">
				<label class="lin"><input type="checkbox" name="rememberId" ${check }>아이디기억</label>
				<a href="./register">회원가입</a>
			</div>
<%-- 			<input type="hidden" name="toUri" value="${empty param.toUri? './main' : param.toUri }"> --%>
		</form>
	</div>
	
	<script>
	
		if(${param.loginError != null}) {
			document.querySelector("#msg").innerHTML = "로그인 실패<br>아이디와 비밀번호를 확인하세요.";
		}
		
		
		function formCheck(frm) {
			if ((frm.id.value.length==0) && (frm.pass.value.length==0)) {
				setMessage("아이디&비밀번호를 입력하세요.",frm.id);
				return false;
			}
			if(frm.id.value.length==0) {
				setMessage("아이디를 입력하세요.",frm.id);
				return false;
			}
			if(frm.pass.value.length==0) {
				setMessage("비밀번호를 입력하세요.",frm.pass);
				return false;
			}
			return true;
		}
		
		function setMessage(msg, element) {
			document.getElementById("msg").innerHTML = msg;
			if(element) {
				element.select;
			}
		}		
</script>
</body>
</html>