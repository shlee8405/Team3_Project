<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

<style type="text/css">
 #green-header {
        background-color: green;
        height: 30px; /* 높이 조절 (원하는 크기로 수정해주세요) */
    }
     #green-footer {
        background-color: green;
        height: 30px; /* 높이 조절 (원하는 크기로 수정해주세요) */
    }
     .edit-button {
        display: inline-block;
        padding: 10px 20px;
        background-color: green; /* 초록색 배경색 적용 */
        color: white; /* 흰색 텍스트 적용 */
        border-radius: 5px;
        text-decoration: none;
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

    <div class="content">
        <div class="user-info">
        <p class="section-title">내정보</p>
            <p class="label">이름</p>
            <p class="user-info">${u_name}</p>
            
            <p class="label">아이디</p>
            <p class="user-info">${u_id}</p>
            
            <p class="label">휴대전화</p>
            <p class="user-info">${u_phone}</p>
            
            <p class="label">이메일</p>
            <p class="user-info">${u_email}</p>
        </div>
        
        <hr class="line">
        
         <div class="button-wrapper">
        <a href="#" class="edit-button">수정</a>
    </div>
    
    <div id="green-footer"></div>
        <div class="green-background"></div>
    </div>
</body>
</html>
