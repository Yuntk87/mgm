<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>MountainView</title>
  </head>
  <style>
    body {
        background-color: lightgray;

    }

   .content-box {
    width: 60%;
    margin: 0 auto;
   }
   .btn_like {
    position: relative;
    margin: 10px auto;
    display: block;
    width: 80px;
    height: 80px;
    border: 1px solid #DD5D54;
    border-radius: 44px;
    font-family: notokr-bold,sans-serif;
    font-size: 14px;
    line-height: 16px;
    background-color: white;
    color: #DD5D54;
    transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
    cursor: pointer;
  }
  
  .btn_like:hover {
    border: 1px solid rgba(228,89,89,0.3);
    background-color: rgba(228,89,89,0.02);
  }
  
  .btn_unlike .img_emoti {
      background-position: -30px -120px;
  }
  
  .img_emoti {
      display: inline-block;
      overflow: hidden;
      font-size: 0;
      line-height: 0;
      background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
      text-indent: -9999px;
      vertical-align: top;
      width: 20px;
      height: 17px;
      margin-top: 1px;
      background-position: 0px -120px;
      text-indent: 0;
  }
  
  .btn_like .ani_heart_m {
      margin: -63px 0 0 -63px;
  }
  
  .ani_heart_m {
      display: block;
      position: absolute;
      top: 50%;
      left: 50%;
      width: 125px;
      height: 125px;
      margin: -63px 0 0 -63px;
      pointer-events: none;
  }
  
  .ani_heart_m.hi {
      background-image: url(https://t1.daumcdn.net/cfile/tistory/99ADD94D5B1E40A319?original);
      -webkit-background-size: 9000px 125px;
      background-size: 9000px 125px;
      animation: on_m 1.06s steps(72);
  }
  
  .ani_heart_m.bye {
      background-image: url(https://t1.daumcdn.net/cfile/tistory/99C2A03F5B1E3E7529?original);
      -webkit-background-size: 8250px 125px;
      background-size: 8250px 125px;
      animation: off_m 1.06s steps(66);
  }
  
  @keyframes on_m {
    from { background-position: 0 }
    to { background-position: -9000px }
  }
  
  @keyframes off_m {
    from { background-position: 0 }
    to { background-position: -8250px }
  }
  .btn-box {
    top: 380px;
    right: 400px;
  }

  </style>
  <body>
 <%@ include file="Navi.jsp" %>

    <div class="bg" >
        <div class="content-box">
            <table class="table table-secondary" >
                <tr>
                    <th class="table-secondary" colspan="5" style="text-align: left; color: black;">상세보기(페이지)</th>
                    <td colspan="1" style="text-align: right;">
                        <button class="btn" type="button" onclick="history.back()"><span>목록보기</span></button>
                    </td>
                </tr>
            </table>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">이름</th>
                        <th scope="col">주소_1</th>
                        <th scope="col">주소_2</th>
                        <th scope="col">레벨</th>
                        <th scope="col">좋아요</th>
                    </tr>
                </thead>
                <tbody>
                
                <c:choose>
                	<c:when test="${empty mountainList }">
                		<tr>
                			<td colspan="6" align="center">
                				등록된 게시물이 없습니다.
                			</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
                			<tr>
                				<td>${mountainList.m_num }</td>
                				<td>${mountainList.m_name }</td>
                				<td>${mountainList.m_addr_1 }</td>
                				<td>${mountainList.m_addr_2 }</td>
                				<td>${mountainList.level }</td>
                				<td>${mountainList.m_recommend }</td>
                			</tr>
                	</c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
        
        <div class="content-box">
            <img src="https://source.unsplash.com/random/?mountain " width="100%" height="600px" alt="">
        </div>
        <div class="btn-box" style="position: absolute;">
            <button type="button" class="btn_like">
                <span class="img_emoti">좋아요</span>
                <span class="ani_heart_m"></span>
            </button>
        </div>
    </div>
    





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        $('.content-box').eq(0).css("margin-top", "200px")
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
