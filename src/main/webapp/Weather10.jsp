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
</head>
<%@ include file="./WeatherJS.jsp" %>
<style>
	.date{
    	text-align:center;
    	line-height:62px;
    	font-size:13px;
    	margin:0;
    	width:40px;
    }
    .box{
    	display:flex;
    	justify-content:center;
    	text-align:center;
    }
    #left{
    	margin-right:10px;
    }
    .bweather{
    	width:405px;
    	height:62px;
    	display:flex;
    	justify-content:space-around;
    	border:4.5px solid lightgray;
    	border-top:none;
    	
    	
    }
    .bbottom{
    	display:flex;
    	justify-content:center;
    	width:330px;
    	line-height:62px;
    }
    .bpty{
    	width:50px;
    }
    .bpty img{
    	width:35px;
    	margin-top:14px;
    }
    .btmp{
    	width:40px;
    	font-size:20px;
    }
    .sky{
    	width:80px;
    	font-size:14px;
    }
    .bpop{
    	display:flex;
    	justify-content:center;
    	width:70px;
    	margin-left:20px;
    	font-size:14px;
    }
    .bpop img{
    	width:25px;
    	height:25px;
    	margin:22px 5px 0 0;
    }

    
</style>
<body>
<div>
	
    <div class="box">
    	<div id="left">
    		<div class="bweather" style="border-top:4.5px solid lightgray;">
    			<p class="date"><%=nowDate %></p>
    			<div class="bbottom">
    					<div id="nptyy0" class="bpty"></div>
    					<div id="mintmpp0" class="btmp"></div>/<div id="maxtmpp0" class="btmp"></div>
    					<div id="nskyy0" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npopp0"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day1 %></p>
    			<div class="bbottom">
    					<div id="nptyy1" class="bpty"></div>
    					<div id="mintmpp1" class="btmp"></div>/<div id="maxtmpp1" class="btmp"></div>
    					<div id="nskyy1" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npopp1"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day2 %></p>
    			<div class="bbottom">
    					<div id="nptyy2" class="bpty"></div>
    					<div id="mintmpp2" class="btmp"></div>/<div id="maxtmpp2" class="btmp"></div>
    					<div id="nskyy2" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npopp2"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day3 %></p>
    			<div class="bbottom">
    					<div id="nptyy4" class="bpty"></div>
    					<div id="mintmpp4" class="btmp"></div>/<div id="maxtmpp4" class="btmp"></div>
    					<div id="nskyy4" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npopp4"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day4 %></p>
    			<div class="bbottom">
    					<div id="nptyy5" class="bpty"></div>
    					<div id="mintmpp5" class="btmp"></div>/<div id="maxtmpp5" class="btmp"></div>
    					<div id="nskyy5" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npopp5"></div>
    					</div>
    			</div>
    		</div>
    	</div>
    	<div>
    		<div class="bweather" style="border-top:4.5px solid lightgray;">
    			<p class="date"><%=day5 %></p>
    			<div class="bbottom">
    					<div id="nptyy6" class="bpty"></div>
    					<div id="mintmpp6" class="btmp"></div>/<div id="maxtmpp6" class="btmp"></div>
    					<div id="nskyy6" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npopp6"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day6 %></p>
    			<div class="bbottom">
    					<div id="nptyy7" class="bpty"></div>
    					<div id="mintmpp7" class="btmp"></div>/<div id="maxtmpp7" class="btmp"></div>
    					<div id="nskyy7" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npopp7"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day7 %></p>
    				<div class="bbottom">
    					<div id="ptyy8" class="bpty"></div>
    					<div id="mintmpp8" class="btmp"></div>/<div id="maxtmpp8" class="btmp"></div>
    					<div id="skyy8" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="popp8"></div>
    					</div>
    				</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day8 %></p>
    				<div class="bbottom">
    					<div id="ptyy9" class="bpty"></div>
    					<div id="mintmpp9" class="btmp"></div>/<div id="maxtmpp9" class="btmp"></div>
    					<div id="skyy9" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="popp9"></div>
    					</div>
    				</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day9 %></p>
    				<div class="bbottom">
    					<div id="ptyy10" class="bpty"></div>
    					<div id="mintmpp10" class="btmp"></div>/<div id="maxtmpp10" class="btmp"></div>
    					<div id="skyy10" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="popp10"></div>
    					</div>
    				</div>
    		</div>
    	</div>
   	</div>
</div>

</body>
</html>