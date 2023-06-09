<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>로그인화면</title>
    <link href="./css/LoginForm.css?v=1" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://kit.fontawesome.com/bb8da17f44.js" crossorigin="anonymous"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <!-- 네이버 스크립트 -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <meta name="google-signin-client_id" content="428109481500-p5a4ij83ptb1tn9iuf4lhiea1rdg4r31.apps.googleusercontent.com">

    <script>
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
            gapi.load('auth2', function() {
                gapi.auth2.init();
                options = new gapi.auth2.SigninOptionsBuilder();
                options.setPrompt('select_account');
                // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
                options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
                // 인스턴스의 함수 호출 - element에 로그인 기능 추가
                // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
                gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
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
                    },
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


        //네이버로그인



        var naverLogin = new naver.LoginWithNaverId({
            clientId: "mQgXrilwE0QmdnVcFS21", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
            callbackUrl: "http://localhost:8081/naverlogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
            isPopup: false,
            callbackHandle: true
        });

        naverLogin.init();

        window.addEventListener('load', function() {
            naverLogin.getLoginStatus(function(status) {
                if (status) {
                    var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.

                    console.log(naverLogin.user);

                    if (email == undefined || email == null) {
                        alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                        naverLogin.reprompt();
                        return;
                    }
                } else {
                    console.log("callback 처리에 실패하였습니다.");
                }
            });
        });


        var testPopUp;

        function openPopUp() {
            testPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
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
//reset버튼 클릭시 from에 입력된0번째가 RESET될수있게함
        function aa() {

            $("#frm-reset")[0].reset();
        }

      ///비밀번호 보여주는 눈 클릭했을때 
        //active클래스를 붙이고 만약 active 클래스가 있으면
        //클릭한 속성값을 변경시켜 icon을 변경하고,
        //클릭아이콘의 이전인 input의 타입을 text로 변경하여 비밀번호가 보일수있게함 
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

</head>

<body>
    <%@ include file="Navi.jsp" %>

    <div class="container">
        <!-- Heading -->
        <h1>login</h1>

        <!-- Links -->
        <ul class="links">
            <li>
                <a href="./RegisterForm.jsp" id="signin">join</a>
            </li>
            <li>
                <a href="./ForgetId.jsp" id="signup">forget</a>
            </li>
            <li>
                <a href="javascript:aa()" id="reset">RESET</a>
            </li>


        </ul>

        <!-- Form -->
        <form id="frm-reset" action="./login" method="post">

            <div class="first-input input__block first-input__block">
                <input type="text" placeholder="id" class="input" id="id" name="id" />
            </div>

            <div class="input__block">
                <input type="password" placeholder="Password" class="input" id="password" name="pass" /> <i class="fa fa-eye-slash fa-lg"></i>

            </div>


            <div class="button_container">

                <button class="bttn"><span>login</span></button>

            </div>
        </form>

        <div class="separator">
            <p>OR</p>
        </div>
        <div class="picture">

            <!--네이버로그인  -->
            <%@ include file='../naverlogin.jsp'%>





            <!--구글로그인  -->
            <li id="GgCustomLogin">
                <a href="javascript:void(0)" onclick=""><img src="./img/google.png"></a>
            </li>

            <li onclick="kakaoLogin();">
                <a href="javascript:void(0)">
                    <img src="./img/kakao.png">
                </a>
            </li>


        </div>



</body>

</html>