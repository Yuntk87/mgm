function joinform_check() {
  
    var id = document.getElementById("email1");
    var pwd = document.getElementById("password");
    var pnumber = document.getElementById("pNumber");
    var gender= document.getElementById("gender")
    var postnumber = document.getElementById("sample4_postcode");
    var roadaddress = document.getElementById("sample4_roadAddress");
    var jibun = document.getElementById("sample4_jibunAddress");
    var nname = document.getElementById("nname");
    var agree = document.getElementById("agree");
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

	
	  let regx2 = /^([0-9]){6}$/  //숫자만 입력하는 정규식
  
    if (id.value == "") {
        alert("이메일 주소를 입력하세요.");
        id.focus();
        return false;
      }
     
  
  
    if (pwd.value == "") {
      alert("비밀번호를 입력하세요.");
      pwd.focus();
      return false;
    }
  
    //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
  
   	if (!pwdCheck.test(pwd.value)) {
      alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
      pwd.value="";
      pwd.focus();
      return false;
    }
     
  
     if(pnumber.value==""){
        alert("주민번호를 입력하세요.");
        pnumber.focus();
        return false;
    }

  
	  let regx = /^([0-4]){1}$/  
    if (!regx2.test(pnumber.value)) {
    console.log("=========="+regx.test(pnumber.value))
      alert("주민번호는 숫자만 입력할 수 있습니다.");
      pnumber.focus();
      return false;
    }
	
	myalert();
	
  
}
      function myalert(){
        
        Swal({
            icon: 'success',
            title: 'Alert가 실행되었습니다.',
            text: '이곳은 내용이 나타나는 곳입니다.',

        }).then((result) => {
            if (result.isConfirmed) {
                document.querySelector("#joinform").submit();
            }
        })

    }
 
  
  //이메일 옵션 선택후 주소 자동 완성
  function changeemail() {
    var email_add = document.getElementById("email1");
    var email_sel = document.getElementById("email2");
  
    //지금 골라진 옵션의 순서와 값 구하기
    var idx = email_sel.options.selectedIndex;
    var val = email_sel.options[idx].value;
  
    email_add.value = val;
  }
  
 /**
 * 
 */