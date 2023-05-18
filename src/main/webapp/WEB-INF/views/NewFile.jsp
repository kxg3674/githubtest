<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 물건 등록 폼 컨테이너 */
.form-container {
  width: 300px;
  margin: 0 auto;
}

/* 물건 등록 폼 제목 */
.form-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 16px;
}

/* 물건 등록 폼 항목 레이블 */
.form-label {
  font-size: 14px;
  font-weight: bold;
}

/* 물건 등록 폼 입력 필드 */
.form-input {
  width: 100%;
  padding: 8px;
  margin-bottom: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 14px;
}

/* 물건 등록 폼 버튼 컨테이너 */
.form-button-container {
  display: flex;
  justify-content: flex-end;
}

/* 물건 등록 폼 버튼 */
.form-button {
  padding: 8px 16px;
  background-color: #007bff;
  color: #fff;
  font-size: 14px;
  font-weight: bold;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

/* 물건 등록 폼 버튼 호버 효과 */
.form-button:hover {
  background-color: #0056b3;
}
</style>
<body>
  <div class="form-container">
    <h1 class="form-title">물건 등록 폼</h1>
    <label class="form-label" for="item-name">물건 이름</label>
    <input class="form-input" type="text" id="item-name" name="item-name" placeholder="물건 이름을 입력하세요">
    <label class="form-label" for="item-price">물건 가격</label>
    <input class="form-input" type="number" id="item-price" name="item-price" placeholder="물건 가격을 입력하세요">
    <div class="form-button-container">
      <button class="form-button">등록</button>
    </div>
  </div>
</body>
</html>