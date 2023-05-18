<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>마이페이지 - 내 정보 수정</title>
    <style>
        /* 폼 요소 스타일링 */
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            outline: none;
        }

        /* 선택된 폼 요소 스타일링 */
        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus,
        input[type="number"]:focus,
        select:focus,
        textarea:focus {
            border-color: #007bff;
        }

        /* 버튼 스타일링 */
        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        /* 버튼 호버 효과 */
        .button:hover {
            background-color: #0056b3;
        }

        /* 에러 메시지 스타일링 */
        .error-message {
            color: #dc3545;
            margin-top: 5px;
        }

        /* 프로필 이미지 스타일링 */
        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
        }

        /* 탭 메뉴 스타일링 */
        .tab-menu {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .tab-menu a {
            padding: 10px 20px;
            color: #007bff;
            text-decoration: none;
            border-bottom: 2px solid transparent;
            transition: border-bottom-color 0.3s;
        }

        .tab-menu a:hover {
            border-bottom-color: #007bff;
        }
    </style>
</head>

<body>
    <h1>마이페이지 - 내 정보 수정</h1>
    <div class="tab-menu">
        <a href="#tab1">개인 정보</a>
        <a href="#tab2">프로필 사진</a>
    </div>
    <form id="tab1">
        <h2>개인 정보</h2>
        <input type="text" placeholder="이름">
        <input type="email" placeholder="이메일">
        <input type="password" placeholder="비밀번호">
        <!-- 기타 개인 정보 입력 항목 추가 -->
        <button type="submit" class="button">저장</button>
    </form>
    <form id="tab2">
        <h2>프로필 사진</h2>
        <img src="profile.jpg" alt="프로필 사진" class="profile-image">
        <input type="file" accept="image/*">
        <button type="submit" class="button">업로드</button>
    </form>
</body>

</html>