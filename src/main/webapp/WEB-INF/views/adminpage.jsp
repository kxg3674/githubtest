<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>상품관리</title>
</head>
<style>
body{
background-color: #F3F4F9;
    margin: 0;
    padding: 0;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.product_list_right{
	background-color:white;
	position:absolute;
	top:20%;
	right:5%;

}

.product_list_left{
	background-color:white;
	position:absolute;
	top:20%;
	left:10%;

}
.admin_product{
	background-color:white;
	position:absolute;
	left:50%;

	top:10%;
}
textarea{
resize: none;
 
}
</style>
<body>
<div class="admin_Page">
<div class="admin_product">
<h3>상품관리</h3>
</div>


<div class="product_infrom">
<div class="product_list_left">
<select id=product_List name=product_List size="18" 
				style="width: 450px;font-size: 16px;text-align: left;">
 
</select>

<br>
</div>
<br>
<div class="product_list_right">
<input type="hidden" id="product_Id" name="product_Id">
<select id="category" name="category" style="width: 100px;">
<!--  <option hidden value="select">select</option> 나중에 추가 할것 -->
</select>
<input type="button" id="category_Dig" name="category_Dig" value="카테고리 관리">
<br>
<br>

		
상품이름 <input type="text" id="product_Name" name="product_Name">
<br>

상품가격 <input type="number" id="product_Price" name="product_Price">
<br>

제조사 <input type="text" id="product_Maker" name="product_Maker">
<br>

설명 <input type="text" id="product_Ex" name="product_Ex">
<br>
제고량<input type="number" id="stock" name="stock">
<br>
<br>
<br>

대표사진
<input type="file" id="mainFile" name="mainFile"><input type="text" name="101" readonly>

<br>
상세사진
<br>
<input type="file" id="subFile1" name="subFile1"><input type="text" name="201" readonly> 
<br>
<input type="file" id="subFile2" name="subFile2"><input type="text" name="202" readonly>

<br>
<input type="file" id="subFile3" name="subFile3"><input type="text" name="203" readonly>

<br><br>
상세설명
<br>
<textarea id="product_Ex_Detail" name="product_Ex_Detail" rows="4" cols="45" maxlenth="500"></textarea>
<br>
<br>
<input type="button" id="product_Up" name="product_Up" value="등록">
<input type="button" id="product_Delete" name="product_Delete" value="삭제">
<input type="button" id="product_Cancel" name="product_Cancel" value="취소">
<input type="button" id="product_Reset" name="product_Reset" value="비우기">
</div>
</div>
</div>

<div id="typeDlg" style="display:none">
   <table border="1px solid black">
    
    <tr >
        <td>
			<select id="category_list" name="category_list" size="14" 
				style="width: 230px;font-size: 18px;text-align: left;">
			</select> 
    </td>
    <td style="border: 1px solid;">
 
       <table style="font-size: 20px; text-align: left;" >
        <tr>
        <td>카테고리 번호&nbsp;</td><td><input type="number" id="category_Id" name="category_Id"  size="12"></td>
        </tr>
        <tr>
            <td>카테고리 이름&nbsp;</td><td><input type="text" id="category_Name" name="category_Name"  size="12"></td>
        </tr>
        <tr>
            <td colspan="3"style="text-align:right;"><input type=button id="categoryAddBtn" value="추가">
            <input type=button id="categoryDeleteBtn" value="삭제">
            <input type=button id="categoryReset" value="비우기"></td>
        </tr>
    
        </table>
    
     </td>   
        </tr>
    </table>

</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$(document)
.ready(function(){
	console.log("abc")
	productList()
	categoryList()

})

.on('click','#product_Reset',function(){
	$('#product_Id').val('');
	$('#product_Name').val('')
	$('#product_Price').val('')
	$('#product_Maker').val('')
	$('#product_Ex').val('')
	$('#product_Ex_Detail').val('')
	$('#stock').val('')
	$('#mainFile').val('')
	$('#subFile1').val('')
	$('#subFile2').val('')
	$('#subFile3').val('')
	$('input[name=101]').val('')
	$('input[name=201]').val('')
	$('input[name=202]').val('')
	$('input[name=203]').val('')
})

.on('click','#category',function(){
	 $('#category').append(categoryList())
})


.on('click','#category_Dig',function(){
	
        $('#typeDlg').dialog({
            title: '객실타입관리',
            modal: true,
            width:650,
            beforeClose:function(){
               
                categoryList()
            // $('#roomTSelect').val('Select')
           let categoryAdd="";
           for(i=0;i<=$('#categoty_list option').length-1;i++ ){
        	   
        	   categoryVale = $('#categoty_list option:eq('+i+')').val()
               categoryAdd+='<option value='+categoryVale+'>'+$('#categoty_list option:eq('+i+')').text()+'</option>';    
//               console.log($('#categoty_list option:eq('+i+')').text()) 
         }
//            console.log($('#categoty_list option').length-1)    

            
            // $('#roomSelect').val()
            // $('#roomHNumber').val($('#roomNumber').val())
            $('#category').append(categoryAdd);

            // (1) selRoomType empty
            // (2) selType => selRoomType
        }
        })
        

    })
.on('click','#categoryAddBtn',function(){
   
    if($('#category_Id').val()==''){
    	alert('카테고리 번호를 넣어주세요')
        
    } else if( $('#category_Name').val()==''){
        alert('카테고리 이름을 적어주세요')
    } else if($('#category_Id').val()!='' && $('#category_Name').val()!=''){

		$.ajax({url:'/categoryinsert',type:'post',
        	
        	data:{category_Id:$("#category_Id").val(), category_Name:$("#category_Name").val()},
        	
        	dataType:"text",success:function(data){
        		console.log("test success")
        		if(data=="ok"){
        			console.log(data)
        			alert("추가")
        			categoryStr='<option value='+$("#category_Id").val()+'>' + $('#category_Name').val() + '</option>'
        			 $('#category_list').append(categoryStr)
        			$('#category_Id').val('')
       				$('#category_Name').val('')
        		}
        	}})

    }

})

// 카테고리 val , text 읽기

.on('click','#category_list option:selected',function(){
	 $('#category_Id').val($(this).val())
	 console.log($('#category_Id').val());
	 $('#category_Name').val($(this).text())
})

//카테고리 삭제 
.on('click','#categoryDeleteBtn',function(){
  console.log($('#category_Id').val());
	 $.ajax({url:"/categoryDelete",data:{category_Id:$('#category_Id').val()},
	 		dataType:"text",type:'post',
	 		success:function(data){
	 			console.log("category_Id"+data)
	 			if(data=="ok"){
	 				alert("삭제되었습니다")
	 				    $('#category_list option:selected').remove()
    					$('#category_Id').val('')
    					$('#category_Name').val('')
	 			} else{
	 				alert("현재 예약이 있는 객실입니다");
	 				return false;
	 			}
	 		}
	 })

})

// 카테고리 관리 번호 이름 지우기
.on('click','#categoryReset',function(){
	$('#category_Id').val('')
	$('#category_Name').val('')
})


.on('click','#product_Up',function(){
	
	if($('#product_Id').val()==''){
		$.ajax({url:"/product_Insert",data:{category:$('#category option:selected').val(),
		product_Name:$('#product_Name').val(),product_Price:$('#product_Price').val(),
		product_Maker:$('#product_Maker').val(),product_Ex:$('#product_Ex').val(),
		product_Ex_Detail:$('#product_Ex_Detail').val(),stock:$('#stock').val()},
		dataType:"text",type:"post",
		beforeSend:function(){
			 if(!confirm("정말 등록하시겠습니까?")){
				 alert("취소하였습니다")
				 return false;
			 } 
		},
		success:function(data){
			console.log(data)
			if(data=="ok"){
				
				productList()
		
				var formData = new FormData();
				var mainfiles = $('#mainFile')[0].files[0];
				formData.append('file', mainfiles);

				$.ajax({url:'/main_Img', type:'post', dataType:'text', data:formData,        
					   enctype:'multipart/form-data',
					   contentType:false,
					   processData:false,
					   success:function(data) {
					    	  
		      	   			var formData = new FormData();   // 자바스크립트에서 폼 데이터를 다루는 객체
					    	var subfiles1 = $('#subFile1')[0].files[0];
					    	formData.append('file', subfiles1);
					   
						   $.ajax({url:'/sub_Img1', type:'post', dataType:'text', data:formData,        
						      enctype:'multipart/form-data',
						      contentType:false,
						      processData:false,
						      success:function(data) {
					    	  
						      	  var formData = new FormData();   // 자바스크립트에서 폼 데이터를 다루는 객체
		   
								  var subfiles2 = $('#subFile2')[0].files[0];
								  formData.append('file', subfiles2);
							   
								   $.ajax({url:'/sub_Img2', type:'post', dataType:'text', data:formData,        
								      enctype:'multipart/form-data',
								      contentType:false,
								      processData:false,
								      success:function(data) {
							    	 							    	  	
							      	   	var formData = new FormData();   // 자바스크립트에서 폼 데이터를 다루는 객체
										var subfiles3 = $('#subFile3')[0].files[0];
										formData.append('file', subfiles3);
												   
										$.ajax({url:'/sub_Img3', type:'post', dataType:'text', data:formData,        
											enctype:'multipart/form-data',
											contentType:false,
											processData:false,
											success:function(data) {									    	  
												    	  
												$.ajax({url:"/getId",
													data:{get_id:$('#product_Name').val()},
													dataType:"text",
													type:"post",
													success:function(data){
														if(data!=null){
															$('#product_Id').val(data);
															console.log($('#product_Id').val())
																	
															$.ajax({url:"/imgGetUrl",data:{getId:$('#product_Id').val()},
																	type:"post",dataType:"text",
																	success:function(data){
																		alert("상품이 등록 되었습니다")
																		$("#product_Reset").trigger('click');
																	}
															})
														}
	   												}
												})
	     			 						}
	  									})
	      							}
	   							})	
							}
						})
						}
					})
				}
			
			}
		})

	} else if($('#product_Id')!=''){
		
		$.ajax({url:'/product_Update',data:{product_Id:$('#product_Id').val(),
			category:$('#category option:selected').val(),
			product_Name:$('#product_Name').val(),
			product_Price:$('#product_Price').val(),
			product_Maker:$('#product_Maker').val(),
			product_Ex:$('#product_Ex').val(),
			product_Ex_Detail:$('#product_Ex_Detail').val(),
			stock:$('#stock').val()},
			dataType:"text", type:"post",
			beforeSend:function(){
				 if(!confirm("정말 변경하시겠습니까?")){
					 alert("취소하였습니다")
					 return false;
				 } 
			},
			success:function(data){
				
				productList()
				var formData = new FormData();
				var mainfiles = $('#mainFile')[0].files[0];
				formData.append('file', mainfiles);
				formData.append('product_Id',$('#product_Id').val())
				
				$.ajax({url:'/update_main_img',
					data:formData,dataType:'text',
					type:'post',
					enctype:'multipart/form-data',
				    contentType:false,
				    processData:false,
					success:function(data){
						
						var formData = new FormData();
						var subfiles1 = $('#subFile1')[0].files[0];
					    formData.append('file', subfiles1);
						formData.append('product_Id',$('#product_Id').val())
						
						$.ajax({url:'/update_sub_img1',
							data:formData,dataType:'text',
							type:'post',
							enctype:'multipart/form-data',
						    contentType:false,
						    processData:false,
							success:function(data){
							
								var formData = new FormData();
								var subfiles2 = $('#subFile2')[0].files[0];
							    formData.append('file', subfiles2);
								formData.append('product_Id',$('#product_Id').val())
								
								$.ajax({url:'/update_sub_img2',
									data:formData,dataType:'text',
									type:'post',
									enctype:'multipart/form-data',
								    contentType:false,
							        processData:false,
									success:function(data){
								

										var formData = new FormData();
										var subfiles3 = $('#subFile3')[0].files[0];
									    formData.append('file', subfiles3);
										formData.append('product_Id',$('#product_Id').val())
										
										$.ajax({url:'/update_sub_img3',
											data:formData,dataType:'text',
											type:'post',
											enctype:'multipart/form-data',
										    contentType:false,
										    processData:false,
											success:function(data){
												alert("상품이 변경 되었습니다")
									
												$("#product_Reset").trigger('click');
											}
										})
								
									}
								})
								
							}
						})
						
					}
				})
			}
		})
	}
})




.on('click','#product_List option:selected',function(){
	
	var product_List=$(this).text()
	var product_Id=$(this).val()
	var product_Category=product_List.split(",")[0]
	var product_Name=product_List.split(",")[1]
	var product_Price=product_List.split(",")[2]
	var product_Maker=product_List.split(",")[3]
	var product_Ex=product_List.split(",")[4]
	var product_Ex_Detail=product_List.split(",")[5]
	var stock=product_List.split(",")[6]
	
	$('#product_Id').val(product_Id);
	 for(var i=0;i<$('#category option').length;i++){
		 console.log($('#category option').length);
		 if(product_Category==$('#category option:eq('+ i +')').text()){
			 $('#category option:eq('+ i +')').prop('selected',true);
			 // <option> dd </option>
			 break;
		 }
	 }
	$('#product_Name').val(product_Name);
	$('#product_Price').val(product_Price);
	$('#product_Maker').val(product_Maker);
	$('#product_Ex').val(product_Ex);
	$('#product_Ex_Detail').val(product_Ex_Detail);
	$('#stock').val(stock);
	console.log("a"+product_Id)
 	if(product_Id!=null){
	$.ajax({url:"/imgList",
 		data:{product_Id:$('#product_Id').val()},
 		dataType:"json",type:"post",
 		success:function(data){
 			console.log(data)
 			console.log(data.length)
 			for(var i=0;i<data.length;i++){
 				console.log("abc check")
 				console.log("useimg="+data[i]['useimg']);
				
 				console.log('test: ' + data[i]['imgurl']);
 				if (data[i]['imgurl'] == null) {
 					console.log("null입니다.")
 				} else {
	
						var urlsplit=(data[i]['imgurl']).split("/")[3];
						console.log(urlsplit);
						$('input[name='+data[i]['useimg']+']').val(urlsplit);
 				}
 			}
 			console.log($('#mainFile').val());
 	 			
 			}
 		})
 	}
	
})

.on('click','#product_Delete',function(){
	
	$.ajax({url:"imgDelete",
		data:{product_Id:$('#product_Id').val()},
		dataType:"text",type:"post",
		beforeSend:function(){
			
			 if(!confirm("정말 삭제하시겠습니까?")){
				 alert("취소하였습니다")
				 return false;
			 }
		
		
			
		},
		success:function(data){
			$.ajax({url:"productDelete",
				data:{product_Id:$('#product_Id').val()},
				dataType:"text",type:"post",
				success:function(data){
					
					alert("삭제되었습니다")
					$("#product_Reset").trigger('click');
					productList()
				}
			
		})
	}
})
})



$("#mainFile").change(function(){
	console.log("chekc3="+$('#mainFile').val())
	$('input[name=101]').prop('value',
			$('#mainFile').val().split("\\")[2])
	return false;

})
$("#subFile1").change(function(){
	$('input[name=201]').prop('value',
			$('#subFile1').val().split("\\")[2])
			return false;

	
})
$("#subFile2").change(function(){
	$('input[name=202]').prop('value',
			$('#subFile2').val().split("\\")[2])
			return false;

})
$("#subFile3").change(function(){
	$('input[name=203]').prop('value',
			$('#subFile3').val().split("\\")[2])
			return false;

})



//카테고리 리스트 불러오기

 function categoryList(){
    	$.ajax({url:"/categoryList",data:{},dataType:"json",type:"post",
    		success:function(data){
    			console.log(data);
    			$("#category_list option").remove();
    			$("#category option").remove();
    			for(let i=0; i<data.length;i++){
    				let str='';
    				str+='<option value='+data[i]['category_Id']+'>'+data[i]['category_Name']+'</option>';
    				$('#category_list').append(str);
    				$('#category').append(str)
    			}
    		}})
    }
  
// product 리스트 불러오기
function productList(){
 	$.ajax({url:"/productlist",data:{},dataType:"json",type:"post",
 		success:function(data){
 			console.log(data);
 			$("#product_List option").remove();
 			for(let i=0; i<data.length;i++){
 				let str='';
 				str+='<option value='+data[i]['product_Id']+'>'+data[i]['category_Name']+","
 					+data[i]['product_Name']+","
 					+data[i]['product_Price']+","
 					+data[i]['product_Maker']+","
 					+data[i]['product_Ex']+","
 					+data[i]['product_Ex_Detail']+","
 					+data[i]['stock']+'</option>';

 				$('#product_List').append(str);
 			}
 		}})
 } 
 


</script>
</html>