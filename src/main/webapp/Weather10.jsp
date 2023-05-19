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
<script>
	<% 
	Date today = new Date();
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("MM.dd");
	
	String titleDate = sdf1.format(today);
	
	Date day = null;
	try {
		day = sdf1.parse(titleDate);
	} catch (java.text.ParseException e) {
		e.printStackTrace();
	}
	String nowDate = sdf2.format(today);
	
	Calendar cal1 = new GregorianCalendar(Locale.KOREA);
	cal1.setTime(day);
	cal1.add(Calendar.DATE,1);
	String tomorrow = sdf1.format(cal1.getTime());
	String day1 = sdf2.format(cal1.getTime());
	
	Calendar cal2 = new GregorianCalendar(Locale.KOREA);
	cal2.setTime(day);
	cal2.add(Calendar.DATE,2);
	String after = sdf1.format(cal2.getTime());
	String day2 = sdf2.format(cal2.getTime());
	
	Calendar cal3 = new GregorianCalendar(Locale.KOREA);
	cal3.setTime(day);
	cal3.add(Calendar.DATE,3);
	String day3 = sdf2.format(cal3.getTime());

	Calendar cal4 = new GregorianCalendar(Locale.KOREA);
	cal4.setTime(day);
	cal4.add(Calendar.DATE,4);
	String day4 = sdf2.format(cal4.getTime());
	
	Calendar cal5 = new GregorianCalendar(Locale.KOREA);
	cal5.setTime(day);
	cal5.add(Calendar.DATE,5);
	String day5 = sdf2.format(cal5.getTime());
	
	Calendar cal6 = new GregorianCalendar(Locale.KOREA);
	cal6.setTime(day);
	cal6.add(Calendar.DATE,6);
	String day6 = sdf2.format(cal6.getTime());
	
	Calendar cal7 = new GregorianCalendar(Locale.KOREA);
	cal7.setTime(day);
	cal7.add(Calendar.DATE,7);
	String day7 = sdf2.format(cal7.getTime());
	
	Calendar cal8 = new GregorianCalendar(Locale.KOREA);
	cal8.setTime(day);
	cal8.add(Calendar.DATE,8);
	String day8 = sdf2.format(cal8.getTime());
	
	Calendar cal9 = new GregorianCalendar(Locale.KOREA);
	cal9.setTime(day);
	cal9.add(Calendar.DATE,9);
	String day9 = sdf2.format(cal9.getTime());
	
	Calendar cal10 = new GregorianCalendar(Locale.KOREA);
	cal10.setTime(day);
	cal10.add(Calendar.DATE,10);
	String day10 = sdf2.format(cal10.getTime());
	%>




$.ajax({
    url : "./Weather10tmp_Api.do",  // 요청 URL
    type : "get",                  // HTTP 메서드
    dataType : "xml",      // 응답 데이터 형식
    success : successFunc,  // 요청 성공 시 호출할 메서드 설정
    error : function (jqXHR, textStatus, errorThrown){
		console.log(jqXHR);  //응답 메시지
		console.log(textStatus); //"error"로 고정인듯함
		console.log(errorThrown);        // 요청 실패 시 호출할 메서드 설정
  }
});
function successFunc(d) {
	console.log(d)
	var mintmp=[0,0,0,0,'','','','','','',''];
	var maxtmp=[0,0,0,0,'','','','','','',''];

	$(d).find('item').each(function(index, item){
		for(let i=4; i<=10; i++){
			mintmp[i] +=$(this).find('taMin'+i).text()+'°';
			maxtmp[i] +=$(this).find('taMax'+i).text()+'°';
		}
	});
	
	for(let i=4; i<=10; i++){
   	 	$('#mintmp'+i).html(mintmp[i]);
   	 	$('#maxtmp'+i).html(maxtmp[i]);
	}
}


//실패 시 경고창을 띄워줍니다.
function errFunc(e) {
   alert("실패: " + e.status);
}

