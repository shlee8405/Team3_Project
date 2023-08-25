<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

<style type="text/css">
.btn-custom{
	background-color: white;
	color: black;
    border-color: #637F42;
}

.btn-custom:hover{ 
background-color: #637F42;
color: white;
}
.btn-custom:active{ 
background-color: #637F42;
color: black;
color: white;
}

.btn-active{
background-color: #637F42;
color: black;
color: white;
}
.btn-group {
    display: flex; /* 요소들을 가로로 정렬 */
}
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
	<!-- 메뉴바 -->
		<div class="btn-group btn-custom" role="group" aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check btn-custom" name="btnradio" id="btnradio1" autocomplete="off" checked>
			<label class="btn btn-outline btn-custom" for="btnradio1">내가 찜한 캠핑장</label>
			<input type="radio" class="btn-check btn-custom" name="btnradio" id="btnradio2" autocomplete="off">
			<label class="btn btn-outline btn-custom" for="btnradio2">내가 작성한 리뷰</label>
			<input type="radio"class="btn-check btn-custom" name="btnradio" id="btnradio3" autocomplete="off">
			<label class="btn btn-outline btn-custom" for="btnradio3">1:1문의 내역</label>
			<input type="radio"class="btn-check btn-custom" name="btnradio" id="btnradio4" autocomplete="off">
			<label class="btn btn-outline btn-custom" for="btnradio4">내 정보</label>
		</div>
		<!-- 공백 -->
		<div style="height: 50px;"></div>
		<div class="user-info">
        <h4>회원정보 수정</h4>
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
            </div>
    </div>
</body>
</html>
