<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	String day11 = sdf2.format(cal1.getFirstDayOfWeek());
	
	
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
	var mintmp=[0,0,0,0,'','','','','','',''];
	var maxtmp=[0,0,0,0,'','','','','','',''];

	$(d).find('item').each(function(index, item){
		for(let i=4; i<=10; i++){
			mintmp[i] +=$(this).find('taMin'+i).text()+'°';
			maxtmp[i] +=$(this).find('taMax'+i).text()+'°';
		}
	});
	
	for(let i=4; i<=10; i++){
   	 	$('#mintmpp'+i).html(mintmp[i]);
   	 	$('#maxtmpp'+i).html(maxtmp[i]);
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
	var npty=[0,0,0,0,'','','','','','',''];
	var bpty=[0,0,0,0,0,0,0,0,'','',''];
	
	let pty=[0,0,0,0,0,0,0,0,'','',''];
	let ppty = [0,0,0,'','','','','','','',''];

	$(d).find('item').each(function(index, item){
		for(let i=4; i<=10; i++){
			npop[i] +=$(this).find('rnSt'+i+'Pm').text()+'%';
			pop[i] +=$(this).find('rnSt'+i).text()+'%';
			nsky[i] +=$(this).find('wf'+i+'Pm').text();
			sky[i] +=$(this).find('wf'+i).text();
			ppty[i] =$(this).find('wf'+i+'Pm').text();
			pty[i] =$(this).find('wf'+i).text();
			
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
	
	for(let i=4; i<=10; i++){
   	 	$('#npopp'+i).html(npop[i]);
   	 	$('#popp'+i).html(pop[i]);
// 	 	$('#nskyy'+i).html("(" + nsky[i] + ")");
// 	 	$('#skyy'+i).html("(" + sky[i] + ")");
	 	$('#nptyy'+i).html(npty[i]);
	 	$('#ptyy'+i).html(bpty[i]);
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
		}
		  //당일 오후 3시
		if(item.fcstDate==<%=titleDate%> && item.fcstTime == '1500'){
			if(item.category =='TMP'){
				ntmp[0] += item.fcstValue+'°'
		  	}
			if(item.category == 'SKY'){
				ch = item.fcstValue;
				if(item.fcstValue =="1") nisky[0]+='(맑음)'
				if(item.fcstValue =="3") nisky[0]+='(구름 많음)'
				if(item.fcstValue =="4") nisky[0]+='(흐림)'
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
		 }
		  //다음날 오후 3시
		if(item.fcstDate==<%=tomorrow%> && item.fcstTime == '1500'){
			if(item.category =='TMP'){
				ntmp[1] += item.fcstValue+'°'
		  	}
			if(item.category == 'SKY'){
				ch = item.fcstValue;
				if(item.fcstValue =="1") nisky[1]+='(맑음)'
				if(item.fcstValue =="3") nisky[1]+='(구름 많음)'
				if(item.fcstValue =="4") nisky[1]+='(흐림)'
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
		 }
		  //모레 오후 3시
		if(item.fcstDate==<%=after%> && item.fcstTime == '1500'){
			if(item.category =='TMP'){
				ntmp[2] += item.fcstValue+'°'
		  	}
			if(item.category == 'SKY'){
				ch = item.fcstValue;
				if(item.fcstValue =="1") nisky[2]+='(맑음)'
				if(item.fcstValue =="3") nisky[2]+='(구름 많음)'
				if(item.fcstValue =="4") nisky[2]+='(흐림)'
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
		  $('#mintmpp'+z).html(mtmp[z]);
		  $('#maxtmpp'+z).html(ntmp[z]);
		  $('#nptyy'+z).html(nipty[z]);
		  $('#nskyy'+z).html(nisky[z]);
		  $('#npopp'+z).html(nipop[z]);
	  }
  }

/* let slideIndex2 = 0;
showSlides2();

function showSlides2() {
  	let i;
  	let slides2 = document.getElementsByClassName("title");
  	for (i = 0; i < slides2.length; i++) {
    	slides2[i].style.display = "none";
  	}
  	slideIndex2++;
  	if (slideIndex2 > slides2.length) {slideIndex2 = 1}
  	slides2[(slideIndex2)-1].style.display = "block";
  	setTimeout(showSlides2, 3000); // Change image every 2 seconds
} */
</script>