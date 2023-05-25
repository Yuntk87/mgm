//admin user
var requset=new XMLHttpRequest();


function searchFunction(){
	requset.open("post","./SearchServlate?nickName="+encodeURIComponent(document.getElementById("nickName").value),true);
	requset.onreadystatechange=searchProcess;
	requset.send(null)
}

function searchProcess(){
	var table=document.getElementById("ajaxtable");
	table.innerHTML="";
	if(requset.readyState==4&&requset.status==200){
		var object=eval('('+requset.responseText+')');
		var result=object.result;
		for(var i =0;i<result.length;i++){
			var now=table.insertRow(i);
			for(var j =0;j<result[i].length;j++){
				var cell=now.insertCell(j);
				cell.innerHTML=result[i][j].value;
				
				console.log(cell.innerHTML=result[i][j].value);
			}
			var cell=now.insertCell();
//			cell.innerHTML = '<a href="./delete?id='+result[i][0].value+'">삭제</a>'
			cell.innerHTML = '<a href="./user?mode=del&userNum=' + result[i][0].value + '">삭제</a>'
		}
	}
}