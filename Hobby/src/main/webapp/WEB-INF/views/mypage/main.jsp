<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
	 <link rel="stylesheet" type="text/css" href="styles.css">
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
.my-camping{
	width: 600px;
	margin: auto;
	border-collapse: collapse;
	text-align: center;
}
.my-capming th, .my-camping td{
	border: 1px solid black;
	padding: 3px;
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
	&nbsp;
	&nbsp;
	&nbsp;
	
   <table class="my-camping">
		<thead>
			<tr style="background-color: #637F42">
				<td class="label">캠핑장 이름</td>
				<td class="user-info">${cw_idx}</td>
			</tr>
			<tr style="background-color: #637F42">
				<td class="label">캠핑장 위치</td>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4"><h2>원하는 정보가 존재하지 않습니다.</h2></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list}" varStatus="vs">
						<tr>
							<td>${k.cw_idx}</td>
							<td>${k.u_idx}</td>
							<td>${k.c_name}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>
