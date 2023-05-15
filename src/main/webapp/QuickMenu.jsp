<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuickMenuTest</title>
<link href="./css/QuickMenu.css" rel="stylesheet">
</head>
<% 
	Date today = new Date();
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("MM월 dd일");
	
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
<body>
	<body>

		<!-- 첫 번째 Modal을 여는 클래스 -->
		<button class="btn">MODAL_1</button>
	 
		<!-- 첫 번째 Modal -->
		<div class="modal">
	 
		  <!-- 첫 번째 Modal의 내용 -->
		  <div class="modal-content">
			<span class="close">&times;</span>                         
			<p>단체대화</p>
		  </div>
		</div>
	 
		<hr>
		<!-- 두 번째 Modal을 여는 클래스 -->
		<button class="btn">MODAL_2</button>
	 
		<!-- 두 번째 Modal -->
		<div class="modal">
	 
		  <!-- 두 번째 Modal의 내용 -->
		  <div class="modal-content">
			<span class="close">&times;</span>
			<%@ include file="./LocationCheck.jsp" %>
		  </div>
		</div>
	 
		<hr>
		<!-- 세 번째 Modal을 여는 클래스 -->
		<button class="btn">MODAL_3</button>
	 
		<!-- 세 번째 Modal -->
		<div class="modal">
	 
		  <!-- 세 번째 Modal의 내용 -->
		  <div class="modal-content">
			<span class="close">&times;</span>
			    <div class="box">
			    	<div id="left">
			    		<div class="weather">
			    			<p class="date"><%=nowDate %></p>
			    			<div class="qq">
			    				<div class="bottom">
			    					<p>오전</p>
			    					<div id="mpty0" class="pty"></div>
			    					<div id="mintmp0" class="tmp"></div>
			    					<div id="msky0" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="mpop0"></div>
			    					</div>
			    				</div>
			    				<div class="bottom">
			    					<p>오후</p>
			    					<div id="npty0" class="pty"></div>
			    					<div id="maxtmp0" class="tmp"></div>
			    					<div id="nsky0" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="npop0"></div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="weather">
			    			<p class="date"><%=day1 %></p>
			    			<div class="qq">
			    				<div class="bottom">
			    					<p>오전</p>
			    					<div id="mpty1" class="pty"></div>
			    					<div id="mintmp1" class="tmp"></div>
			    					<div id="msky1" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="mpop1"></div>
			    					</div>
			    				</div>
			    				<div class="bottom">
			    					<p>오후</p>
			    					<div id="npty1" class="pty"></div>
			    					<div id="maxtmp1" class="tmp"></div>
			    					<div id="nsky1" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="npop1"></div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="weather">
			    			<p class="date"><%=day2 %></p>
			    			<div class="qq">
			    				<div class="bottom">
			    					<p>오전</p>
			    					<div id="mpty2" class="pty"></div>
			    					<div id="mintmp2" class="tmp"></div>
			    					<div id="msky2" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="mpop2"></div>
			    					</div>
			    				</div>
			    				<div class="bottom">
			    					<p>오후</p>
			    					<div id="npty2" class="pty"></div>
			    					<div id="maxtmp2" class="tmp"></div>
			    					<div id="nsky2" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="npop2"></div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="weather">
			    			<p class="date"><%=day3 %></p>
			    			<div class="qq">
			    				<div class="bottom">
			    					<p>오전</p>
			    					<div id="mpty3" class="pty"></div>
			    					<div id="mintmp3" class="tmp"></div>
			    					<div id="msky3" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="mpop3"></div>
			    					</div>
			    				</div>
			    				<div class="bottom">
			    					<p>오후</p>
			    					<div id="npty3" class="pty"></div>
			    					<div id="maxtmp3" class="tmp"></div>
			    					<div id="nsky3" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="npop3"></div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="weather">
			    			<p class="date"><%=day4 %></p>
			    			<div class="qq">
			    				<div class="bottom">
			    					<p>오전</p>
			    					<div id="mpty4" class="pty"></div>
			    					<div id="mintmp4" class="tmp"></div>
			    					<div id="msky4" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="mpop4"></div>
			    					</div>
			    				</div>
			    				<div class="bottom">
			    					<p>오후</p>
			    					<div id="npty4" class="pty"></div>
			    					<div id="maxtmp4" class="tmp"></div>
			    					<div id="nsky4" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="npop4"></div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    	</div>
			    	<div>
			    		<div class="weather">
			    			<p class="date"><%=day5 %></p>
			    			<div class="qq">
			    				<div class="bottom">
			    					<p>오전</p>
			    					<div id="mpty5" class="pty"></div>
			    					<div id="mintmp5" class="tmp"></div>
			    					<div id="msky5" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="mpop5"></div>
			    					</div>
			    				</div>
			    				<div class="bottom">
			    					<p>오후</p>
			    					<div id="npty5" class="pty"></div>
			    					<div id="maxtmp5" class="tmp"></div>
			    					<div id="nsky5" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="npop5"></div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="weather">
			    			<p class="date"><%=day6 %></p>
			    			<div class="qq">
			    				<div class="bottom">
			    					<p>오전</p>
			    					<div id="mpty6" class="pty"></div>
			    					<div id="mintmp6" class="tmp"></div>
			    					<div id="msky6" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="mpop6"></div>
			    					</div>
			    				</div>
			    				<div class="bottom">
			    					<p>오후</p>
			    					<div id="npty6" class="pty"></div>
			    					<div id="maxtmp6" class="tmp"></div>
			    					<div id="nsky6" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="npop6"></div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="weather">
			    			<p class="date"><%=day7 %></p>
			    			<div class="qq">
			    				<div class="bottom">
			    					<p>오전</p>
			    					<div id="mpty7" class="pty"></div>
			    					<div id="mintmp7" class="tmp"></div>
			    					<div id="msky7" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="mpop7"></div>
			    					</div>
			    				</div>
			    				<div class="bottom">
			    					<p>오후</p>
			    					<div id="npty7" class="pty"></div>
			    					<div id="maxtmp7" class="tmp"></div>
			    					<div id="nsky7" class="sky"></div>
			    					<div class="pop">
			    						<img src="https://img.icons8.com/?size=512&id=fhVv1TTyMSI1&format=png">
			    						<div id="npop7"></div>
			    					</div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="bweather">
			    			<p class="bdate"><%=day8 %></p>
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
			    			<p class="bdate"><%=day9 %></p>
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
			    			<p class="bdate"><%=day10 %></p>
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
		</div>
	 
		<script src=js/modal.js>
		/*modal.js */
		</script>

	  </body>

