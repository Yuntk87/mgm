
	$(document).ready(function() {
		
		$(".boardList tr").hover(function(){
		
			$(this).addClass("one")
			if($(this).hasClass("last"))
				$(this).prev().addClass("one")
			else
				$(this).next().addClass("one")
		
			if($(this).hasClass("page_bar"))
				$(this).removeClass("one")
				
			if($(this).hasClass("zero"))
				$(this).removeClass("one")
		}, function(){
				$(this).removeClass("one")
				if($(this).hasClass("last"))
					$(this).prev().removeClass("one")
				else
					$(this).next().removeClass("one")
			});
			
	});
	
	function orders(val) {
		let sf = document.getElementById("searchField").value;
		let sw = document.getElementById("search").value;
		let jc = document.getElementById("joinCheck").checked;
		let jcv = document.getElementById("joinCheck").value;
		
		let url = "./MateBoardList?sortField="+val;

		if(jc) {
			url += "&joinCheck="+jcv;
		}

		if(sf != null) {
			url += "&searchWord="+sw+"&searchField="+sf;
		}
		window.open(url, "_self");
	};
	
	function ordersF(val) {
		let sf = document.getElementById("searchField").value;
		let sw = document.getElementById("search").value;
		
		let url = "./FreeBoardList?sortField="+val;

		if(sf != null) {
			url += "&searchWord="+sw+"&searchField="+sf;
		}
		window.open(url, "_self");
	};
	
	function joinChk() {
		let sf = document.getElementById("searchField").value;
		let sw = document.getElementById("search").value;
		let jc = document.getElementById("joinCheck").checked;
		let jcv = document.getElementById("joinCheck").value;
		let sort = document.getElementById("sortField").value;
		
		let url = "./MateBoardList?";
		
		if(jc) {
			url += "&joinCheck="+jcv;
		} 

		if(sort != null) {
			url += "&sortField="+sort;
		}

		if(sf != null) {
			url += "&searchWord="+sw+"&searchField="+sf;
		}
		window.open(url, "_self");
	};