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
    <style>
    	#main {
    		width:600px;
    		height:300px;
    		margin:0 auto;
    	}
    	.r1 , .r2 {
    		text-align:center;
    		float: left;
    		width:300px;
    	}
    	.small {
    		font-size: 8px;
    		color:darkgray;
    	}
    	.rInfo {
    		height:50%;
    		width:50%;
    		margin: 0 auto;
    		padding: 10px 30px 10px 30px;
    		display:flex;
    		justify-content: space-between;
    		border-radius: 5px;
    		transition: all 0.5s ease;
    	}
    	.rInfo:hover {
			transform: scale( 2.0 );
    		transform: rotateX( 360deg );
    		box-shadow: 7px 7px 5px rgba(0, 0, 0, 0.3);
    	}
    </style>
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
	<div id="main">
		<div class="r1">
			<h3><img src="https://img.icons8.com/?size=512&id=zBIz5sCgi3aB&format=png" width="20px" height="20px"> 전체 유저랭킹</h3>
			<c:forEach var="user" items='<%=uList%>' varStatus="status">
				<div class="rInfo">
					<div>${status.count}</div>
					<div>${user.nickName}</div>
					<div><span class="small">LV.${user.level}</span></div>
				</div>
			</c:forEach>
		</div>
		<div class="r2">
			<h3><img src="https://img.icons8.com/?size=512&id=zBIz5sCgi3aB&format=png" width="20px" height="20px"> <%=tmp1 %>월 유저랭킹</h3>
			<c:forEach var="userM" items='<%=uListMonth%>' varStatus="status">
				<div class="rInfo">
					<div>${status.count}</div>
					<div>${userM.get('id')}</div>
					<div><span class="small">${userM.get('count')}회</span></div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>