<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인화면</title>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
<link href="./Main.css?v=1" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    

<body>
    
        <nav class="navbar">
            <div class="navbar_logo">
                <i class="fa-solid fa-mountain-sun"></i>
                <a class="link" href="#">MGM</a>
            </div>
    
            <ul class="navbar_menu">
                <li><a class="link" href="#" >홈페이지 소개</a></li>
                <li><a class="link" href="./List.jsp">산 소개</a></li>
                <li><a class="link" href="#">자유 게시판</a></li>
                <li><a class="link" href="#">인증 게시판</a></li>
                <li><a class="link" href="#">듀오 게시판</a></li>
                <li><a class="link master" href="#">회원 관리 페이지</a></li>
            </ul>
        
            <ul class="navbar_login">
                <li><a class="link" href="#">로그인</a></li>
                <li><a class="link" href="#">회원가입</a></li>
            </ul>
        </nav>
        <!-- 메인 네비게이션 -->
        <section>
            <div class="slideshow-container">
                <div class="mySlides fade">
                 
                    <img src="https://www.newsro.kr/wp-content/uploads/2017/06/3.%EC%A0%84%EC%8B%9C%EB%8C%80%ED%91%9C%EC%82%AC%EC%A7%84%EB%B6%81%ED%95%9C%EC%82%B0-2013-91cmx61cm.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="https://littlerobin.nz/wp-content/uploads/2021/10/P6200152.jpg" style="width:100%">
                </div>
                <div class="mySlides fade">
                    <img src="https://d1hjkbq40fs2x4.cloudfront.net/2016-04-22/files/under-the-light-sample_1252-3.jpg" style="width:100%">
                </div>
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            
            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>
        </section>
        <!-- 메인 슬라이드 -->

       


        <div class="mountain-title">
            <h2>새로 등록된 산 목록</h2>
        </div>
        
          <div class="slide-container">
            <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150206_32%2F1423209922220INc4C_JPEG%2F%25BC%25AD%25BF%25EF_%25B3%25B2%25BB%25EA%25BC%25B3%25B0%25E6_1.JPG%3Ftype%3Dm500_500" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-primary">New</span>
                    <h4 class="mt-2">남산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>서울 중구 회현동1가</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>02-3783-5900</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA0MDNfMTgx%2FMDAxNjgwNDgyNTYwNzUx.CXLGBAXu4H6PEYtbEbfppV8W0eXJB1J5qmZ2FsBZ2p8g.ikY1fPLUw_g8Bt8Zk8aNcdqNZIeGU3M-XzwVoRFISkQg.JPEG.cerealbar%2FR0006530.JPG&type=sc960_832" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-primary">New</span>
                    <h4 class="mt-2">소요산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>경기 동두천시 평화로2910</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>031-860-2065</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200706_290%2F1593987623634jSK9x_JPEG%2F6dMGIq0QpLIM97k7SEfSrMHF.jpg" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-primary">New</span>
                    <h4 class="mt-2">도봉산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>서울 도봉구 도봉동</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>02-954-2566</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzFfMTY3%2FMDAxNTE0NzA3OTY2ODUz.ZiDCgygsiBATZWfJe24qCCK-cV5He0APUv6paM0xjJAg.hSaESDdesfmWysTsXj14ea1M6cOuLxmDLbIgsk9MqK4g.JPEG.kosh9767%2FDSC09718.JPG%23900x601" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-primary">New</span>
                    <h4 class="mt-2">수락산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>서울 노원구 상계동</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>02-950-3900</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MDNfMTI2%2FMDAxNjIwMDM5OTMwNDA3.aHJari00pknJm_8tVsJt1rRG1JEFjkWM6tzg_uS9lQAg.PMsFLa12Lw0Yjl5oCfC_BngPWe_usMgYeiIFkZJCucsg.JPEG.csj1381%2F20210502%25A3%25DF132351.jpg&type=sc960_832" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-primary">New</span>
                    <h4 class="mt-2">명지산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>경기 가평군 북면</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>031-582-0103</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20140407_169%2F1396853504900VqxnW_JPEG%2F%25BC%25AD%25BF%25EF_%25BA%25CF%25C7%25D1%25BB%25EA_10.jpg%3Ftype%3Dm500_500" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-primary">New</span>
                    <h4 class="mt-2">북한산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>고양시 덕양구 대서문길 </p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>04:00 - 17:00</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>02-909-0497</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA5MTJfMjQ4%2FMDAxNjYyOTY5MTczNzQx.V-eRv9l1NNszcdPzOx0bPrZF62ERXEcRbmg0iRupJDQg.T3uJxusR3cVw-iIwpDLJMl3Utk_HDNHhWehOmgsG62sg.JPEG.pcm017%2FDSC01327.jpg&type=sc960_832" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-primary">New</span>
                    <h4 class="mt-2">관악산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>경기 과천시 중앙동</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i></p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
              <div class="card shadow">
                <img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150206_32%2F1423209922220INc4C_JPEG%2F%25BC%25AD%25BF%25EF_%25B3%25B2%25BB%25EA%25BC%25B3%25B0%25E6_1.JPG%3Ftype%3Dm500_500" class="card-img-top">
                <div class="card-body">
                  <span class="badge rounded-pill bg-primary">New</span>
                  <h4 class="mt-2">남산</h4>
                  <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>서울 중구 회현동1가</p>
                  <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                  <p class="card-text"><i class="fa-solid fa-phone i-con"></i>02-3783-5900</p>
                </div>
              </div>
           </div>
           
        </div>
        <!-- 새로 등록된 산 -->
        
        <div class="mountain-title">
            <h2>종아요 높은 산</h2>
        </div>

        <div class="slide-container">
            <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20150206_32%2F1423209922220INc4C_JPEG%2F%25BC%25AD%25BF%25EF_%25B3%25B2%25BB%25EA%25BC%25B3%25B0%25E6_1.JPG%3Ftype%3Dm500_500" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-danger">Hit</span>
                    <h4 class="mt-2">남산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>서울 중구 회현동1가</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>02-3783-5900</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20140407_169%2F1396853504900VqxnW_JPEG%2F%25BC%25AD%25BF%25EF_%25BA%25CF%25C7%25D1%25BB%25EA_10.jpg%3Ftype%3Dm500_500" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-danger">Hit</span>
                    <h4 class="mt-2">북한산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>고양시 덕양구 대서문길</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>04:00 - 17:00</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>02-909-0497</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200706_290%2F1593987623634jSK9x_JPEG%2F6dMGIq0QpLIM97k7SEfSrMHF.jpg" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-danger">Hit</span>
                    <h4 class="mt-2">도봉산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>서울 도봉구 도봉동</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>02-954-2566</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
                <div class="card shadow">
                  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzEyMzFfMTY3%2FMDAxNTE0NzA3OTY2ODUz.ZiDCgygsiBATZWfJe24qCCK-cV5He0APUv6paM0xjJAg.hSaESDdesfmWysTsXj14ea1M6cOuLxmDLbIgsk9MqK4g.JPEG.kosh9767%2FDSC09718.JPG%23900x601" class="card-img-top">
                  <div class="card-body">
                    <span class="badge rounded-pill bg-danger">Hit</span>
                    <h4 class="mt-2">수락산</h4>
                    <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>서울 노원구 상계동</p>
                    <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                    <p class="card-text"><i class="fa-solid fa-phone i-con"></i>02-950-3900</p>
                  </div>
                </div>
             </div>
             <div class="container" style="width: 50%;">
              <div class="card shadow">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA5MTJfMjQ4%2FMDAxNjYyOTY5MTczNzQx.V-eRv9l1NNszcdPzOx0bPrZF62ERXEcRbmg0iRupJDQg.T3uJxusR3cVw-iIwpDLJMl3Utk_HDNHhWehOmgsG62sg.JPEG.pcm017%2FDSC01327.jpg&type=sc960_832" class="card-img-top">
                <div class="card-body">
                  <span class="badge rounded-pill bg-danger">Hit</span>
                  <h4 class="mt-2">관악산</h4>
                  <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>경기 과천시 중앙동</p>
                  <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                  <p class="card-text"><i class="fa-solid fa-phone i-con"></i></p>
                </div>
              </div>
           </div>
             <div class="container" style="width: 50%;">
              <div class="card shadow">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MDNfMTI2%2FMDAxNjIwMDM5OTMwNDA3.aHJari00pknJm_8tVsJt1rRG1JEFjkWM6tzg_uS9lQAg.PMsFLa12Lw0Yjl5oCfC_BngPWe_usMgYeiIFkZJCucsg.JPEG.csj1381%2F20210502%25A3%25DF132351.jpg&type=sc960_832" class="card-img-top">
                <div class="card-body">
                  <span class="badge rounded-pill bg-danger">Hit</span>
                  <h4 class="mt-2">명지산</h4>
                  <p class="card-text"><i class="fa-solid fa-location-dot i-con"></i>경기 가평군 북면</p>
                  <p class="card-text"><i class="fa-solid fa-clock i-con"></i>연중무휴</p>
                  <p class="card-text"><i class="fa-solid fa-phone i-con"></i>031-582-0103</p>
                </div>
              </div>
           </div>
        </div>

        <!--좋아요 산 슬라이드 -->

        
        <footer class="footer">
            <div class="footer-bg">
                <div class="footer-top">
                    <div class="navbar_logo">
                        <i class="fa-solid fa-mountain-sun"></i>
                        <a class="link" href="#">MGM</a>
                    </div>
                    <div class="addres">
                        <p><i class="fa-solid fa-location-dot i-con"></i>주소 : 충북 청주시 서원구 사직대로 109, 4층, 5층 </p>
                        <p><i class="fa-solid fa-phone i-con"></i>대표번호 : 043.225.2111</p>
                    </div>
                    <div class="sns-icon">
                        <a href="#"><i class="fa-brands fa-facebook i-con"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram i-con con-pink"></i></a>
                        <a href="#"><i class="fa-brands fa-youtube i-con con-red"></i></a>
                    </div>
                </div>
                <ul class="footer-middle">
                    <li><a href="#">이용약관</a></li>
                    <li><h5>|</h5></li>
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><h5>|</h5></li>
                    <li><a href="#">위치정보서비스</a></li>
                    <li><h5>|</h5></li>
                    <li><a href="#">개인정보수집·이용·제공동의</a></li>
                </ul>
                <div class="footer-bottom">
                    <p>Copyright 2023 © MGM Inc. all rights reserved.</p>
                </div>
            </div>
            
        </footer>

        <!-- 푸터 -->
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script>
            let slideIndex = 0;
            showSlides();
            
            function showSlides() {
              let i;
              let slides = document.getElementsByClassName("mySlides");
              let dots = document.getElementsByClassName("dot");
              for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
              }
              slideIndex++;
              if (slideIndex > slides.length) {slideIndex = 1}    
              for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
              }
              slides[slideIndex-1].style.display = "block";  
              dots[slideIndex-1].className += " active";
              setTimeout(showSlides, 2000); 
            }

           


        </script>


    
</body>
</html>











