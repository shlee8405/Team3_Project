<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 update</title>

<style type="text/css">
 #green-header {
        background-color: green;
        height: 30px; /* 높이 조절 (원하는 크기로 수정해주세요) */
    }
     #green-footer {
        background-color: green;
        height: 30px; /* 높이 조절 (원하는 크기로 수정해주세요) */
    }
     
	a{text-decoration: none;}
	table{
		width:600px; border-collapse: collapse; text-align: center;
	}
	table, th, td{
		border: 1px solid black; padding: 3px;	
	}
	div{width:600px; margin: auto; text-align: center;}
</style>
</head>
<body>
    <div>
    	<div class="header">
        <div class="green-background"></div>
        <div id="green-header"></div>
        <h1 class="mypage-title">마이페이지</h1>
    </div>
    	
    	<hr>
    	<h2>내가 찜한 캠핑장 | 내가 작성한 리뷰 | 1:1 문의 | 회원정보 </h2>

    <div>
        <h2>프로필 수정</h2>
        
        <!-- Form for updating user profile -->
        <!-- <form action="/updateProfile" method="post"> -->
            <div>
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname">
            </div>
            <div>
                <label for="name">이름</label>
                <input type="text" id="name" name="name">
            </div>
            <div>
                <label for="email">이메일</label>
                <input type="email" id="email" name="email">
            </div>
            <div>
                <label for="phone">휴대전화</label>
                <input type="tel" id="phone" name="phone">
            </div>
            <div>
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password">
            </div>
            <div>
                <label for="newPassword">새 비밀번호</label>
                <input type="password" id="newPassword" name="newPassword">
            </div>
            <div>
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword">
            </div>
            <button type="submit">완료</button>
        </form>
    </div>
    <div id="green-footer"></div>
        <div class="green-background"></div>
    </div>
</body>
</html>
