<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<script src="join.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="./css/UserModifyForm.css?v=1" rel="stylesheet">

<head>

<meta charset="UTF-8">

<title>UserModifyForm</title>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="https://apis.google.com/js/platform.js?onload=init" asyncdefer></script>

<!-- 네이버 스크립트 -->

<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<meta name="google-signin-client_id"
	content="428109481500-p5a4ij83ptb1tn9iuf4lhiea1rdg4r31.apps.googleusercontent.com">

<script>
	function sample4_execDaumPostcode() {

		new daum.Postcode(
				{

					oncomplete : function(data) {

						var roadAddr = data.roadAddress;

						var extraRoadAddr = '';

						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {

							extraRoadAddr += data.bname;

						}

						if (data.buildingName !== '' && data.apartment === 'Y') {

							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);

						}

						if (extraRoadAddr !== '') {

							extraRoadAddr = ' (' + extraRoadAddr + ')';

						}

						document.getElementById('sample4_postcode').value = data.zonecode;

						document.getElementById("sample4_roadAddress").value = roadAddr;

						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						if (roadAddr !== '') {

							document.getElementById("sample4_extraAddress").value = extraRoadAddr;

						} else {

							document.getElementById("sample4_extraAddress").value = '';

						}

						var guideTextBox = document.getElementById("guide");

						if (data.autoRoadAddress) {

							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;

							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {

							var expJibunAddr = data.autoJibunAddress;

							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

							guideTextBox.style.display = 'block';

						} else {

							guideTextBox.innerHTML = '';

							guideTextBox.style.display = 'none';

						}

					}

				}).open();

	}

	////////로그인코드 

	Kakao.init('91eb9746baaae2684626b5e813d88647'); //발급받은 키 중 javascript키를 사용해준다.

	console.log(Kakao.isInitialized()); // sdk초기화여부판단

	let id;

	//카카오로그인

	function kakaoLogin() {

		Kakao.Auth.login({

			success : function(response) {

				Kakao.API.request({

					url : '/v2/user/me',

					success : function(response) {

						let accessToken = Kakao.Auth.getAccessToken();

						Kakao.Auth.setAccessToken(accessToken);

						console.log(accessToken)

					},

					fail : function(error) {

						console.log(error)

					},

				})

			},

			fail : function(error) {

				console.log(error)

			},

		})

	}

	///구글로그인

	function init() {

		gapi
				.load(
						'auth2',
						function() {

							gapi.auth2.init();

							options = new gapi.auth2.SigninOptionsBuilder();

							options.setPrompt('select_account');

							// 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가

							options
									.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');

							// 인스턴스의 함수 호출 - element에 로그인 기능 추가

							// GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들

							gapi.auth2.getAuthInstance().attachClickHandler(
									'GgCustomLogin', options, onSignIn,
									onSignInFailure);

						})

	}

	function onSignIn(googleUser) {

		var access_token = googleUser.getAuthResponse().access_token

		$.ajax({

			// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.

			url : 'https://people.googleapis.com/v1/people/me'

			// key에 자신의 API 키를 넣습니다.

			,
			data : {
				personFields : 'birthdays',
				key : 'AIzaSyAZjIOXbs7-iArgkiOptcMHx0nNc3K6e5U',
				'access_token' : access_token
			}

			,
			method : 'GET'

		})

		.done(function(e) {

			//프로필을 가져온다.

			var profile = googleUser.getBasicProfile();

			console.log(profile)

		})

		.fail(function(e) {

			console.log(e);

		})

	}

	function onSignInFailure(t) {

		console.log(t);

	}

	var testPopUp;

	function openPopUp() {

		testPopUp = window.open("https://nid.naver.com/nidlogin.logout",
				"_blank",
				"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");

	}

	function closePopUp() {

		testPopUp.close();

	}

	function naverLogout() {

		openPopUp();

		setTimeout(function() {

			closePopUp();

		}, 1000);

	}

	////reset 버튼 

	function aa() {

		$("#joinform")[0].reset();

	}
	

