<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new</title>
</head>
<style>
table,tr,td {
    margin-left:auto; 
    margin-right:auto;
     
    border: 1px solid #bcbcbc;
    
}
</style>
<body style="text-align:center">
<p style="font-size:50px" >BBS</p>
<form method="Post" action="/insertdetail" id="formnew">
<table>
<tr><td colspan=2>제목<input type=text name=newtitle id=newtitle></td></tr>
<tr><td colspan=2>작성자<input type=text name=writer id=writer value="${nickname }" readonly></td></tr>
<tr><td >내용</td><td><textarea rows="4" cols="50" 
				name=newdetail id=newdetail ></textarea></td></tr>
<tr><td colspan=2><input type=submit name=adddetail id=adddetail value="등록">
	<input type=button name=returnlist id=returnlist value="취소">
	<input type=reset name=reset id=reset value="비우기"></td></tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#returnlist',function(){
	alert("취소하였습니다")
	document.location='/list';
})
.on('submit','#formnew',function(){
	if($.trim($('#newtitle').val())=='' || $.trim($('#newtitle').val())==null ){
		alert("제목을 입력하시오")
		return false;
	} else if($.trim($('#writer').val())=='' || $.trim($('#writer').val())==null){
		alert("작성자를 입력하시오")
		return false;
	} else if($.trim($('#newdetail').val())=='' || $.trim($('#newdetail').val())==null){
		alert("내용을 입력하시오")
		return false;
	} 
	
		
	document.location='/list';
	})
</script>
</html>