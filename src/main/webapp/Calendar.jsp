<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String clist = (String)request.getAttribute("number");
	
%>
<!DOCTYPE html>
<html>

<head>
    <title>달력</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Questrial&display=swap');

        body {
        }

        #container {
            background-color : white;
            height: auto;
            width: 320px;
            display:flex;
            justify-content:space-around;
            margin: 0 557px 0 0;
            padding: 20px;
            margin: 0 auto;
            border-radius:5px;
            box-shadow:0px 40px 30px -20px rgba(0,0,0,0.5);
            position:relative;
        }

        td {
            width: 37px;
            height: 37px;
        }

        .Calendar {
            text-align: center;
            margin:0;
        }

        .Calendar>thead>tr:first-child>td {
            font-family: 'Questrial', sans-serif;
            font-size: 1.1em;
            font-weight: bold;
        }

        .Calendar>thead>tr:last-child>td {
            font-family: 'Questrial', sans-serif;
            font-weight: 600;     
        }

        .Calendar>tbody>tr>td>p {
            font-family: 'Montserrat', sans-serif;
            height: 32px;
            width: 32px;
            border-radius: 45px;
            transition-duration: .2s;
            line-height: 32px;
            margin: 2.5px;
            display: block;
            text-align: center;
            font-weight:500;
        }
        .Calendar>tbody>tr>td>p.on{
        	font-weight : 600;
        }
        .pastDay {
            color: lightgray;
        }

        .today {
            background-color: #F5D042;            
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }

        .futureDay {
            background-color: #FFFFFF;
            cursor: pointer;
        }
        .futureDay:hover{
            background:#eee;
        }

        #right{
        	width:130px;
        	height:-webkit-fill-available;
        	position:absolute;
        	left:180px;
        	top:0;
        	border-radius:5px;
        	-webkit-transition:left .3s;
        	-moz-transition: left .3s;     /*left 속성에 대해 0.3초 동안 애니메이션 실행*/
  			-ms-transition: left .3s;
  			-o-transition: left .3s;
  			transition: left .3s;
  			background:linear-gradient(to right,rgba(255, 255, 255),rgba(133, 133, 133, 0.1),rgba(133, 133, 133, 0.2));
  			z-index:-1;
        }
        #right.on{
        	left:360px;
        	z-index:1;
        	border-radius:5px;
        }
        #memo{
        	color:black;
        	font-size:14px;
        	margin:0 0;
        	padding:70px 0 0 32px;
        }
       #memo li{
        	list-style-type: '🌄';
        }
    </style>

    <script>
        window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
        
        //let number = [["20230515 09:00:00", "우암산"], ["20230526 11:00:00", "속리산"], ["20230612 13:00:00", "계룡산"], ["20230930 10:00:00", "산산"], ["20230703 09:00:00", " "]];
        const clist = <%= clist%>;
        						
        let miniList = clist.map(({dDay, m_name})=>({dDay, m_name})).map(item => (Object.values(item)));
        
        for(let i=0; i<miniList.length; i++){
	        miniList[i][0] = new Date(miniList[i][0])
	        miniList[i][0] = miniList[i][0].getFullYear()+""+leftPad((miniList[i][0].getMonth()+1))+leftPad(miniList[i][0].getDate())+" "+leftPad(miniList[i][0].getHours())+":"+leftPad(miniList[i][0].getMinutes());
	        console.log("---------"+  miniList[i][1])
        }
        
        let mate_Date = [];
        let mate_Time = [];
        let mountain = [];
        for(let i=0; i<miniList.length; i++){
        	mate_Date[i] = miniList[i][0].split(" ")[0];
        	mate_Time[i] = miniList[i][0].split(" ")[1].substr(0,5);
        	mountain[i] = miniList[i][1];
        	console.log(mate_Date[i])
        	console.log(mate_Time[i])
        	console.log(mountain[i])
        }
        console.log(mate_Date)
        console.log(mate_Time)
        console.log(mountain)
        
        var memo = document.createElement("li");
        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
        function buildCalendar() {

            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날
			
            let tbody_Calendar = document.querySelector(".Calendar > tbody");
            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

            while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
            }

            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

            for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
                let nowColuemn = nowRow.insertCell();        // 열 추가
            }
            
            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
                let nowColumn = nowRow.insertCell();        // 새 열을 추가하고

                let newDIV = document.createElement("p");
                newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
                nowColumn.appendChild(newDIV);
                
                
                /* mate_Date.forEach(item => function(item, index){
                	
                }) */
                
                mate_Date.forEach(myFunction);
                function myFunction(item,index){
                	
                	if(item == String(nowMonth.getFullYear())+String(leftPad(nowMonth.getMonth()+1))+String(leftPad(nowDay.getDate()))){
                		
                		newDIV.style.background="red";
    					newDIV.style.color="white";
    					
    					
    					newDIV.addEventListener("click",(event)=>{
    						list(index);
    						toggleClass();
							let ons = document.querySelectorAll("p.on");
							console.log(ons)
							for(let i =0; i<ons.length; i++){
								console.log(ons[i])
								ons[i].classList.remove("on");
							}
    						event.target.classList.toggle("on");
    						if(document.querySelector('#right').classList.contains('on')){
    					
    						}else{
    							ons = document.querySelectorAll("p.on");
    							console.log(ons)
    							for(let i =0; i<ons.length; i++){
    								console.log(ons[i])
    								ons[i].classList.remove("on");
    							}
    						}
    					});
                	}
                	else{
    					newDIV.addEventListener("click",()=>{
    						if(newDIV.style.background != 'red'){
    							document.getElementById('right').classList.remove('on');
    							ons = document.querySelectorAll("p.on");
    							console.log(ons)
    							for(let i =0; i<ons.length; i++){
    								console.log(ons[i])
    								ons[i].classList.remove("on");
    							}
    						}
    					});
    				}
                }
               
				/* if (String(leftPad(nowMonth.getMonth()+1))+String(nowDay.getDate()) == day){
					console.log(String(leftPad(nowMonth.getMonth()+1))+String(nowDay.getDate()))
					newDIV.style.background="red";
					newDIV.style.color="white";
					newDIV.style.fontWeight='600';
					newDIV.addEventListener("click",()=>{
						list();
						/* memo.innerText=text;
						document.getElementById('memo').appendChild(memo); */
						/*if(memo.style.display=='none'){
							memo.style.display='block';
						}else{
							memo.style.display='none';
						}
					});
				} */
				function list(i){
					if(mountain[i]==null){mountain[i] = " ";}
                	memo.innerText=mountain[i]+' '+mate_Time[i];
					document.getElementById('memo').appendChild(memo);
                }
				function toggleClass(){
					document.getElementById('right').classList.toggle('on');
				}
				
                if (nowDay.getDay() == 6) {                 // 토요일인 경우
                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                }

                if (nowDay < today) {                       // 지난날인 경우
                    newDIV.className = "pastDay";
                }
                else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
                    newDIV.className = "today";
                }
                else {                                      // 미래인 경우
                    newDIV.className = "futureDay";
                }
            }
        }
 

        // 이전달 버튼 클릭
        function prevCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
            buildCalendar();    // 달력 다시 생성
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
            buildCalendar();    // 달력 다시 생성
        }

        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
        function leftPad(value) {
            if (value < 10) {
                value = "0" + value;
                return value;
            }
            return value;
        }
    </script>
</head>

<body> 
    <div id="container">
        <table class="Calendar">
            <thead>
                <tr>
                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                    <td colspan="5">
                        <span id="calYear"></span>년
                        <span id="calMonth"></span>월
                    </td>
                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                </tr>
                <tr>
                    <td>일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td>토</td>
                </tr>
            </thead>

            <tbody>
            </tbody>
        </table>
    	<div id="right">
        		<ul id="memo">
        		
        		</ul>
    	</div>
    	   	
    </div>
    

</body>

</html>