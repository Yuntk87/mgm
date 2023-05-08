<%@page import="java.io.Console"%>
<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
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
			var now=table.insertRow(0);
			for(var j =0;j<result[i].length;j++){
				var cell=now.insertCell(j);
				cell.innerHTML=result[i][j].value;
				console.log(cell.innerHTML=result[i][j].value);
				
			}
			cell.innerHTML = '<a href="./delete?id='+result[i][0].value+'">삭제</a>'
		}
	}
}

</script>


<style>
.search {
  display: flex;
}

input[type="text"] {
  width: 1600px;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
}

button {
  width: 200px;
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin:9px;
}

button:hover {
  background-color: #45a049;
}

table {
  font-family: Arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

th {
  background-color: #dddddd;
  color: #333;
  font-weight: bold;
}

h2{
text-align:center;
}



</style>
</head>

<body>


<H2>회원목록조회</H2>
<div class="search">
<div class="search-container">

<input class="form-control" id="nickName" onkeyup="searchFunction()"type="text" size="20" placeholder="닉네임 검색">
</div>
 <div >
<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
</div> 
</div>
<table class="table" style="text-align:center;border:1px solid #dddddd">
<tr>
   <th style="background-color:#fafafa; text-align:center;">번호</th>
   <th style="background-color:#fafafa; text-align:center;">아이디</th>
   <th style="background-color:#fafafa; text-align:center;">비밀번호</th>
   <th style="background-color:#fafafa; text-align:center;">닉네임</th>
   <th style="background-color:#fafafa; text-align:center;">이름</th>
   <th style="background-color:#fafafa; text-align:center;">전화번호</th>
   <th style="background-color:#fafafa; text-align:center;">생년월일</th>
   <th style="background-color:#fafafa; text-align:center;">주소1</th>
   <th style="background-color:#fafafa; text-align:center;">주소2</th>
<!--    <th style="background-color:#fafafa; text-align:center;">가입일자</th> -->
   <th style="background-color:#fafafa; text-align:center;">삭제</th>
   
<tr>

 



<tbody id="ajaxtable">
<% 
UserDao dao = new UserDao(getServletContext());
ArrayList<UserDto> mList = dao.selectAll();
for (int i=0; i<mList.size();i++){
	UserDto m = mList.get(i);
%>

<tr>
  <td id="userNum"><%=m.getUser_num() %></td>
  <td><%=m.getId() %></td>
  <td><%=m.getPassword()%></td>
  <td><%=m.getNickName()%></td>
  <td><%=m.getName()%></td>
  <td><%=m.getPhone() %></td>
  <td><%=m.getpNumber() %></td>
  <td><%=m.getAddr1() %></td>
  <td><%=m.getAddr2() %></td>
<%--   <td><%=m.getPostDate() %></td> --%>
  <td><a href="./user?mode=del&userNum=<%=m.getUser_num() %>">삭제</a>
  </tr>
  <%} %>
  </tbody>
</table>
</body>
</html>