</script>

</head>

<body>
 <%@ include file="Navi.jsp" %>

	<div class="container">

		<h1>modify</h1>
		<h5>아이디와 이름은 수정하실수 없습니다!</h5>

		<ul class="links">

			<li><a href="./LoginForm.jsp" id="signin">login</a></li>

			<li><a href="./RegisterForm.jsps" id="signup">join</a></li>

			<li><a href="javascript:aa()" id="reset">RESET</a></li>

		</ul>



		<form id="joinform" action="./user?mode=Modify" method="post"
			onsubmit="return joinform_check()">

			<div class="email">

				<input type="text" placeholder="e-mail" id="email" name="email" class="read" value="${uto.id.split('@')[0] }" required readonly>
				<h5>@</h5>
				<input type="text" class="read" id="email1" name="email1" value="${uto.id.split('@')[1] }" readonly > 
				
				<select name="emailAddr" id="email2" onchange="changeemail();">

					<option value="" disabled selected>선택해주세요</option>

					<option value="naver.com" ${ "naver.com"== uto.id.split("@")[1] ? "selected" : ""} >naver.com</option>

					<option value="gmail.com" ${ "gmail.com"== uto.id.split("@")[1] ? "selected" : ""}>gmail.com</option>

					<option value="daum.net" ${ "daum.com"== uto.id.split("@")[1] ? "selected" : ""}>daum.com</option>

				</select> 

			</div>

			<div class="input__block">

				<input type="password" placeholder="Password" class="input"
					id="password" name="password" value="${uto.password }"/>

			</div>

			<div class="jumin">

				<input type="text" id="pNumber" placeholder="주민등록번호 ex)990121" name="pNumber" value="${uto.pNumber }" required> 
				<select name="gender" id="gender">

					<option value="male">남자</option>

					<option value="female">여자</option>

				</select>

			</div>

			<div>

				<input type="text" id="sample4_postcode" placeholder="우편번호" name="postcode" value="${uto.addr1 }"> 
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddress"value="${uto.addr2 }">
				<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" value="" name="jibunAddress"> 
				<span id="guide" style="color: #999; display: none"></span>

				<!--<input type="text" id="sample4_detailAddress" placeholder="상세주소"> -->

				<!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->

			</div>

			<div id="postnum">

				<input type="button" id="post" onclick="sample4_execDaumPostcode()"
					value="우편번호 찾기">

			</div>

			<div class="nickname">
	            <input type="text" id="nname" placeholder="닉네임" name="nickName" value="${uto.nickName }">
	            <button type="button" id="nickNameChk">중복체크</button>
	            <div id="msg"></div>
	        </div>
			<div>

				<input type="text" class="read" id="name" placeholder="이름" name="name" value="${uto.name }" readonly >

			</div>

			<div>

				<input type="text" id="ppnumber" placeholder="핸드폰번호 "name="phone" value="${uto.phone }">

			</div>

			<div class="button_container">

				<button class="btnt">
					<span>modify</span>
				</button>

			</div>

		</form>

		
<script>

//닉네임 중복체크
$("#nickNameChk").click(function() {
	let nickName = $("#nname").val();
	if(nickName.trim() == '') {
		alert("닉네임을 입력해주세요.");
		return;
	}
	$.ajax({
        type:'GET',       // 요청 메서드
        url: './user?nickName='+nickName+"&mode=idchk",  // 요청 URI	
        success : function(result){ // 요청이 성공일 때 실행되는 이벤트
        	if(result == 1) {
        		$("#msg").text("중복입니다");
        		$("#msg").css("color","red");
        		$("#msg").css("text-align","center");
        		$("#msg").css("line-height","49px");
        	}
        	else {
        		$("#msg").text("사용가능");
        		$("#msg").css("color","blue");
        		$("#msg").css("text-align","center");
        		$("#msg").css("line-height","49px");
        	}
        },
        error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) } // 에러가 발생했을 때, 호출될 함수
    }); // $.ajax()
});
</script>
</body>

</html>