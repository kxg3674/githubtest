<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
</head>
<style>
body {
    background-color: #F3F4F9;
    margin: 0;
    padding: 0;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
}

 
  .login_page{
	 margin: auto;
  text-align:center;
 }

 .log {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 20px gainsboro;
     padding: 60px 80px;
    width: 320px;
    display: inline-block;
    top:-15px;
}
 
 
.homereturn{
 width : 250px;
  height: 85px;
   margin: auto;
}
.login_id_pw{
     margin:20px auto;
     display:block;
     position:relative;
   
     
     &.login_id_pw{
        &::before{
          content:"";
          position:absolute;
          top:-15px;
          left:50px;
          display:block;
          width:0;
          height:10;
        background:transparent;
          border-left:15px solid transparent;
          border-right:15px solid transparent;
          border-bottom:15px solid rgba(#0f132a,.1);
          transition:.2s linear;
          
        }
     }
     &.login_page_password{
      &::before{
        content:"";
        position:absolute;
        top:-15px;
        left:150px;
        display:block;
        width:0;
        height:10;
        background:transparent;
        border-left:15px solid transparent;
        border-right:15px solid transparent;
        border-bottom:15px solid rgba(#0f132a,.1);
        transition:.2s linear;
     
        }
     }
}

input{
        display:block;
        width:90%;
        max-width:680px;
        height:50px;
        margin:0 auto;
        border-radius:8px;
        border:none;
        background: rgba(#D3D3D3,.1);
        color : rgba(#D3D3D3,.3);
        padding:0 0 0 15px;
        font-size:14px;
        font-family: 'Montserrat', sans-serif;
        &:focus,
        &:active{
          outline:none;
          border:none;
          color : rgba(#0f132a,1);
        }
}
 #logBtn{
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


 #signBtn{
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

h1{
  color:#e91e63;
  font-size:48px;
  letter-spacing:-3px;
  text-align:center;
  margin:120px 0 80px 0 ;
  transition:.2s linear;
}


</style>
<body>

<br><br><br><br>
<div class="login_page">

<!-- 리턴은 홈이미지로 개선 -->
<div class="log">
<div class="homereturn">
<a href="test"><h1>SIGN IN</h1></a>
</div>
<!-- 아이디 -->
<div class="login_id_pw">
<div class="login_page_logid">
<input type="text" maxlength="80" name="logid" id="logid" class="input" value="${login }" placeholder="아이디" autocomplete="off">
</div>
<br>
<!-- 비밀번호 -->
<div class="login_page_password">
<input type="password" maxlength="80" name="password" id="password" class="input" placeholder="비밀번호" autocomplete="off">
</div>
</div>
<br><br><br><br>
<!-- 로그인 회원가입 버튼 -->
<div class="login_signbtn">
<input type=submit id=logBtn value="로그인">&nbsp;

<input type=button id=signBtn value="회원가입">
</div>
</div>
<!--SNS 버튼-->
<div class="sns-login-box">
    <a href="javascript:;" class="kakao">KAKAO</a>
    <a href="javascript:;" class="naver">NAVER</a>
    <a href="javascript:;" class="facebook">FACEBOOK</a>
    <a href="javascript:;" class="google g_id_signin" data-type="icon" data-shape="pill" data-size="large">GOOGLE</a>
</div>
<!--//SNS 버튼-->


</div>


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)


.on('click','#signBtn',function(){
	document.location="/signon"
})

.on('click','#logBtn',function(){
	if($('#logid').val()=="" || $('#password').val()==""){
		alert("로그인 정보를 입력해주세요");
		return false;
	}
	$.ajax({url:'/doLogin',data:{id:$('#logid').val(),pw:$('#password').val()},
		dataType:'text',type:"post",success:function(data){
			if(data=="ok"){
				alert("환영합니다")
				document.location="/main"
			} else {
				alert("로그인 정보를 확인해 주세요")
			}
		}
			
	})
});{
}
</script>
</html>