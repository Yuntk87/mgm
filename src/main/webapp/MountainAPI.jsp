<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>검색 API</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        // [검색 요청] 버튼 클릭 시 실행할 메서드를 정의합니다.
        $(function() {
            $('#searchBtn').click(function() {
                let keyword = $('#keyword').val();
                $.ajax({
                    url: "./api?keyword="+keyword, // 요청 URL
                    type: "get", // HTTP 메서드
                    dataType: "xml", // 응답 데이터 형식
                    success: sucFuncJson, // 요청 성공 시 호출할 메서드 설정,
                    error: errFunc // 요청 실패 시 호출할 메서드 설정
                });
            });
        });
        // 검색 성공 시 결과를 화면에 뿌려줍니다.
        function sucFuncJson(d) {
            console.log(d)
            var list = '';
            var temp = '';
            $(d).find('item').each(function(index, item) {
                list += '<ul>'
                list+='<li>'+$(this).find('mntnnm').text()+'</li>'; //산명
                list+='<li>'+$(this).find('mntninfopoflc').text()+'</li>'; //소재지
                list+='<li>'+$(this).find('mntninfopoflc').text().split(' ',1)+'</li>'; //소재지
                list+='<li>'+$(this).find('mntninfohght').text()+'m</li>'; //산높이
                list += '<li>산코드' + $(this).find('mntnid').text() + '</li>'; //산코드
                list+='<li>'+$(this).find('hndfmsmtnslctnrson').text()+'</li>'; // 100대산 선정이유
                list+='<li>'+$(this).find('mntninfodscrt').text()+'</li>'; // 상세정보 개관
                list+='<li>'+$(this).find('mntninfodtlinfocont').text()+'</li>'; //상세정보 산
                list+='<li>'+$(this).find('pbtrninfodscrt').text()+'</li>'; //대중교통 정보
                list+='<li>'+$(this).find('crcmrsghtnginfoetcdscrt').text()+'</li>'; //기타코스
                list+='<li>'+$(this).find('hkngpntdscrt').text()+'</li>'; //산행 포인트설명
                list+='<li><img src="'+$(this).find('mntnattchimageseq').text()+'"</li>'; //산정보 이미지
                list+='<li><img src="'+$(this).find('mntninfotrnspinfoimageseq').text()+'"</li>'; //교통정보 이미지
                list+='<li><img src="'+$(this).find('rcmmncoursimageseq').text()+'"</li>'; //추천코스 이미지           
                list+='<li><a href="'+$(this).find('hndfmsmtnmapimageseq').text()+'">지도</a></li>'; //100대명산 지도
                
                temp = $(this).find('mntninfopoflc').text().split(' ');
                
                list += '<form action="./MountainRegister.jsp">'
                list += '<input type="text" name="mname" value="';
                list +=	$(this).find('mntnnm').text();
                list += '"></input>';
                list += '<input type="text" name="madd1" value="';
                list +=	temp[0];
                list += '"></input>';
                list += '<input type="text" name="madd2" value="';
                list +=	temp[1];
                list += '"></input>';
                list += '<input type="text" name="mhight" value="';
                list +=	$(this).find('mntninfohght').text();
                list += '"></input>';
                list+='<li><button type="submit">등록</button></li>'; //등록버튼
                list += '</form>';
                list += '</ul>'
            });
            $('#searchResult').html(list);
        }
        // 실패 시 경고창을 띄워줍니다.
        function errFunc(e) {
            alert("실패: " + e.status);
        }
        
	
    </script>

    <style>
        ul {
            border: 2px #cccccc solid;
        }
    </style>
</head>

<body>
    <div>
        <div>
            <form id="searchFrm">
                <input type="text" id="keyword" placeholder="검색어를 입력하세요." />
                <button type="button" id="searchBtn">검색 요청</button>
            </form>
        </div>
        <div class="row" id="searchResult">
            여기에 검색 결과가 출력됩니다.
        </div>
    </div>
</body>

</html>