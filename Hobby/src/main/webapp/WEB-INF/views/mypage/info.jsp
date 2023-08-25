<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<style type="text/css">
.edit-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #637F42;
	color: white;
	border-radius: 5px;
	text-decoration: none;
}

.menu {
	display: flex;
	background-color: #f2f2f2;
	width: 100%;
	height: 50px;
}

.menu-item {
	flex: 1;
	padding: 10px;
	text-align: center;
	border: 1px solid;
	background-color: white;
	margin: 0;
}

.menu-item-info {
	background-color: #637F42;
	color: white;
}

a {
	text-decoration: none;
}

table {
	width: 600px;
	border-collapse: collapse;
	text-align: center;
}

table, th, td {
	border: 1px solid black;
	padding: 3px;
}

div {
	margin: auto;
	text-align: center;
}

.user-table {
	width: 600px;
	border-collapse: collapse;
	margin: auto;
	text-align: center;
}

.user-table td {
	padding: 8px;
	border: 1px solid #ccc;
}

.user-table .label {
	font-weight: bold;
	background-color: white;
}

.user-table .user-info {
	background-color: white;
}
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
</style>
<script type="text/javascript">
function sendData(f) {
	f.action="/myPageEdit.do";
	f.submit();
}
</script>
</head>
<body>

	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;">
		<h1 class="mypage-title">마이페이지</h1>

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
		 <h4>내 정보</h4>
		<form action="myPageEdit.do" method="post">
		
			<table class="user-table">
				<tr>
					<td class="label">이름</td>
					<td class="user-info">이소연</td>
				</tr>
				<tr>
					<td class="label">아이디</td>
					<td class="user-info">${u_id}</td>
				</tr>
				<tr>
					<td class="label">휴대전화</td>
					<td class="user-info">${u_phone}</td>
				</tr>
				<tr>
					<td class="label">이메일</td>
					<td class="user-info">${u_email}</td>
				</tr>
			</table>
			&nbsp;
			<div class="button-wrapper">
				<input type="submit" onclick="sendData(this.form)" value="수정">
			</div>
			</form>
		</div>
	</div>
</body>
</html>
