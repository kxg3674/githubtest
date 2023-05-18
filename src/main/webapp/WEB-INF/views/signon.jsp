<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입화면</title>
</head>
<style>

body {
    background-color: #F3F4F9;
    margin: 0;
    padding: 0;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.sign_page_page {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.sign_id_pw {
    background-color: white;

    border-radius: 8px;
    box-shadow: 0 0 20px gainsboro;
     padding: 60px 80px;
    width: 320px;
    display: inline-block;
}


.sign_page_signbtn{
    display: block;
    margin-bottom: 20px;
    border: 1px solid #E5E9F5;
    background-color: #F6F7FA;
    padding: 20px;
    margin-top: 10px;
    border-radius: 10px;
    width: 100%;
}

.newSign {
    margin-bottom: 20px;
    border: none;
    font-size: 120%;
}


h3 {
    color: red;
    font-size: 150%;
    font-weight: 500;
     width : 250px;
  height: 85px;
   margin: auto;
}

label {
    color: #7369AB;
}

::placeholder {
    color: #C0C7DB;
    font-size: larger;
    letter-spacing: 1.2px;
}

 #newSign{
     background:#e91e63;
     color:white;
     display:block;
     width:92.5%;
     max-width:680px;
     height:50px;
     border-radius:8px;
   
     border:none;
     cursor:pointer;
     font-size:14px;
     font-family: 'Montserrat', sans-serif;
     box-shadow:0 15px 30px rgba(#e91e63,.36);
    transition:.2s linear;
    &:hover{
      box-shadow:0 0 0 rgba(#e91e63,.0);
    }
  }

 #returnHome{
     background:#5b90f0;
     color:white;
     display:block;
     width:92.5%;
     max-width:680px;
     height:50px;
     border-radius:8px;
    
     border:none;
     cursor:pointer;
     font-size:14px;
     font-family: 'Montserrat', sans-serif;
     box-shadow:0 15px 30px rgba(#e91e63,.36);
    transition:.2s linear;
    &:hover{
      box-shadow:0 0 0 rgba(#e91e63,.0);
    }
  }
button[type="submit"] {

}

button[type="submit"]:hover {
    background-color: #ff6678;
}

button[type="button"] {
    padding: 16px 0 16px 35px;
    background-color: transparent;
    color: #ED4B5E;
}




.termsLink {
    color: #EF7886;
    text-decoration: none;
}

.hide {
    display: none!important;
}

#animation-container {
    display: inline-block;
}

/* responsive display */

@media(max-width:1438px) {
    lottie-player {
        width: 300px!important;
    }
}

@media(max-width:1124px) {
    #animation-container {
        display: none;
    }

    #form-inner-container{
        display: flex;
        justify-content: center;
    }
}

@media(max-width: 684px) {
    #form-controls {
        text-align: center;
        margin: 0;
        padding: 0;
    }

    button {
        width: 100%;
    }

    form input:not(:last-of-type) {
        width: 85%;
    }

    #toggleSignIn, #toggleSignUp {
        padding: 16px 75px;
    }

    
    label[for="terms"] {
        display: inline-block;
        font-size: smaller;
    }
}

/* 변경 전 css */
/* div{ */
/*   width : 330px; */
/*   height: 30px; */
/*  } */
/*   body {  */
/*      background-color: #F3F4F9;  */
/*      margin: 0;  */
/*      padding: 0;  */
/*      font-family: Verdana, Geneva, Tahoma, sans-serif;  */
/*  }  */
 
 
/* /*  페이지마다 중앙 정렬 필요시 사용 */ */
/*  .sign_page_page{ */
/*   	margin: auto; */
/*   	text-align:center; */
/*  } */
/*  .homereturn{ */
/*  width : 300px; */
/*   height: 300px; */
/* } */
</style>
<body>

<br><br><br><br><br>

<div class="sign_page_page">
<!-- 홈 리턴 이미지로 개선 -->
<div class="sign_id_pw">
<div class="homereturn">
<!-- 이미지 오류 개선할것 -->
<a href="login"><h3>Wellcome Petshop</h3></a>
</div>
<!-- <form method="post" action="/doSignon"> -->
<!-- 이름 -->
<div class="sign_page_name">
<label for="name">이름</label><br><input type="text" maxlength="80" name="humanName" id="humanName"  placeholder="이름" autocomplete="off">
</div>
<!-- 아이디 -->
<div class="sign_page_logid">
<label for="id">아이디</label><br><input type="text" maxlength="20" name="logid" id="logid" placeholder="아이디" autocomplete="off">&nbsp;<input type=button id=idCheck value="중복확인">
<br>
<!-- 아이디 유효성 검사 -->
<div id=hiddenId ></div>
</div>
<br>


<!-- 닉네임 -->
<div class="sign_page_nickname">
<label for="nick">닉네임</label><br><input type="text" maxlength="20" name="nickname" id="nickname"  placeholder="닉네임" autocomplete="off">&nbsp;<input type=button id=nickCheck value="중복확인">
<div id=hiddenNick ></div>

