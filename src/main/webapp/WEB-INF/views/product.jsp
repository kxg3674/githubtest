<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	#product_name_price{
	   display: inline;
	   
	}
</style>
<body>


<div class="product">
<!-- 홈 리턴 이미지로 개선 -->
<div class="home_and_serch">
<a href="test"> 홈 리턴</a>
<input type="text" id="serch" name="serch" value="" placeholder="통합검색" autocomplete="off">
로그인으로관련 model로 대체(장바구니, 회원 관리, 정보관리 등) &nbsp;


</div>
<div>
</div>

<!-- 카테고리 -->
<div class="category">
카테고리
<ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li></ul>
</div>

<div class="selected_product">
상품 이미지&nbsp;
<div class="product_name_price">
<ul><li>상품명</li><li>가격</li><li>제조자</li><li>상품정보</li></ul>
</div>
<div class="order_btn">
<input type="button" id="order" name="order" value="주문하기">
<input type="button" id="order_list" name="order_list" value="장바구니">
</div>
<div class="product_imform">
상품정보
<div class="product_imform">
상품 이미지
</div>
<div class="review_list">
리뷰&nbsp;<input type="button" id="review_writer" name="review_writer" value="리뷰작성">
리뷰 이미지
</div>
</div>
</div>
</div>
</body>
</body>
</html>