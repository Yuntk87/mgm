<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#comment {
		width:80%;
		height: 20px;
		border: 1px solid black;
	}
	ul {
		list-style : none;
	}
	#commentList {
		text-align: left;
		width: 100%;
	}
	.clist li{
		border-top: 1px solid #999;
		padding:10px;
	}
	.commenter {
		font-weight: bold;
	}
	.comment {
		text-align: justify;
	}
	.delBtn, .modBtnb, #modBtn {
		float:right;
	}
	.regdate{
		font-size:5px;
		color:#999;
	}
	.reply {
		display: inline-block;
		margin-top:10px;
		margin-left:10px;
		font-size:5px;
		color:#999;
	} 
	.postDate {
		margin-top:10px;
		font-size:5px;
		color:#999;
	}
	.mod {
		width:100%;
		margin-top:20px;
	}
	.mod input {
		width:80%;
		margin-right:20px;
		height: 20px;
		border: 1px solid black;
	}
	
</style>
</head>
<body>
	<div class="commentAll">
		<h2>댓글</h2>
		<div id="commentList"></div>
		<h2>댓글쓰기</h2>
		<div class="send">
			<input type="text" name="comment" id="comment">
			<button id="sendBtn" type="button">등록</button>
		</div>
	</div>
<script>
	let fb_num = ${param.num};

	let showList=function(fb_num) {
		let comment = $('input[name=comment]').val("");
		
		$.ajax({
			type:'GET',
			url:'./FreeBoardComments?fb_num='+fb_num,
			contentType: "application/json; charset=utf-8",
			success:function(result) {
				$("#commentList").html(toHtml(result));
			},
			error:function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
			}
		});
	}
	
	$(document).ready(function() {
		showList(fb_num);
		
		//등록
		$("#sendBtn").click(function() {
			let comment = $('input[name=comment]').val();
			if(comment.trim() == '') {
				alert("입력해주세요.");
				return;
			}
			$.ajax({
		        type:'POST',       // 요청 메서드
		        url: './FreeBoardComments?fb_num='+fb_num,  // 요청 URI
		        data : { fb_num:fb_num , comment:comment } ,// 전달 데이터
		        success : function(result){ // 요청이 성공일 때 실행되는 이벤트
		        	showList(fb_num);
		        },
		        error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) } // 에러가 발생했을 때, 호출될 함수
		    }); // $.ajax()
		});
		
		//삭제
		$("#commentList").on("click", ".delBtn", function() {
			let fbc_num = $(this).parent().attr('data-fbc_num');
			$.ajax({
				type:'GET',
				url: './FreeBoardComments?fbc_num=' + fbc_num + '&fb_num=' + fb_num + "&mode=del",
				success : function(result) {
					showList(fb_num);
				},
				error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) }
			});
		});
		
		//수정
		$("#commentList").on("click", ".modBtnb", function() {
			let fbc_num = $(this).parent().attr('data-fbc_num');
			let fb_num = $(this).parent().attr('data-fb_num');
			
			$(".mod", $(this).parent()).append('<input class="form-control" type="text" name="recomment" id="recomment">');
			$(".mod", $(this).parent()).append('<button class="btn btn-default" type="button" id="modBtn">등록</button>');
			$(".mod", $(this).parent()).append('<button class="btn btn-default" type="button" id="modBtnC">취소</button>');
			$('input[name=recomment]').val($('span.comment', $(this).parent()).text());
			$("#modBtn").attr('data-fbc_num', fbc_num);
		});
		
		//수정취소 클릭
		$("#commentList").on("click", "#modBtnC", function() {
			let del = $("#recomment").detach();
			let btn = $("#modBtn").detach();
			let btnc = $("#modBtnC").detach();
		});			
		
		//수정등록 클릭
		$("#commentList").on("click", "#modBtn", function() {
			let comment = $("input[name=recomment]").val();
			if(comment.trim() == '') {
				alert("입력해주세요.");
				return;
			}
			let fbc_num = $("#modBtn").attr('data-fbc_num');
			let del = $("#recomment").detach();
			let btn = $("#modBtn").detach();
			
			$.ajax({
				type: 'POST',
				url: './FreeBoardComments?fbc_num='+ fbc_num + '&mode=mody',
				data: {fbc_num:fbc_num, comment:comment},
				complete: function(result) {
					showList(fb_num);
				},
				error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) }
			});
		});	
		
	}); //ready
	
	let toHtml = function(comments){
		let tmp = "<ul class=clist>";
		comments.forEach(function(comment) {
			tmp += '<li data-fbc_num=' + comment.fbc_num
			tmp += ' data-fb_num=' + comment.fb_num + '>'
			tmp += '작성자: <span class="commenter"> ' + comment.commenter + '</span><br>'
			tmp += '<span class="comment"> ' + comment.comment + '</span><br>'
			tmp += '<span class="postDate"> ' + comment.postDate + '</span>'
			tmp += '<a href="javascript:;" class="reply">답글달기</a>'
			if(comment.commenter == "${sessionScope.UserId}") {
				tmp += '<button class="delBtn">삭제</button>'
				tmp += '<button class="modBtnb">수정</button>'
			}
			tmp += '<div class="mod"></div>'
			tmp += '</li>'
		})
		return tmp + '</ul>';
	}

</script>
</body>
</html>