	$(document).ready(function() {
		
		$("#scheduleModal").click(function() {
			$(".searchDiv").css('display', 'block');
		});
		$("#scheduleBtnC").click(function() {
			$(".searchDiv").css('display', 'none');
		});
		
		$("#mSearchBtn").click(function() {
			$("#MTable").css('display', 'block');
		});
		
	});
	
	
	function formCheck(frm) {
		if(frm.title.value.trim() == "") {
			alert("제목을 입력하세요.");
			frm.title.focus();
			return false;
		}
		if(frm.content.value.trim() == "") {
			alert("내용을 입력하세요.");
			frm.content.focus();
			return false;
		}
		return true;
	}
	
    function mSearch(){
    	let mName = $('#mountainName').val();
 	   	$.ajax({
		   url: './mountain?mode=search&mName='+mName,
		   type: 'GET',
		   dataType: 'json',
		   success: function (data) {
			   $("#MTable").html("");
				   let res = "<tr><th>산이름</th><th>난이도</th><th>추천수</th><th>선택</th></tr>";
			   for(var i=0; i<data.length; i++) {
				   var mName = data[i].mName;
				   res += "<tr><td>" + mName + "</td>";
				   res += "<td>" + data[i].level + "</td>";
				   res += "<td>" + data[i].recommend + "</td>";
				   res += "<td><button type='button' class='inBtn' value=" + mName + " onclick='inName(this.value)'>선택</button></td></tr>"
			   }
			   console.log(res);
				   $("#MTable").append(res);
		   },
		   error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) }
	   });
    };

    function inName(mName) {
    	$("#MTable").css('display', 'none');
    	$('#mountainName').val(mName);
    };
    

	