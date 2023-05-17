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
    	line-height:65px;
    	font-size:13px;
    	margin:0;
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
    	height:65px;
    	display:flex;
    	justify-content:space-around;
    	border:4.5px solid lightgray;
    	border-top:none;
    	
    	
    }
    .bbottom{
    	display:flex;
    	justify-content:center;
    	width:330px;
    	line-height:65px;
    	margin-left:10px;
    }
    .bpty{
    	width:50px;
    }
    .bpty img{
    	width:40px;
    	margin:12px 15px 0 0;
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
    					<div id="npty0" class="bpty"></div>
    					<div id="mintmp0" class="btmp"></div>/<div id="maxtmp0" class="btmp"></div>
    					<div id="nsky0" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npop0"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day1 %></p>
    			<div class="bbottom">
    					<div id="npty1" class="bpty"></div>
    					<div id="mintmp1" class="btmp"></div>/<div id="maxtmp1" class="btmp"></div>
    					<div id="nsky1" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npop1"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day2 %></p>
    			<div class="bbottom">
    					<div id="npty2" class="bpty"></div>
    					<div id="mintmp2" class="btmp"></div>/<div id="maxtmp2" class="btmp"></div>
    					<div id="nsky2" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npop2"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day3 %></p>
    			<div class="bbottom">
    					<div id="npty4" class="bpty"></div>
    					<div id="mintmp4" class="btmp"></div>/<div id="maxtmp4" class="btmp"></div>
    					<div id="nsky4" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npop4"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day4 %></p>
    			<div class="bbottom">
    					<div id="npty5" class="bpty"></div>
    					<div id="mintmp5" class="btmp"></div>/<div id="maxtmp5" class="btmp"></div>
    					<div id="nsky5" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npop5"></div>
    					</div>
    			</div>
    		</div>
    	</div>
    	<div>
    		<div class="bweather" style="border-top:4.5px solid lightgray;">
    			<p class="date"><%=day5 %></p>
    			<div class="bbottom">
    					<div id="npty6" class="bpty"></div>
    					<div id="mintmp6" class="btmp"></div>/<div id="maxtmp6" class="btmp"></div>
    					<div id="nsky6" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npop6"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day6 %></p>
    			<div class="bbottom">
    					<div id="npty7" class="bpty"></div>
    					<div id="mintmp7" class="btmp"></div>/<div id="maxtmp7" class="btmp"></div>
    					<div id="nsky7" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="npop7"></div>
    					</div>
    			</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day7 %></p>
    				<div class="bbottom">
    					<div id="pty8" class="bpty"></div>
    					<div id="mintmp8" class="btmp"></div>/<div id="maxtmp8" class="btmp"></div>
    					<div id="sky8" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="pop8"></div>
    					</div>
    				</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day8 %></p>
    				<div class="bbottom">
    					<div id="pty9" class="bpty"></div>
    					<div id="mintmp9" class="btmp"></div>/<div id="maxtmp9" class="btmp"></div>
    					<div id="sky9" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="pop9"></div>
    					</div>
    				</div>
    		</div>
    		<div class="bweather">
    			<p class="date"><%=day9 %></p>
    				<div class="bbottom">
    					<div id="pty10" class="bpty"></div>
    					<div id="mintmp10" class="btmp"></div>/<div id="maxtmp10" class="btmp"></div>
    					<div id="sky10" class="sky"></div>
    					<div class="bpop">
    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
    						<div id="pop10"></div>
    					</div>
    				</div>
    		</div>
    	</div>
   	</div>
</div>

</body>
</html>