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
    	<div id="wtop">
    		<div class="bweather">
    			<p class="date"><%=nowDate %></p>
    			<div class="bbottom">
    					<div id="mintmpp0" class="btmp"></div>/<div id="maxtmpp0" class="btmp"></div>
    					<span id="nptyy0" class="bpty"></span>
    					<span id="nskyy0" class="sky"></span>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npopp0" class="npopp"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day1 %></p>
    			<div class="bbottom">
   					<div id="mintmpp1" class="btmp"></div>/<div id="maxtmpp1" class="btmp"></div>
   					<div id="nptyy1" class="bpty"></div>
   					<div id="nskyy1" class="sky"></div>
   					<div class="bpop">
   						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
   						<div id="npopp1" class="npopp"></div>
   					</div>
   				</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day2 %></p>
    			<div class="bbottom">
    					<div id="mintmpp2" class="btmp"></div>/<div id="maxtmpp2" class="btmp"></div>
    					<div id="nptyy2" class="bpty"></div>
    					<div id="nskyy2" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npopp2" class="npopp"></div>
    					</div>
    			</div>
    		</div>
    	</div>
    	
		<div id="wbottom">
    		<ul class="bweather">
    			<li class="date"><%=day3 %></li>
				<li><span id="mintmpp4" class="btmp"></span>/<span id="maxtmpp4" class="btmp"></span></li>
  				<li class="bpop">
   				<span id="nptyy4" class="bpty"></span>
  					<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
  					<span id="npopp4" class="npopp"></span>
  				</li>
    		</ul>
    		<ul class="bweather">
    			<li class="date"><%=day4 %></li>
				<li><span id="mintmpp5" class="btmp"></span>/<span id="maxtmpp5" class="btmp"></span></li>
  				<li class="bpop">
   				<span id="nptyy5" class="bpty"></span>
  					<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
  					<span id="npopp5" class="npopp"></span>
  				</li>
    		</ul>
    		<ul class="bweather">
    			<li class="date"><%=day5 %></li>
				<li><span id="mintmpp6" class="btmp"></span>/<span id="maxtmpp6" class="btmp"></span></li>
  				<li class="bpop">
   				<span id="nptyy6" class="bpty"></span>
  					<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
  					<span id="npopp6" class="npopp"></span>
  				</li>
    		</ul>
    		<ul class="bweather">
    			<li class="date"><%=day6 %></li>
				<li><span id="mintmpp7" class="btmp"></span>/<span id="maxtmpp7" class="btmp"></span></li>
  				<li class="bpop">
   				<span id="nptyy7" class="bpty"></span>
  					<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
  					<span id="npopp7" class="npopp"></span>
  				</li>
    		</ul>
    		<ul class="bweather">
    			<li class="date"><%=day7 %></li>
				<li><span id="mintmpp8" class="btmp"></span>/<span id="maxtmpp8" class="btmp"></span></li>
  				<li class="bpop">
   				<span id="ptyy8" class="bpty"></span>
  					<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
  					<span id="popp8" class="npopp"></span>
  				</li>
    		</ul>
    		<ul class="bweather">
    			<li class="date"><%=day8 %></li>
				<li><span id="mintmpp9" class="btmp"></span>/<span id="maxtmpp9" class="btmp"></span></li>
  				<li class="bpop">
   				<span id="ptyy9" class="bpty"></span>
  					<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
  					<span id="popp9" class="npopp"></span>
  				</li>
    		</ul>
    		<ul class="bweather">
    			<li class="date"><%=day9 %></li>
				<li><span id="mintmpp10" class="btmp"></span>/<span id="maxtmpp10" class="btmp"></span></li>
  				<li class="bpop">
   				<span id="ptyy10" class="bpty"></span>
  					<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
  					<span id="popp10" class="npopp"></span>
  				</li>
    		</ul>
			
    	</div>
   	</div>


</body>
</html>