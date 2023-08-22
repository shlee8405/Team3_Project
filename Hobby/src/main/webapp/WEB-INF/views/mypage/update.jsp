<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

<style type="text/css">
	.menu {
	display: flex;
	justify-content: space-around;
	background-color: #f2f2f2;
}

.menu-item {
	padding: 5px;
	border: 1px solid; border-radius : 5px;
	background-color: white;
	border-radius: 5px;
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
		<h1 class="mypage-title">마이페이지</h1>
	</div>
	<div class="menu">
		<div class="menu-item">
			<h5>내가 찜한 캠핑장</h5>
		</div>
		<div class="menu-item">
			<h5>내가 작성한 리뷰</h5>
		</div>
		<div class="menu-item">
			<h5>1:1 문의</h5>
		</div>
		<div class="menu-item">
			<h5>회원정보</h5>
		</div>
	</div>
    <div>
        <h2>회원정보 수정</h2>
        <hr>
            <div>
                <label for="name">이름</label>
                <input type="text" id="name" name="name">
            </div>
            <div>
                <label for="id">아이디</label>
                <input type="text" id="id" name="id">
            </div>
            <div>
                <label for="email">이메일</label>
                <input type="email" id="email" name="email">
            </div>
            <div>
                <label for="phone">휴대전화</label>
                <input type="tel" id="phone" name="phone">
            </div>
            
            <button type="submit">완료</button>
        </form>
    
</body>
</html>
