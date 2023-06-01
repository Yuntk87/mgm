<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="./js/RegisterForm.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="./css/RegisterForm.css" rel="stylesheet">

<head>

    <meta charset="UTF-8">

    <title>RegisterForm</title>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

    <script src="https://apis.google.com/js/platform.js?onload=init" asyncdefer></script>

    <!-- 네이버 스크립트 -->

    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

    <meta name="google-signin-client_id" content="428109481500-p5a4ij83ptb1tn9iuf4lhiea1rdg4r31.apps.googleusercontent.com">

    <script>
        function sample4_execDaumPostcode() {

            new daum.Postcode({

                oncomplete: function(data) {

                    var roadAddr = data.roadAddress;

                    var extraRoadAddr = '';

                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {

                        extraRoadAddr += data.bname;

                    }

                    if (data.buildingName !== '' && data.apartment === 'Y') {

                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' +
                            data.buildingName : data.buildingName);

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

                        var expRoadAddr = data.autoRoadAddress +
                            extraRoadAddr;

                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' +
                            expRoadAddr + ')';

                        guideTextBox.style.display = 'block';

                    } else if (data.autoJibunAddress) {

                        var expJibunAddr = data.autoJibunAddress;

                        guideTextBox.innerHTML = '(예상 지번 주소 : ' +
                            expJibunAddr + ')';

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

                success: function(response) {

                    Kakao.API.request({

                        url: '/v2/user/me',

                        success: function(response) {

                            let accessToken = Kakao.Auth.getAccessToken();

                            Kakao.Auth.setAccessToken(accessToken);

                            console.log(accessToken)

                        },

                        fail: function(error) {

                            console.log(error)

                        },

                    })

                },

                fail: function(error) {

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

                    url: 'https://people.googleapis.com/v1/people/me'

                        // key에 자신의 API 키를 넣습니다.

                        ,
                    data: {
                        personFields: 'birthdays',
                        key: 'AIzaSyAZjIOXbs7-iArgkiOptcMHx0nNc3K6e5U',
                        'access_token': access_token
                    }

                    ,
                    method: 'GET'

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

        <div class="home">


            <div>
                <h1>join</h1>
            </div>
        </div>



        <ul class="links">

            <li><a href="" id="signin">login</a></li>

            <li><a href="#" id="signup">join</a></li>

            <li><a href="javascript:aa()" id="reset">RESET</a></li>

        </ul>

        <!-- Form -->

        <form id="joinform" action="./register" method="post">

            <div class="email">

                <input type="text" placeholder="e-mail" id="email" name="email" required>
                <h5>@</h5>
                <input type="text" id="email1" name="email1">

                <select name="emailAddr" id="email2" onchange="changeemail();">

                    <option value="" disabled selected>선택해주세요</option>

                    <option value="naver.com">naver.com</option>

                    <option value="gmail.com">gmail.com</option>

                    <option value="daum.net">daum.com</option>

                </select>

            </div>

            <div class="input__block">

                <input type="password" placeholder="Password" class="input" id="password" name="password" /><i class="fa fa-eye-slash fa-lg"></i>

            </div>

            <div class="jumin">

                <input type="text" id="pNumber" placeholder="주민등록번호 ex)990121" name="pNumber" required>
                <select name="gender" id="gender">

                    <option value="male">남자</option>

                    <option value="female">여자</option>

                </select>

            </div>

            <div>

                <input type="text" id="sample4_postcode" placeholder="우편번호" name="postcode">
                <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddress">
                <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" value="" name="jibunAddress">
                <span id="guide" style="color: #999; display: none"></span>

                <!--<input type="text" id="sample4_detailAddress" placeholder="상세주소"> -->

                <!-- <input type="text" id="sample4_extraAddress" placeholder="참고항목"> -->

            </div>

            <div id="postnum">

                <input type="button" id="post" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">

            </div>

            <div class="nickname">
                <input type="text" id="nname" placeholder="닉네임" name="nickName">
                <button type="button" id="nickNameChk">중복체크</button>
                <div id="msg"></div>
            </div>
            <div>

                <input type="text" id="name" placeholder="이름" name="name">

            </div>

            <div>

                <input type="text" id="ppnumber" placeholder="핸드폰번호 " name="phone">

            </div>

            <div class="button_container">

                <button class="bttn" type="button" onclick="joinform_check()">
                    <span>join</span>
                </button>

            </div>

        </form>

        <div class="separator">

            <p>OR</p>

        </div>

        <div class="picture">

            <%@ include file='../startnaverlogin.jsp'%>

            <li id="GgCustomLogin"><a href="javascript:void(0)" onclick=""><img src="./img/startgoogle.gif"></a></li>
            <li onclick="kakaoLogin();"><a href="javascript:void(0)"> <img src="./img/startkakao.gif">

                </a></li>

        </div>
    </div>
    <script>
        function joinform_check() {

            var id = document.getElementById("email1");
            var pwd = document.getElementById("password");
            var pnumber = document.getElementById("pNumber");
            var gender = document.getElementById("gender")
            var postnumber = document.getElementById("sample4_postcode");
            var roadaddress = document.getElementById("sample4_roadAddress");
            var jibun = document.getElementById("sample4_jibunAddress");
            var nname = document.getElementById("nname");
            var agree = document.getElementById("agree");
            var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;


            let regx2 = /^([0-9]){6}$/ //숫자만 입력하는 정규식

            if (id.value == "") {
                alert("이메일 주소를 입력하세요.");
                id.focus();
                return false;
            }



            if (pwd.value == "") {
                alert("비밀번호를 입력하세요.");
                pwd.focus();
                return false;
            }

            //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식

            if (!pwdCheck.test(pwd.value)) {
                alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
                pwd.value = "";
                pwd.focus();
                return false;
            }


            if (pnumber.value == "") {
                alert("주민번호를 입력하세요.");
                pnumber.focus();
                return false;
            }


            let regx = /^([0-4]){1}$/
            if (!regx2.test(pnumber.value)) {
                console.log("==========" + regx.test(pnumber.value))
                alert("주민번호는 숫자만 입력할 수 있습니다.");
                pnumber.focus();
                return false;
            }

            myalert();


        }

        function myalert() {

            Swal.fire({
                icon: 'success',
                title: '회원가입이 완료되었습니다.',
                text: '환영합니다😁'
            }).then((result) => {
                console.log("-------------")
                document.querySelector("#joinform").submit();
            })

        }
        //이메일 옵션 선택후 주소 자동 완성
        function changeemail() {
            var email_add = document.getElementById("email1");
            var email_sel = document.getElementById("email2");

            //지금 골라진 옵션의 순서와 값 구하기
            var idx = email_sel.options.selectedIndex;
            var val = email_sel.options[idx].value;

            email_add.value = val;
        }
        //닉네임 중복체크
        $("#nickNameChk").click(function() {
            let nickName = $("#nname").val();
            if (nickName.trim() == '') {
                alert("닉네임을 입력해주세요.");
                return;
            }
            $.ajax({
                type: 'GET', // 요청 메서드
                url: './register?nickName=' + nickName + "&mode=idchk", // 요청 URI	
                success: function(result) { // 요청이 성공일 때 실행되는 이벤트
                    if (result == 1) {
                        $("#msg").text("중복입니다");
                        $("#msg").css("color", "red");
                        $("#msg").css("text-align", "center");
                        $("#msg").css("line-height", "50px");

                    } else {
                        $("#msg").text("사용가능합니다");
                        $("#msg").css("color", "blue");
                        $("#msg").css("text-align", "center");
                        $("#msg").css("line-height", "50px");
                    }
                },
                error: function(request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $(document).ready(function() {
            $('.input__block  i').on('click', function() {
                $('input').toggleClass('active');
                if ($('input').hasClass('active')) {
                    $(this).attr('class', "fa fa-eye fa-lg")
                        .prev('input').attr('type', "text");
                } else {
                    $(this).attr('class', "fa fa-eye-slash fa-lg")
                        .prev('input').attr('type', 'password');
                }
            });
        });
    </script>

</body>

</html>