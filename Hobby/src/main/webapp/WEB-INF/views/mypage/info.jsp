<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	justify-content: space-around;
	background-color: #f2f2f2;
}

.menu-item {
	padding: 5px;
	border: 1px solid; border-radius : 5px;
	background-color: white;
	border-radius: 5px;
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
	width: 600px;
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
		<div class="user-info">
  		<p class="section-title">내정보</p>

			<table class="user-table">
				<tr>
					<td class="label">이름</td>
					<td class="user-info">${u_name}</td>
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
				<a href="#" class="edit-button">수정</a>
			</div>
		</div>
</body>
</html>
