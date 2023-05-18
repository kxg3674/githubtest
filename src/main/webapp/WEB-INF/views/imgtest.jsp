<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 테스트</title>
</head>
<body>

대표사진
<input type="file" id="mainFile" name="mainFile">
<br>
상세사진<br>
<input type="file" id="subFile1" name="subFile1" multiple><br>
<input type="file" id="subFile2" name="subFile2" multiple><br>
<input type="file" id="subFile3" name="subFile3" multiple><br>

<input type="button" id="imgUpBtn" value="업로드">


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)





// 확인요망
.on('click','#imgUpBtn',function(){
	var formData = new FormData();   // 자바스크립트에서 폼 데이터를 다루는 객체
	    var files1 = $('#subFile1')[0].files[0];
	    formData.append('file', files1);
	    console.log(files1)
	   $.ajax({
		   url:'/doUpload1', 
		   type:'post', 
		   dataType:'text', 
		   data:formData,        
	       enctype:'multipart/form-data',
	      contentType:false,
	        processData:false,
	      success:function(data) {
	    	  console.log("1")
	    	  console.log(data)
	    	  var formData = new FormData(); 
	    var  files2 = $('#subFile2')[0].files[0];
	    formData.append('file', files2);
	   
	   $.ajax({url:'/doUpload2', type:'post', dataType:'text', data:formData,        
	      enctype:'multipart/form-data',
	      contentType:false,
	        processData:false,
	      success:function(data) {
	      console.log("2")
	      console.log(data)
	         var formData = new FormData(); 
	  var files3 = $('#subFile3')[0].files[0];
	    formData.append('file', files3);
	   
	   $.ajax({url:'/doUpload3', type:'post', dataType:'text', data:formData,        
	      enctype:'multipart/form-data',
	      contentType:false,
	        processData:false,
	      success:function(data) {
	    	  console.log("3")
	    	  console.log(data)
	      }
	   })

	      }
	   })
	      }
	   })
	   
	
	   alert("이미지 파일이 업로드 되었습니다");
})
	 

</script>

</html>