<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dto.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/Ranking.css">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
    <title>ranking</title>
</head>
<%	
	ServletContext sc = getServletContext();
	UserDao dao = new UserDao(sc);
	ArrayList<UserDto> uList = dao.userRanking();
	
	
	LocalDate now = LocalDate.now();

    Calendar cal = Calendar.getInstance();
	String year = Integer.toString(cal.get(Calendar.YEAR));
    int tmp1  = cal.get(Calendar.MONTH)+1;
    String month = tmp1<10?  "0"+tmp1 : tmp1+"";
    cal.set(cal.DAY_OF_MONTH,1);
	String maxDay = Integer.toString(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
    

// 	String firstDay =  year + month + 1;
//     String lastDay = year + month + maxDay;
    String firstDay = "20230401";
	String lastDay = "20230430";
	List<HashMap<String, String>> uListMonth = dao.userRankingMonth(firstDay, lastDay);
	dao.close();
%>
<body>
	<div id="rankingMain">
	    <a class="prev" onclick="RankingplusSlides(-1)">&#10094;</a>
	    <a class="next" onclick="RankingplusSlides(1)">&#10095;</a>
	    
		<div class="rbox rfade">
			<h3><img src="https://img.icons8.com/?size=512&id=zBIz5sCgi3aB&format=png" width="20px" height="20px"> 전체 유저랭킹</h3>
			<c:forEach var="user" items='<%=uList%>' varStatus="status">
				<ul class="rInfo">
					<li>
						<div><span class="rNum">${status.count}</span></div>
						<div><a href="./yourpage?id=${user.nickName}"> ${user.nickName} </a></span></div>
						<div><span class="small">LV.${user.level}</span></div>
					</li>
				</ul>
			</c:forEach>
		</div>
		<div class="rbox rfade">
			<h3><img src="https://img.icons8.com/?size=512&id=zBIz5sCgi3aB&format=png" width="20px" height="20px"> <%=tmp1 %>월 유저랭킹</h3>
			<c:forEach var="userM" items='<%=uListMonth%>' varStatus="status">
				<ul class="rInfo">
					<li>
						<div><span class="rNum">${status.count}</span></div>
						<div><a href="./yourpage?id=${user.nickName}">${userM.get('id')} </a></span></div>
						<div><span class="small">${userM.get('count')}회</span></div>
					</li>
				</ul>
			</c:forEach>
		</div>
		
	</div>
</body>
<script>
	let RankingslideIndex = 1;
	RankingshowSlides(RankingslideIndex);
	
	// Next/previous controls
	function RankingplusSlides(n) {
		RankingshowSlides(RankingslideIndex += n);
	}
	
	// Thumbnail image controls
	function RankingcurrentSlide(n) {
		RankingshowSlides(RankingslideIndex = n);
	}
	
	function RankingshowSlides(n) {
	  let i;
	  let Rslides = document.getElementsByClassName("rbox");
	  if (n > Rslides.length) {RankingslideIndex = 1}
	  if (n < 1) {RankingslideIndex = Rslides.length}
	  for (i = 0; i < Rslides.length; i++) {
	    Rslides[i].style.display = "none";
	  }
	  Rslides[RankingslideIndex-1].style.display = "block";
	}
</script>
</html>