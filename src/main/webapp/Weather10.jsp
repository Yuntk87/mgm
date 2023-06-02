<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/Weather10.css">
</head>
<%@ include file="./WeatherJS.jsp" %>
<body>
    <div class="wbox">
   		<h1>주간 예보</h1>
    	<div id="wtop">
    		<div class="bweather">
    			<div class="wtopdiv">
    				<span class="date">오늘</span>
    			</div>
    			<div class="wtopdiv">
    				<span class="date"><%=nowDate %> (<%=yo0 %>)</span>
    			</div>
    			<div class="wtopdiv">
    				<span id="mintmpp0" class="btmp"></span><span>/</span><span id="maxtmpp0" class="btmp"></span>
   				</div>
   				<div class="wtopdiv">
   					<span id="nptyy0" class="bpty"></span>
    				<span id="nskyy0" class="sky"></span>
					<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
					<span id="npopp0" class="npopp"></span>
   				</div>
    		</div>
    	</div>
   	
		<div id="wbottom">
    		<ul class="bweather">
    			<li>
    				<span class="date"><%=day1 %> (<%=yo1 %>)</span>
    				<span id="mintmpp1" class="btmp"></span><span>/</span><span id="maxtmpp1" class="btmp"></span>
    				<span id="nptyy1" class="bpty"></span>
    				<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    				<span id="npopp1" class="npopp"></span>
   				</li>
    			<li>
    				<span class="date"><%=day2 %> (<%=yo2 %>)</span>
    				<span id="mintmpp2" class="btmp"></span><span>/</span><span id="maxtmpp2" class="btmp"></span>
    				<span id="nptyy2" class="bpty"></span>
    				<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    				<span id="npopp2" class="npopp"></span>
   				</li>
    			<li>
    				<span class="date"><%=day3 %> (<%=yo3 %>)</span>
    				<span id="mintmpp4" class="btmp"></span><span>/</span><span id="maxtmpp4" class="btmp"></span>
    				<span id="nptyy4" class="bpty"></span>
    				<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    				<span id="npopp4" class="npopp"></span>
   				</li>
    			<li>
    				<span class="date"><%=day4 %> (<%=yo4 %>)</span>
    				<span id="mintmpp5" class="btmp"></span><span>/</span><span id="maxtmpp5" class="btmp"></span>
    				<span id="nptyy5" class="bpty"></span>
    				<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    				<span id="npopp5" class="npopp"></span>
   				</li>
    			<li>
    				<span class="date"><%=day5 %> (<%=yo5 %>)</span>
    				<span id="mintmpp6" class="btmp"></span><span>/</span><span id="maxtmpp6" class="btmp"></span>
    				<span id="nptyy6" class="bpty"></span>
    				<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    				<span id="npopp6" class="npopp"></span>
   				</li>
    			<li>
    				<span class="date"><%=day6 %> (<%=yo6 %>)</span>
    				<span id="mintmpp7" class="btmp"></span><span>/</span><span id="maxtmpp7" class="btmp"></span>
    				<span id="nptyy7" class="bpty"></span>
    				<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    				<span id="npopp7" class="npopp"></span>
   				</li>
    			<li>
    				<span class="date"><%=day7 %> (<%=yo7 %>)</span>
    				<span id="mintmpp8" class="btmp"></span><span>/</span><span id="maxtmpp8" class="btmp"></span>
    				<span id="ptyy8" class="bpty"></span>
    				<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    				<span id="popp8" class="npopp"></span>
   				</li>
    			<li>
    				<span class="date"><%=day8 %> (<%=yo8 %>)</span>
    				<span id="mintmpp9" class="btmp"></span><span>/</span><span id="maxtmpp9" class="btmp"></span>
    				<span id="ptyy9" class="bpty"></span>
    				<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    				<span id="popp9" class="npopp"></span>
   				</li>
    			<li>
    				<span class="date"><%=day9 %> (<%=yo9 %>)</span>
    				<span id="mintmpp10" class="btmp"></span><span>/</span><span id="maxtmpp10" class="btmp"></span>
    				<span id="ptyy10" class="bpty"></span>
    				<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    				<span id="popp10" class="npopp"></span>
   				</li>
    		</ul>
			
    	</div>
   	</div>


</body>
</html>