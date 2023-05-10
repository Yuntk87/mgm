<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!doctype html>
<html lang="ko">
  <head>
  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>MountainRegister</title>
  </head>
  <style>
    .bg {
        width: 100%;
    }
    form {
        width: 60%;
        margin: 0 auto;
        margin-top: 150px;
    }
    td {
        height: 80px;
    }
    input {
        width: 100px;
        border: none;
    }
    button {
        border: none;
        border-radius: 5px;
        background-color: white;
    }
    button:hover {
        text-decoration: underline;
    }
  </style>
  <body>
 <%@ include file="Navi.jsp" %>

    <div class="bg">
        <form action="./MountainRegister" method="post" onsubmit="return formCheck(this)">
            <table class="table">
                <tr>
                    <th class="table-dark" colspan="6" style="text-align: center;">산 등록 페이지</th>
                </tr>
            </table>
            <table class="table" >
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">이름</th>
                    <th scope="col">주소(1)</th>
                    <th scope="col">주소(2)</th>
                    <th scope="col">레벨</th>
                    <th scope="col">추천</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row"></th>
                    <td><input type="text" id="m_name"  name="m_name" placeholder="이름"></td>
                    <td><input type="text" id="m_addr_do"  name="m_addr_1" placeholder="주소(1)"></td>
                    <td><input type="text" id="m_addr_si"  name="m_addr_2" placeholder="주소(2)"></td>
                    <td><input type="text" id="level" name="level" placeholder="레벨"></td>
                    <td><input type="text" id="m_recommend" name="m_recommend" placeholder="추천수"></td>
                  </tr> 
                </tbody>
            </table>
            <table class="table">
                <tr>
                    <th class="table-dark" colspan="8" style="text-align: right;"><button type="submit">등록하기</button></th>
                </tr>
            </table>
        </form>
    </div>
    
    
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <script>
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

	</script>
 <%@ include file="./Footer.jsp" %>  
  </body>
</html>














