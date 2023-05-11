	function deletePost() {
		var confirmed = confirm("정말 삭제하시겠습니까?");
		if(confirmed) {
			var form = document.writeFrm;
			form.method = "post"
			form.action = "./MateBoardDelete";
			form.submit();
		}
	}

	let joinBtn = function(res){
		let tmp = "";
		if(res == "y") {
			console.log("참가신청 완료");
			$("#joinBtn").text("참가취소");
		} else {
			console.log("참가취소");
			$("#joinBtn").text("참가하기");
		}
		return tmp;
	}
	
	
	$(document).ready(function() {
		//등록
		$("#joinBtn").click(function() {
			let mateNum = $('#num').val();
			let id = $('#id').val();
			let mNum = $('#mNum').val();
			let dDay = $('#dDay').text();
			$.ajax({
		        type:'POST',       // 요청 메서드
		        url: './MateJoin',
		        dataType : "json",
		        data : { mateNum:mateNum , id:id, mNum:mNum, dDay:dDay  } ,// 전달 데이터
		        success : function(data){ // 요청이 성공일 때 실행되는 이벤트
		        	let obj = data;
		        	let res = obj.result;
					$("#cnt").text(obj.cnt);
					if(res == "y") alert("참가신청 완료");
					if(res == "n") alert("참가신청 취소");
					if(res == "re") alert("예정일에 이미 참가일정이 있습니다. 일정을 확인 해 주세요");
		        	joinBtn(obj.result);
		        },
		        error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) } // 에러가 발생했을 때, 호출될 함수
		    }); // $.ajax()
		});
		
		
	});