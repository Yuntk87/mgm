<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/09e1bc70db.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./FreeBoard.css">
    <title>자유 게시판</title>
  </head>
  <body>

<!--     <nav class="navbar"> -->
<!--         <div class="navbar_logo"> -->
<!--             <i class="fa-solid fa-mountain-sun"></i> -->
<!--             <a class="link" href="#">MGM</a> -->
<!--         </div> -->

<!--         <ul class="navbar_menu"> -->
<!--             <li><a class="link" href="#" >홈페이지 소개</a></li> -->
<!--             <li><a class="link" href="#">산 소개</a></li> -->
<!--             <li><a class="link" href="#">자유 게시판</a></li> -->
<!--             <li><a class="link" href="#">인증 게시판</a></li> -->
<!--             <li><a class="link" href="#">듀오 게시판</a></li> -->
<!--             <li><a class="link master" href="#">회원 관리 페이지</a></li> -->
<!--         </ul> -->
    
<!--         <ul class="navbar_login"> -->
<!--             <li><a class="link" href="#">로그인</a></li> -->
<!--             <li><a class="link" href="#">회원가입</a></li> -->
<!--         </ul> -->
<!--     </nav> -->
<!--     메인 네비게이션 -->



 
        <div style="width: 60%; margin: 0 auto; margin-top: 60px;">
            <h2 style="color: white;">자유 게시판</h2>
            <form action="get">
            <table class="table table-dark ">
                <tr>
                    <td>
                        <div class="search">
                            <div class="search-bar">
                                <select name="searchField"> 
                                    <option value="title"  ${"title" eq param.searchField? "selected" : "" } >제목</option> 
                                    <option value="content" ${"content" eq param.searchField? "selected" : ""} >내용</option>
                                </select>
                                <input type="text" name="searchWord" id="search" value="${empty param.searchWord ? '' : param.searchWord }">
                            </div>
                            <div class="search-btn">
                                <button type="button" class="btn btn-light" style="height: 35px;"><i class="fa-solid fa-magnifying-glass i-con"></i>검색</button>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
            </form>
        </div>
    
    
    
        <div style="width: 60%; margin: 0 auto;" >
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th width="10%">번호</th>
                        <th width="40%">제목</th>
                        <th width="15%">작성자</th>
                        <th width="10%">조회수</th>
                        <th width="15%">작성일</th>
                        <th width="10%">댓글수</th>
                    </tr>
                </thead> 
                <tbody>
                   
                    <c:choose>
                        <c:when test="${empty boardLists}">
                            <tr>
                                <td colspan="6" align="center">
                                    등록된 게시물이 없습니다^^7
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="dto" items="${ boardLists}">
                                <tr>
                                    <td>${dto.num}</td>  <!--게시물 번호-->
                                    <td> <!--제목(+ 하이퍼링크)-->
                                        <a href="./view${ph.sc.getQueryString(ph.sc.page) }&num=${dto.num}">${dto.title }</a>
                                    </td>
                                    <td>${dto.id}</td> <!--작성자 아이디-->
                                    <td>${dto.viewCnt}</td> <!--조회수-->
                                    <fmt:formatDate value="${ dto.postdate }" type="date" pattern="yyyy-MM-dd" var="post"/>
                                    <fmt:formatDate value="${ today }" type="date" pattern="yyyy-MM-dd" var="tday"/>
                                    <td>                        
                                        <c:choose>              
                                            <c:when test="${post eq tday }">
                                                   <fmt:formatDate value="${ dto.postdate }" type="time" pattern="HH:mm"/>
                                            </c:when>
                                            <c:otherwise>
                                                ${post }
                                            </c:otherwise>
                                        </c:choose>
                                        <td>${dto.commentCnt }</td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" style="text-align: center; color: white;" >
                                            <c:if test="${ph.showPrev }" >
                                            <a href ="<c:url value='/list${ph.sc.getQueryString(ph.beginPage-1)}'/>" >&laquo;</a>
                                             </c:if>
                                            <c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
                                                <a href ="<c:url value='/list${ph.sc.getQueryString(i)}'/>" >${i }</a>
                                            </c:forEach>
                                            <c:if test="${ph.showNext }" >
                                                <a href ="<c:url value='/list${ph.sc.getQueryString(ph.endPage+1)}'/>" >&raquo;</a>
                                            </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>   
            </table>
            <table class="table table-dark">
                <tr>
                    <td colspan="6" class="write-btn">
                        <button class="btn" type="button" onclick="location.href='Write.jsp?';"><span><i class="fa-solid fa-pen i-con"></i>글쓰기</span></button>
                    </td>
                </tr>
            </table>
        </div>
   
    
    

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    
  </body>
</html>