<script>
	// Modal을 가져옵니다.
	var modals = document.getElementsByClassName("modal");
	// Modal을 띄우는 클래스 이름을 가져옵니다.
	var btns = document.getElementsByClassName("btn");
	// Modal을 닫는 close 클래스를 가져옵니다.
	var spanes = document.getElementsByClassName("close");
	var funcs = [];
	
	// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
	function Modal(num) {
		return function() {
			// 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
			btns[num].onclick =  function() {
				modals[num].style.display = "block";
				console.log(num);
			};
		
			// <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
			spanes[num].onclick = function() {
				modals[num].style.display = "none";
			};
		};
	}
	
	// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
	for(var i = 0; i < btns.length; i++) {
	funcs[i] = Modal(i);
	}
	
	// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
	for(var j = 0; j < btns.length; j++) {
	funcs[j]();
	}
	
	// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
	window.onclick = function(event) {
	if (event.target.className == "modal") {
		event.target.style.display = "none";
	}
	};
</script>

<script>


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
	var mintmp=[0,0,0,'','','','','','','',''];
	var maxtmp=[0,0,0,'','','','','','','',''];

	$(d).find('item').each(function(index, item){
		for(let i=3; i<=10; i++){
			mintmp[i] +=$(this).find('taMin'+i).text()+'°';
			maxtmp[i] +=$(this).find('taMax'+i).text()+'°';
		}
	});
	
	for(let i=3; i<=10; i++){
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
	var mpop=[0,0,0,'','','','','','','',''];
	var npop=[0,0,0,'','','','','','','',''];
	var pop=[0,0,0,0,0,0,0,0,'','',''];
	var msky=[0,0,0,'','','','','','','',''];
	var nsky=[0,0,0,'','','','','','','',''];
	var sky=[0,0,0,0,0,0,0,0,'','',''];
	var mpty=[0,0,0,'','','','','','','',''];
	var npty=[0,0,0,'','','','','','','',''];
	var bpty=[0,0,0,0,0,0,0,0,'','',''];
	
	let pty=[0,0,0,0,0,0,0,0,'','',''];
	let apty = [0,0,0,'','','','','','','',''];
	let ppty = [0,0,0,'','','','','','','',''];

	$(d).find('item').each(function(index, item){
		for(let i=3; i<=10; i++){
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
	        	   	mpty[i] += '<img src="https://img.icons8.com/?size=512&id=656&format=png">'
	           	}
	           	if(apty[i].split(' ')[1] == '눈'){
	        	   	mpty[i] += '<img src="https://img.icons8.com/pulsar-color/256/winter.png">'
	           	}
	           	if(apty[i].split(' ')[1] == '비/눈'){
	        	   	mpty[i] += '<img src="https://img.icons8.com/pulsar-color/256/sleet.png">'
	           	}
	           	if(apty[i].split(' ')[1] == '소나기'){
	        	   	mpty[i] += '<img src="https://img.icons8.com/pulsar-color/256/heavy-rain.png">'
	           	}
	        }else{
				if(apty[i].split(' ')[0] == '맑음'){
					mpty[i] += '<img src="https://img.icons8.com/?size=512&id=6Z2mGj6qDVv4&format=png">'
				}
	           	if(apty[i].split(' ')[0] == '구름많음'){
	        	   	mpty[i] += '<img src="https://img.icons8.com/?size=512&id=658&format=png">'
	            }
	           	if(apty[i].split(' ')[0] == '흐림'){
	        	   	mpty[i] += '<img src="https://img.icons8.com/?size=512&id=650&format=png">'
	            }
	        }
			
			if(ppty[i].split(' ').length==2){
				if(ppty[i].split(' ')[1] == '비'){
					npty[i] += '<img src="https://img.icons8.com/?size=512&id=656&format=png">'
				}
				if(ppty[i].split(' ')[1] == '눈'){
					npty[i] += '<img src="https://img.icons8.com/pulsar-color/256/winter.png">'
		        }
				if(ppty[i].split(' ')[1] == '비/눈'){
					npty[i] += '<img src="https://img.icons8.com/pulsar-color/256/sleet.png">'
		        }
				if(ppty[i].split(' ')[1] == '소나기'){
					npty[i] += '<img src="https://img.icons8.com/pulsar-color/256/heavy-rain.png">'
		        }
			}else{
				if(ppty[i].split(' ')[0] == '맑음'){
					npty[i] += '<img src="https://img.icons8.com/?size=512&id=6Z2mGj6qDVv4&format=png">'
				}
				if(ppty[i].split(' ')[0] == '구름많음'){
					npty[i] += '<img src="https://img.icons8.com/?size=512&id=658&format=png">'
		        }
		        if(ppty[i].split(' ')[0] == '흐림'){
					npty[i] += '<img src="https://img.icons8.com/?size=512&id=650&format=png">'
		        }
			}
			
			if(pty[i].split(' ').length==2){
				if(pty[i].split(' ')[1] == '비'){
					bpty[i] += '<img src="https://img.icons8.com/?size=512&id=656&format=png">'
				}
				if(pty[i].split(' ')[1] == '눈'){
					bpty[i] += '<img src="https://img.icons8.com/pulsar-color/256/winter.png">'
		        }
				if(pty[i].split(' ')[1] == '비/눈'){
					bpty[i] += '<img src="https://img.icons8.com/pulsar-color/256/sleet.png">'
		        }
				if(ppty[i].split(' ')[1] == '소나기'){
					bpty[i] += '<img src="https://img.icons8.com/pulsar-color/256/heavy-rain.png">'
		        }
			}else{
				if(pty[i].split(' ')[0] == '맑음'){
					bpty[i] += '<img src="https://img.icons8.com/?size=512&id=6Z2mGj6qDVv4&format=png">'
				}
				if(pty[i].split(' ')[0] == '구름많음'){
					bpty[i] += '<img src="https://img.icons8.com/?size=512&id=658&format=png">'
		        }
		        if(pty[i].split(' ')[0] == '흐림'){
					bpty[i] += '<img src="https://img.icons8.com/?size=512&id=650&format=png">'
		        }
			}
			
		}
	});
	
	for(let i=3; i<=10; i++){
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
				if(item.fcstValue == "1") mopty[0]+='<img src="https://img.icons8.com/?size=512&id=656&format=png">'
				else if(item.fcstValue == "2") mopty[0]+='<img src="https://img.icons8.com/pulsar-color/256/sleet.png">'
				else if(item.fcstValue == "3") mopty[0]+='<img src="https://img.icons8.com/pulsar-color/256/winter.png">'
				else if(item.fcstValue == "4") mopty[0]+='<img src="https://img.icons8.com/pulsar-color/256/heavy-rain.png">'			
				else{
					console.log(ch+"ch")
					if(ch =="1") mopty[0]+='<img src="https://img.icons8.com/?size=512&id=6Z2mGj6qDVv4&format=png">'
					else if(ch =="3") mopty[0]+='<img src="https://img.icons8.com/?size=512&id=658&format=png">'
					else if(ch =="4") mopty[0]+='<img src="https://img.icons8.com/?size=512&id=650&format=png">'
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
				if(item.fcstValue == "1") nipty[0]+='<img src="https://img.icons8.com/?size=512&id=656&format=png">'
				else if(item.fcstValue == "2") nipty[0]+='<img src="https://img.icons8.com/pulsar-color/256/sleet.png">'
				else if(item.fcstValue == "3") nipty[0]+='<img src="https://img.icons8.com/pulsar-color/256/winter.png">'
				else if(item.fcstValue == "4") nipty[0]+='<img src="https://img.icons8.com/pulsar-color/256/heavy-rain.png">'			
				else{
					console.log(ch+"ch")
					if(ch =="1") nipty[0]+='<img src="https://img.icons8.com/?size=512&id=6Z2mGj6qDVv4&format=png">'
					else if(ch =="3") nipty[0]+='<img src="https://img.icons8.com/?size=512&id=658&format=png">'
					else if(ch =="4") nipty[0]+='<img src="https://img.icons8.com/?size=512&id=650&format=png">'
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
				if(item.fcstValue == "1") mopty[1]+='<img src="https://img.icons8.com/?size=512&id=656&format=png">'
				else if(item.fcstValue == "2") mopty[1]+='<img src="https://img.icons8.com/pulsar-color/256/sleet.png">'
				else if(item.fcstValue == "3") mopty[1]+='<img src="https://img.icons8.com/pulsar-color/256/winter.png">'
				else if(item.fcstValue == "4") mopty[1]+='<img src="https://img.icons8.com/pulsar-color/256/heavy-rain.png">'			
				else{
					console.log(ch+"ch")
					if(ch =="1") mopty[1]+='<img src="https://img.icons8.com/?size=512&id=6Z2mGj6qDVv4&format=png">'
					else if(ch =="3") mopty[1]+='<img src="https://img.icons8.com/?size=512&id=658&format=png">'
					else if(ch =="4") mopty[1]+='<img src="https://img.icons8.com/?size=512&id=650&format=png">'
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
				if(item.fcstValue == "1") nipty[1]+='<img src="https://img.icons8.com/?size=512&id=656&format=png">'
				else if(item.fcstValue == "2") nipty[1]+='<img src="https://img.icons8.com/pulsar-color/256/sleet.png">'
				else if(item.fcstValue == "3") nipty[1]+='<img src="https://img.icons8.com/pulsar-color/256/winter.png">'
				else if(item.fcstValue == "4") nipty[1]+='<img src="https://img.icons8.com/pulsar-color/256/heavy-rain.png">'			
				else{
					console.log(ch+"ch")
					if(ch =="1") nipty[1]+='<img src="https://img.icons8.com/?size=512&id=6Z2mGj6qDVv4&format=png">'
					else if(ch =="3") nipty[1]+='<img src="https://img.icons8.com/?size=512&id=658&format=png">'
					else if(ch =="4") nipty[1]+='<img src="https://img.icons8.com/?size=512&id=650&format=png">'
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
				if(item.fcstValue == "1") mopty[2]+='<img src="https://img.icons8.com/?size=512&id=656&format=png">'
				else if(item.fcstValue == "2") mopty[2]+='<img src="https://img.icons8.com/pulsar-color/256/sleet.png">'
				else if(item.fcstValue == "3") mopty[2]+='<img src="https://img.icons8.com/pulsar-color/256/winter.png">'
				else if(item.fcstValue == "4") mopty[2]+='<img src="https://img.icons8.com/pulsar-color/256/heavy-rain.png">'			
				else{
					console.log(ch+"ch")
					if(ch =="1") mopty[2]+='<img src="https://img.icons8.com/?size=512&id=6Z2mGj6qDVv4&format=png">'
					else if(ch =="3") mopty[2]+='<img src="https://img.icons8.com/?size=512&id=658&format=png">'
					else if(ch =="4") mopty[2]+='<img src="https://img.icons8.com/?size=512&id=650&format=png">'
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
				if(item.fcstValue == "1") nipty[2]+='<img src="https://img.icons8.com/?size=512&id=656&format=png">'
				else if(item.fcstValue == "2") nipty[2]+='<img src="https://img.icons8.com/pulsar-color/256/sleet.png">'
				else if(item.fcstValue == "3") nipty[2]+='<img src="https://img.icons8.com/pulsar-color/256/winter.png">'
				else if(item.fcstValue == "4") nipty[2]+='<img src="https://img.icons8.com/pulsar-color/256/heavy-rain.png">'			
				else{
					console.log(ch+"ch")
					if(ch =="1") nipty[2]+='<img src="https://img.icons8.com/?size=512&id=6Z2mGj6qDVv4&format=png">'
					else if(ch =="3") nipty[2]+='<img src="https://img.icons8.com/?size=512&id=658&format=png">'
					else if(ch =="4") nipty[2]+='<img src="https://img.icons8.com/?size=512&id=650&format=png">'
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
</body>
</html>