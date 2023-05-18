<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MountainSearch_Register</title>
  </head>
  <body>
	  <div class="container">
		<div class="search-bar">
			<form class="d-flex" >
				<input class="form-control me-2" id="keyword" type="search" placeholder="산 검색" aria-label="Search">
				<button class="btn btn-outline-secondary" id="searchBtn"  type="button"><i class="fa-solid fa-magnifying-glass i-con"></i></button>
			</form>
		</div>
		
		<div class="card">
			<div class="card-body">
				<div>
					<h5 class="card-title searchName"></h5>
					<i class="fa-solid fa-location-dot" style="line-height: 100px;"></i>
					<span class="card-text resultAddress"></span>
				</div>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<i class="fa-solid fa-person-hiking" style="line-height: 100px;"></i>
          			<span class="resultHeight"></span>
			  	</li>
			  	<li class="list-group-item">
		  	  		<i class="fa-solid fa-code" style="line-height: 100px;"></i>
          	  		<span class="resultCode"></span>
			    </li>
			    <li class="list-group-item">
			    	<div class="card-body result" id="searchResult" ></div>
			    </li>
			</ul>
		</div>

        <form action="./MountainRegister" method="post" onsubmit="return formCheck(this)">
            <table id="mTable">
                <thead>
                  <tr>
                    <th scope="col">이름</th>
                    <th scope="col">주소(1)</th>
                    <th scope="col">주소(2)</th>
                    <th scope="col">레벨(1~5)</th>
                    <th scope="col">등록하기</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><input type="text" id="m_name" value="" name="m_name" placeholder="이름"></td>
                    <td><input type="text" id="m_addr_do"  name="m_addr_1" placeholder="주소(1)"></td>
                    <td><input type="text" id="m_addr_si"  name="m_addr_2" placeholder="주소(2)"></td>
                    <td><input type="number" min="1" max="5" id="level" name="level" placeholder="레벨"></td>
                    <td class="table-secondary" colspan="8" style="text-align: right;"><button type="submit">등록하기</button></td>
                  </tr> 
                </tbody>
            </table>
        </form>
	</div> 
  </body>
</html>