$.ajax({
    url : "./Weather10sky_Api.do",  // 요청 URL
    type : "get",                  // HTTP 메서드
    dataType : "xml",      // 응답 데이터 형식
    success : sucFunc,  // 요청 성공 시 호출할 메서드 설정
    error : function (jqXHR, textStatus, errorThrown){
		console.log(jqXHR);  //응답 메시지
		console.log(textStatus); //"error"로 고정인듯함
		console.log(errorThrown);        // 요청 실패 시 호출할 메서드 설정
  }
});
function sucFunc(d) {
	console.log(d)
	var mpop=[0,0,0,0,'','','','','','',''];
	var npop=[0,0,0,0,'','','','','','',''];
	var pop=[0,0,0,0,0,0,0,0,'','',''];
	var msky=[0,0,0,0,'','','','','','',''];
	var nsky=[0,0,0,0,'','','','','','',''];
	var sky=[0,0,0,0,0,0,0,0,'','',''];
	var mpty=[0,0,0,0,'','','','','','',''];
	var npty=[0,0,0,0,'','','','','','',''];
	var bpty=[0,0,0,0,0,0,0,0,'','',''];
	
	let pty=[0,0,0,0,0,0,0,0,'','',''];
	let apty = [0,0,0,'','','','','','','',''];
	let ppty = [0,0,0,'','','','','','','',''];

	$(d).find('item').each(function(index, item){
		for(let i=4; i<=10; i++){
			mpop[i] +=$(this).find('rnSt'+i+'Am').text()+'%';
			npop[i] +=$(this).find('rnSt'+i+'Pm').text()+'%';
			pop[i] +=$(this).find('rnSt'+i).text()+'%';
			
			msky[i] +=$(this).find('wf'+i+'Am').text();
			nsky[i] +=$(this).find('wf'+i+'Pm').text();
			sky[i] +=$(this).find('wf'+i).text();
			apty[i] =$(this).find('wf'+i+'Am').text();
			ppty[i] =$(this).find('wf'+i+'Pm').text();
			pty[i] =$(this).find('wf'+i).text();
			
			if(apty[i].split(' ').length==2){
	           	if(apty[i].split(' ')[1] == '비'){
	        	   	mpty[i] += '<i class="fa-solid fa-umbrella"></i>'
	           	}
	           	if(apty[i].split(' ')[1] == '눈'){
	        	   	mpty[i] += '<i class="fa-regular fa-snowflake"></i>'
	           	}
	           	if(apty[i].split(' ')[1] == '비/눈'){
	        	   	mpty[i] += '<i class="fa-solid fa-cloud-rain"></i><i class="fa-regular fa-snowflake"></i>'
	           	}
	           	if(apty[i].split(' ')[1] == '소나기'){
	        	   	mpty[i] += '<i class="fa-solid fa-cloud-showers-heavy"></i>'
	           	}
	        }else{
				if(apty[i].split(' ')[0] == '맑음'){
					mpty[i] += '<i class="fa-solid fa-sun"></i>'
				}
	           	if(apty[i].split(' ')[0] == '구름많음'){
	        	   	mpty[i] += '<i class="fa-solid fa-cloud-sun"></i>'
	            }
	           	if(apty[i].split(' ')[0] == '흐림'){
	        	   	mpty[i] += '<i class="fa-solid fa-cloud"></i>'
	            }
	        }
			
			if(ppty[i].split(' ').length==2){
				if(ppty[i].split(' ')[1] == '비'){
					npty[i] += '<i class="fa-solid fa-umbrella"></i>'
				}
				if(ppty[i].split(' ')[1] == '눈'){
					npty[i] += '<i class="fa-regular fa-snowflake"></i>'
		        }
				if(ppty[i].split(' ')[1] == '비/눈'){
					npty[i] += '<i class="fa-solid fa-cloud-rain"></i><i class="fa-regular fa-snowflake"></i>'
		        }
				if(ppty[i].split(' ')[1] == '소나기'){
					npty[i] += '<i class="fa-solid fa-cloud-showers-heavy"></i>'
		        }
			}else{
				if(ppty[i].split(' ')[0] == '맑음'){
					npty[i] += '<i class="fa-solid fa-sun"></i>'
				}
				if(ppty[i].split(' ')[0] == '구름많음'){
					npty[i] += '<i class="fa-solid fa-cloud-sun"></i>'
		        }
		        if(ppty[i].split(' ')[0] == '흐림'){
					npty[i] += '<i class="fa-solid fa-cloud"></i>'
		        }
			}
			
			if(pty[i].split(' ').length==2){
				if(pty[i].split(' ')[1] == '비'){
					bpty[i] += '<i class="fa-solid fa-umbrella"></i>'
				}
				if(pty[i].split(' ')[1] == '눈'){
					bpty[i] += '<i class="fa-regular fa-snowflake"></i>'
		        }
				if(pty[i].split(' ')[1] == '비/눈'){
					bpty[i] += '<i class="fa-solid fa-cloud-rain"></i><i class="fa-regular fa-snowflake"></i>'
		        }
				if(ppty[i].split(' ')[1] == '소나기'){
					bpty[i] += '<i class="fa-solid fa-cloud-showers-heavy"></i>'
		        }
			}else{
				if(pty[i].split(' ')[0] == '맑음'){
					bpty[i] += '<i class="fa-solid fa-sun"></i>'
				}
				if(pty[i].split(' ')[0] == '구름많음'){
					bpty[i] += '<i class="fa-solid fa-cloud-sun"></i>'
		        }
		        if(pty[i].split(' ')[0] == '흐림'){
					bpty[i] += '<i class="fa-solid fa-cloud"></i>'
		        }
			}
			
		}
	});
	
	for(let i=4; i<=10; i++){
   	 	$('#mpop'+i).html(mpop[i]);
   	 	$('#npop'+i).html(npop[i]);
   	 	$('#pop'+i).html(pop[i]);
   	 	$('#msky'+i).html(msky[i]);
	 	$('#nsky'+i).html(nsky[i]);
	 	$('#sky'+i).html(sky[i]);
	 	$('#mpty'+i).html(mpty[i]);
	 	$('#npty'+i).html(npty[i]);
	 	$('#pty'+i).html(bpty[i]);
	}
}

