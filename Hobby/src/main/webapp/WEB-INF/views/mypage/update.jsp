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
	background-color: #f2f2f2;
	width: 100%;
	height: 50px;
}

.menu-item {
	flex:1;
	padding: 10px;
	text-align: center;
	border: 1px solid; 
	background-color: white;
	margin: 0;
}
.menu-item-info{
	background-color: #637F42;
	color: white;
}
	a{text-decoration: none;}
	table{
		width:600px; border-collapse: collapse; text-align: center;
	}
	table, th, td{
		border: 1px solid black; padding: 3px;	
	}
	div{   margin: auto; text-align: center;}
</style>
</head>
<body>
<jsp:include page="../header.jsp"  />
		<div style="position:relative; top:200px; z-index:1;">
		
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
		<div class="menu-item menu-item-info">
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
