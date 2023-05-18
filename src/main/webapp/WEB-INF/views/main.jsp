<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>humanPetShop</title>
</head>
<style>
      li {
        display: inline;
        border: 1px solid #bcbcbc;
        padding: 10px;
      }
      #home_and_serch{
      display: inline;
        border: 1px solid #bcbcbc;
        padding: 10px;
      }
      
      #product_list{
        width : 600px;
  		height: 100px;
 		border: 1px solid black;
      }
      div{
 		 width : 600px;
		 height: 100px;
		 border: 1px solid black;
	}
</style>
<body>


<div class="main_page">
<!-- 홈 리턴 이미지로 개선 -->
<div class="home_and_serch">
<a href="test"> 홈 리턴</a>
  <div class="input-group mb-3">
    <input type="text" class="form-control" placeholder="Search">
    <button class="btn btn-success" type="submit">Go</button> 
  </div>
로그인으로관련 model로 대체(장바구니, 회원 관리, 정보관리 등) &nbsp;


</div>
<div>
${logId}&nbsp;${logOut}&nbsp;${mypage}
</div>

<!-- 카테고리 -->
<div class="category">
카테고리
<ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li></ul>
</div>
<!--  상품 리스트 출력 -->
<div class="product_list">
<div class="product_first">
상품 이미지 첫줄 
<ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li></ul>
</div>
<div class="product_second">
상품 이미지 두번재줄 
<ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li></ul>
</div>
<div class="product_third">
상품 이미지 세번재줄 
<ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li></ul>
</div>
</div>
</div>
</body>
</html>