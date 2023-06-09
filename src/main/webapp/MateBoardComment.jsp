<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MateBoardComment</title>
<link rel="stylesheet" href="./css/MateBoardComment.css">
</head>
<body>
	<div class="commentAll">
		<h2>댓글</h2>
		<div id="commentList"></div>
		<div class="coSend">
			<input type="text" name="comment" id="comment" placeholder="댓글입력">
			<button id="coSendBtn" class="myButton" type="button">등록</button>
		</div>
	</div>
<script>
	let mate_num = ${param.num};

	let showList=function(mate_num) {
		let comment = $('input[name=comment]').val("");
		
		$.ajax({
			type:'GET',
			url:'./MateBoardComments?mate_num='+mate_num,
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
		showList(mate_num);
		
		//등록
		$("#coSendBtn").click(function() {
			let comment = $('input[name=comment]').val();
			if(comment.trim() == '') {
				alert("입력해주세요.");
				return;
			}
			$.ajax({
		        type:'POST',       // 요청 메서드
		        url: './MateBoardComments?mate_num='+mate_num,  // 요청 URI
		        data : { mate_num:mate_num , comment:comment } ,// 전달 데이터
		        success : function(result){ // 요청이 성공일 때 실행되는 이벤트
		        	showList(mate_num);
		        },
		        error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) } // 에러가 발생했을 때, 호출될 함수
		    }); // $.ajax()
		});
		
		//삭제
		$("#commentList").on("click", ".delBtn", function() {
			let matec_num = $(this).parent().attr('data-matec_num');
			$.ajax({
				type:'GET',
				url: './MateBoardComments?matec_num=' + matec_num + '&mate_num=' + mate_num + "&mode=del",
				success : function(result) {
					showList(mate_num);
				},
				error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) }
			});
		});
		
		//수정
		$("#commentList").on("click", ".modBtnb", function() {
			let matec_num = $(this).parent().attr('data-matec_num');
			let mate_num = $(this).parent().attr('data-mate_num');
			
			$(".mod", $(this).parent()).append('<div class="modDiv1"><input class="form-control" type="text" name="recomment" id="recomment"></div>');
			$(".mod", $(this).parent()).append('<div class="modDiv2"><button class="btn btn-default myButton" type="button" id="modBtnN">등록</button><button class="btn btn-default myButton" type="button" id="modBtnC">취소</button></div>');
			$('input[name=recomment]').val($('span.comment', $(this).parent()).text());
			$("#modBtnN").attr('data-matec_num', matec_num);
		});
		
		//수정취소 클릭
		$("#commentList").on("click", "#modBtnC", function() {
			let del = $("#recomment").detach();
			let btn = $("#modBtnN").detach();
			let btnc = $("#modBtnC").detach();
		});			
		
		//수정등록 클릭
		$("#commentList").on("click", "#modBtnN", function() {
			let comment = $("input[name=recomment]").val();
			if(comment.trim() == '') {
				alert("입력해주세요.");
				return;
			}
			let matec_num = $("#modBtnN").attr('data-matec_num');
			let del = $("#recomment").detach();
			let btn = $("#modBtnN").detach();
			
			$.ajax({
				type: 'POST',
				url: './MateBoardComments?matec_num='+ matec_num + '&mode=mody',
				data: {matec_num:matec_num, comment:comment},
				complete: function(result) {
					showList(mate_num);
				},
				error: function(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) }
			});
		});	
		
	}); //ready
	
	let toHtml = function(comments){
		let tmp = "<ul class=clist>";
		comments.forEach(function(comment) {
			tmp += '<li data-matec_num=' + comment.matec_num
			tmp += ' data-mate_num=' + comment.mate_num + '>'
			tmp += '<span class="commenter"><a href="./yourpage?id=' + comment.commenter + '">' + comment.commenter + '</a></span> : '
			tmp += '<span class="comment"> ' + comment.comment + '</span><br>'
			tmp += '<span class="postDate"> ' + comment.postDate + '</span>'
			if(comment.commenter == "${sessionScope.UserNickName}" || "admin" == ("${sessionScope.UserNickName}")) {
				tmp += '<button class="delBtn myButton">삭제</button>'
				tmp += '<button class="modBtnb myButton">수정</button>'
			}
			tmp += '<div class="mod"></div>'
			tmp += '</li>'
		})
		return tmp + '</ul>';
	}

</script>
</body>
</html>