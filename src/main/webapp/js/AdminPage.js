//admin
//$(document).ready(function() {
//	$("#pg a").click(setTimeout(function() {
//		$("#tablinks1").trigger("click");
//	}),1000);	
//});
	 
 
//admin mountain
	function formCheck(form) {
		if (form.m_name.value.trim() == "") {
			alert("산이름 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.m_addr_1.value.trim() == "") {
			alert("주소(1) 입력하세요");
			form.content.focus();
			return false;
		}
		if (form.m_addr_2.value.trim() == "") {
			alert("주소(2) 입력하세요");
			form.content.focus();
			return false;
			
		}
		if (form.level.value.trim() == "") {
			alert("레벨을 입력하세요");
			form.content.focus();
			return false;
			
		}
	}
	
	
	 $(function() {
       	 $('#searchBtn').click(function() {
       	     let keyword = $('#keyword').val();
       	     $.ajax({
       	         url: "./api?keyword="+keyword, // 요청 URL
       	         type: "get", // HTTP 메서드
       	         dataType: "xml", // 응답 데이터 형식
       	         success: sucFuncJson1, // 요청 성공 시 호출할 메서드 설정,
       	         error: errFunc // 요청 실패 시 호출할 메서드 설정
        	    });
       		 });
    	});
		
		$(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson2, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
		$(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson3, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
		$(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson4, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
		
		$(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson5, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
        $(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson6, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
		function sucFuncJson1(d) {

            var list = '';       
            $(d).find('item').each(function(index, item) {
				list+='<h2>'+$(this).find('mntnnm').text()+'</h2>'; //산명
				temp = $(this).find('mntnnm').text().split(' ');
				$('input[name=m_name]').attr('value', temp[0]);
            });
            $('.searchName').html(list);
            $('.card').css("display","block");
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
		
        // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson2(d) {
 
            var list = '';
       
            $(d).find('item').each(function(index, item) {               
                list+='<p>'+$(this).find('mntninfodtlinfocont').text()+'</p>'; //상세정보 산               
                
                temp = $(this).find('mntninfopoflc').text().split(' ');
                
                $('input[name=m_addr_1]').attr('value', temp[0]);
                $('input[name=m_addr_2]').attr('value', temp[1]);
            });
            $('#searchResult').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
     // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson3(d) {
 
            var list = '';
         
            $(d).find('item').each(function(index, item) {         
                list+='위치 : '+$(this).find('mntninfopoflc').text(); //소재지           
            });
            $('.resultAddress').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
     // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson4(d) {

            var list = '';
   
            $(d).find('item').each(function(index, item) {      
            	list+='높이 : '+$(this).find('mntninfohght').text()+'m'; //산높이      
            });
          
            $('.resultHeight').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
        
     // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson5(d) {

            var list = '';

            $(d).find('item').each(function(index, item) {
            	list+= '산코드 : ' + $(this).find('mntnid').text() ; //산코드             
            });
            $('.resultCode').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
        
         function sucFuncJson6(d) {
       
            var list = '';
			var temp = '';
            $(d).find('item').each(function(index, item) {
            	list+= '산코드 : ' + $(this).find('mntnid').text() ; //산코드             
            	temp = $(this).find('mntninfohght').text().split(' : ');
            	console.log(temp[0])
            });
            if(temp[0] < 400) {
				$('input[name=level]').attr('value', 1);
			} 
			else if(temp[0] < 600) {
				$('input[name=level]').attr('value', 2);
			}
			else if(temp[0] < 800) {
				$('input[name=level]').attr('value', 3);
			}
			else if(temp[0] < 1000) {
				$('input[name=level]').attr('value', 4);
			}
			else {
				$('input[name=level]').attr('value', 5);
			}
			
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
    

		$('button').click(function(){
  		if($(this).hasClass('btn_unlike')){
			$(this).removeClass('btn_unlike');
			$('.ani_heart_m').removeClass('hi');
			$('.ani_heart_m').addClass('bye');
  		}
  		else{
			$(this).addClass('btn_unlike');
			$('.ani_heart_m').addClass('hi');
			$('.ani_heart_m').removeClass('bye');
  		}
  		});