</div>
<br>
<!-- 비밀번호 -->
<div class="sign_page_password">
<label for="pasw">비밀번호</label><br><input type="password" maxlength="20" name="password" id="password"  placeholder="비밀번호" autocomplete="off">
</div>
<!-- 비밀번호 확인 -->
<div class="sign_page_repassword">
<label for="repasw">비밀번호 확인</label><br><input type="password" maxlength="20" name="rePassword" id="rePassword"  placeholder="비밀번호확인" autocomplete="off">
</div>
<!-- 전화번호 -->
<div class="sign_page_mobile">
<label for="mob">전화번호</label><br><input type="text" maxlength="20" name="mobile" id="mobile"  placeholder="전화번호" autocomplete="off">
</div>
<!-- 이메일 -->
<div class="sign_page_email">
<label for="mail">e-mail</label><br><input type="text" maxlength="30" name="email" id="email"  placeholder="ex)abc@naver.com" autocomplete="off">&nbsp;<input type=button id=emailCheck value="메일확인">
<div id=hiddenEmail>
</div><input type=hidden id="emailCheckHi" name="emailCheckHi">

</div>

<br>
<div class="sign_page_signbtn">
<input type=submit id=newSign value="회원가입">
<br>
<input type=button id=returnHome value="취소">
</div>
<!-- </form> -->
</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#returnHome',function(){
	document.location="/main"
})
.on('click','#idCheck',function(){
	console.log($("#logid").val())

		$.ajax({url:'/idCheck',
			data:{idCheck:$("#logid").val()},
				dataType:"text",
				type:"post",
				beforeSend:function(){
					if($("#logid").val()==""){
					
					alert("아이디를 입력하세요")
					return false;
				}
					
				},
				
		success:function(data){
			console.log(idCheck)
			console.log(data)
			if(data=="ok"){
				alert("사용가능한 아이디 입니다")
				$('#hiddenId').val("ok")
				$('#hiddenId').html('<a style="color:blue";>사용가능한 아이디입니다</a>');
			} else {
				alert("이미 사용중인 아이디 입니다")
				$('#hiddenId').val("fail")
				$('#hiddenId').html('<a style="color:red";>이미 사용중인 아이디입니다</a>');
			}
		}
			
		})
    
	
})
.on('click','#nickCheck',function(){
	console.log($("#nickname").val())
	
		$.ajax({url:'/nickCheck',
			data:{nickCheck:$("#nickname").val()},
				dataType:"text",
				type:"post",
				beforeSend:function(){
					if($("#nickname").val()==""){
					
					alert("닉네임을 입력하세요")
					return false
				}
					
				},
		success:function(data){
			console.log(idCheck)
			console.log(data)
			if(data=="ok"){
				alert("사용가능한 닉네임 입니다")
				$('#hiddenNick').val("ok")
				$('#hiddenNick').html('<a style="color:blue";>사용 가능한 닉네임 입니다</a>');
				console.log($('#hiddenNick').val()+"qwe")
			} else {
				alert("이미 사용중인 닉네임 입니다")
				$('#hiddenNick').val("fail")
				$('#hiddenNick').html('<a style="color:red";>이미 사용중인 닉네임 입니다</a>');
				console.log($('#hiddenNick').val()+"aasd")
			}
			}
		
		})
	
})
.on('click','#rePassword',function(){
	console.log($('#rePassword').val())
})

// 아약스 수정 실행 가능 확인
.on('click','#newSign',function(){
	$.ajax({
		url:'/doSignon',
		data:{member_name:$("#humanName").val(),
			member_id:$("#logid").val(),
			nickname:$("#nickname").val(),
			password:$("#password").val(),
			mobile:$("#mobile").val(),
			email:$("#email").val(),
			repassword:$("#rePassword").val()
			},
			
			dataType:"text",type:"post",
		success:function(data){
			console.log("이름"+$("#humanName").val())
			console.log("비밀"+$("#password").val())
			console.log("re비밀"+$("#rePassword").val())
			console.log("닉네임"+$("#nickname").val())
			console.log("번호"+$("#mobile").val())
			console.log("이메일"+$("#email").val())
			console.log("아이디"+$("#logid").val())
			console.log("닉check"+$("#hiddenNick").val()+"idcheck"+$("#hiddenId").val()+"ea"+$("#emailCheckHi").val())
			if(data=="ok" && $("#hiddenNick").val()=="ok" && $("#hiddenId").val()=="ok"
				 && $("#emailCheckHi").val()=="ok"	){
				alert("회원가입을 환영합니다")
				document.location="/login?id="+$("#logid").val()
			} else {
				alert("정보를 다시 확인해 주세요")
				return false;
			}
		}
	})
})

.on('click','#emailCheck',function(){
  email = $('#email').val();
  console.log(email)
  
  var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

 //test 함수 == 문자열이 정규식을 만족하는지 판별하는 함수
 //조건을 만족하면 true를 반환, 만족하지 못하면 false반환
 console.log(regEmail.test(email))
 if(regEmail.test(email)){
	 
	 
	 $('#emailCheckHi').val("ok");
	 console.log($('#emailCheckHi').val());
	 $('#hiddenEmail').html('<label style="color:blue">올바른 이메일 입니다</label>');
	 
	 
 } else{     
	 
	 $('#emailCheckHi').val("fail")
	 console.log($('#emailCheckHi').val());
	 $('#hiddenEmail').html('<label style="color:red">잘못된 이메일 입니다</label>');
 }
  
})

</script>
</html>