$.ajax({
    url : "./Weather3_Api.do",  // 요청 URL
    type : "get",                  // HTTP 메서드
    dataType : "json",      // 응답 데이터 형식
    success : sucFuncJson,  // 요청 성공 시 호출할 메서드 설정
    error : errFunc         // 요청 실패 시 호출할 메서드 설정
  });
  
  function sucFuncJson(d){
	  var mtmp = ['','',''];
	  var mopty = ['','',''];
	  var mosky = ['','',''];
	  var mopop = ['','',''];
	  
	  var ntmp = ['','',''];
	  var nipty = ['','',''];
	  var nisky = ['','',''];
	  var nipop = ['','',''];
	  let ch="";
	  
	  $.each(d.response.body.items.item, function(index, item){
		  //당일 오전 6시
		if(item.fcstDate==<%=titleDate%> && item.fcstTime == '0600'){
			if(item.category =='TMP'){
				mtmp[0] +=item.fcstValue+'°'
		  	}
			
			if(item.category == 'SKY'){
				ch = item.fcstValue;
				if(item.fcstValue =="1") mosky[0]+='맑음'
				if(item.fcstValue =="3") mosky[0]+='구름 많음'
				if(item.fcstValue =="4") mosky[0]+='흐림'
			}
			
			if(item.category == 'PTY'){
				if(item.fcstValue == "1") mopty[0]+='<i class="fa-solid fa-umbrella"></i>'
				else if(item.fcstValue == "2") mopty[0]+='<i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "3") mopty[0]+='<i class="fa-solid fa-cloud-rain"></i><i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "4") mopty[0]+='<i class="fa-solid fa-cloud-showers-heavy"></i>'			
				else{
					console.log(ch+"ch")
					if(ch =="1") mopty[0]+='<i class="fa-solid fa-sun"></i>'
					else if(ch =="3") mopty[0]+='<i class="fa-solid fa-cloud-sun"></i>'
					else if(ch =="4") mopty[0]+='<i class="fa-solid fa-cloud"></i>'
				}
			}
			
			if(item.category == 'POP'){
				mopop[0]+=item.fcstValue+'%'
			}
		 }
		  //당일 오후 3시
		if(item.fcstDate==<%=titleDate%> && item.fcstTime == '1500'){
			if(item.category =='TMP'){
				ntmp[0] += item.fcstValue+'°'
		  	}
			if(item.category == 'SKY'){
				ch = item.fcstValue;
				if(item.fcstValue =="1") nisky[0]+='맑음'
				if(item.fcstValue =="3") nisky[0]+='구름 많음'
				if(item.fcstValue =="4") nisky[0]+='흐림'
			}
			
			if(item.category == 'PTY'){
				if(item.fcstValue == "1") nipty[0]+='<i class="fa-solid fa-umbrella"></i>'
				else if(item.fcstValue == "2") nipty[0]+='<i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "3") nipty[0]+='<i class="fa-solid fa-cloud-rain"></i><i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "4") nipty[0]+='<i class="fa-solid fa-cloud-showers-heavy"></i>'			
				else{
					console.log(ch+"ch")
					if(ch =="1") nipty[0]+='<i class="fa-solid fa-sun"></i>'
					else if(ch =="3") nipty[0]+='<i class="fa-solid fa-cloud-sun"></i>'
					else if(ch =="4") nipty[0]+='<i class="fa-solid fa-cloud"></i>'
				}
			}
			if(item.category == 'POP'){
				nipop[0]+=item.fcstValue+'%'
			}
		 }
		  
		  //다음날 오전 6시
		if(item.fcstDate==<%=tomorrow%> && item.fcstTime == '0600'){
			if(item.category =='TMP'){
				mtmp[1] += item.fcstValue+'°'
		  	}
			if(item.category == 'SKY'){
				ch = item.fcstValue;
				if(item.fcstValue =="1") mosky[1]+='맑음'
				if(item.fcstValue =="3") mosky[1]+='구름 많음'
				if(item.fcstValue =="4") mosky[1]+='흐림'
			}
			
			if(item.category == 'PTY'){
				if(item.fcstValue == "1") mopty[1]+='<i class="fa-solid fa-umbrella"></i>'
				else if(item.fcstValue == "2") mopty[1]+='<i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "3") mopty[1]+='<i class="fa-solid fa-cloud-rain"></i><i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "4") mopty[1]+='<i class="fa-solid fa-cloud-showers-heavy"></i>'			
				else{
					console.log(ch+"ch")
					if(ch =="1") mopty[1]+='<i class="fa-solid fa-sun"></i>'
					else if(ch =="3") mopty[1]+='<i class="fa-solid fa-cloud-sun"></i>'
					else if(ch =="4") mopty[1]+='<i class="fa-solid fa-cloud"></i>'
				}
			}
			if(item.category == 'POP'){
				mopop[1]+=item.fcstValue+'%'
			}
		 }
		  //다음날 오후 3시
		if(item.fcstDate==<%=tomorrow%> && item.fcstTime == '1500'){
			if(item.category =='TMP'){
				ntmp[1] += item.fcstValue+'°'
		  	}
			if(item.category == 'SKY'){
				ch = item.fcstValue;
				if(item.fcstValue =="1") nisky[1]+='맑음'
				if(item.fcstValue =="3") nisky[1]+='구름 많음'
				if(item.fcstValue =="4") nisky[1]+='흐림'
			}
			
			if(item.category == 'PTY'){
				if(item.fcstValue == "1") nipty[1]+='<i class="fa-solid fa-umbrella"></i>'
				else if(item.fcstValue == "2") nipty[1]+='<i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "3") nipty[1]+='<i class="fa-solid fa-cloud-rain"></i><i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "4") nipty[1]+='<i class="fa-solid fa-cloud-showers-heavy"></i>'			
				else{
					console.log(ch+"ch")
					if(ch =="1") nipty[1]+='<i class="fa-solid fa-sun"></i>'
					else if(ch =="3") nipty[1]+='<i class="fa-solid fa-cloud-sun"></i>'
					else if(ch =="4") nipty[1]+='<i class="fa-solid fa-cloud"></i>'
				}
			}
			if(item.category == 'POP'){
				nipop[1]+=item.fcstValue+'%'
			}
		 }
		  
		  //모레 오전 6시
		if(item.fcstDate==<%=after%> && item.fcstTime == '0600'){
			if(item.category =='TMP'){
				mtmp[2] += item.fcstValue+'°'
		  	}
			if(item.category == 'SKY'){
				ch = item.fcstValue;
				if(item.fcstValue =="1") mosky[2]+='맑음'
				if(item.fcstValue =="3") mosky[2]+='구름 많음'
				if(item.fcstValue =="4") mosky[2]+='흐림'
			}
			
			if(item.category == 'PTY'){
				if(item.fcstValue == "1") mopty[2]+='<i class="fa-solid fa-umbrella"></i>'
				else if(item.fcstValue == "2") mopty[2]+='<i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "3") mopty[2]+='<i class="fa-solid fa-cloud-rain"></i><i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "4") mopty[2]+='<i class="fa-solid fa-cloud-showers-heavy"></i>'			
				else{
					console.log(ch+"ch")
					if(ch =="1") mopty[2]+='<i class="fa-solid fa-sun"></i>'
					else if(ch =="3") mopty[2]+='<i class="fa-solid fa-cloud-sun"></i>'
					else if(ch =="4") mopty[2]+='<i class="fa-solid fa-cloud"></i>'
				}
			}
			if(item.category == 'POP'){
				mopop[2]+=item.fcstValue+'%'
			}
		 }
		  //모레 오후 3시
		if(item.fcstDate==<%=after%> && item.fcstTime == '1500'){
			if(item.category =='TMP'){
				ntmp[2] += item.fcstValue+'°'
		  	}
			if(item.category == 'SKY'){
				ch = item.fcstValue;
				if(item.fcstValue =="1") nisky[2]+='맑음'
				if(item.fcstValue =="3") nisky[2]+='구름 많음'
				if(item.fcstValue =="4") nisky[2]+='흐림'
			}
			
			if(item.category == 'PTY'){
				if(item.fcstValue == "1") nipty[2]+='<i class="fa-solid fa-umbrella"></i>'
				else if(item.fcstValue == "2") nipty[2]+='<i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "3") nipty[2]+='<i class="fa-solid fa-cloud-rain"></i><i class="fa-regular fa-snowflake"></i>'
				else if(item.fcstValue == "4") nipty[2]+='<i class="fa-solid fa-cloud-showers-heavy"></i>'			
				else{
					console.log(ch+"ch")
					if(ch =="1") nipty[2]+='<i class="fa-solid fa-sun"></i>'
					else if(ch =="3") nipty[2]+='<i class="fa-solid fa-cloud-sun"></i>'
					else if(ch =="4") nipty[2]+='<i class="fa-solid fa-cloud"></i>'
				}
			}
			if(item.category == 'POP'){
				nipop[2]+=item.fcstValue+'%'
			}
		 }
		  
	  })
	  
	  for(let z=0; z<=2; z++){
		  $('#mintmp'+z).html(mtmp[z]);
		  $('#mpty'+z).html(mopty[z]);
		  $('#msky'+z).html(mosky[z]);
		  $('#mpop'+z).html(mopop[z]);
		  $('#maxtmp'+z).html(ntmp[z]);
		  $('#npty'+z).html(nipty[z]);
		  $('#nsky'+z).html(nisky[z]);
		  $('#npop'+z).html(nipop[z]);
	  }
  }
</script>
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
    					<div id="mintmp8" class="btmp"></div>/<div id="maxtmp8" class="btmp"></div>
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