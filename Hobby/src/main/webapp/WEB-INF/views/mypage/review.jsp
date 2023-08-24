<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 리뷰</title>

<style type="text/css">
th, td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
	vertical-align: center;
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
.menu-item-review{
	background-color: #637F42;
	color: white;
}
a {
	text-decoration: none;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}


tr:nth-child(even) {
	background-color: #f2f2f2;
}

th {
	background-color: #637F42;
	color: white;
}

div {
	margin: auto;
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;">

		<div>
			<h1 class="mypage-title">마이페이지</h1>
		</div>
		<div class="menu">
			<div class="menu-item">
				<h5>내가 찜한 캠핑장</h5>
			</div>
			<div class="menu-item menu-item-review">
				<h5>내가 작성한 리뷰</h5>
			</div>
			<div class="menu-item">
				<h5>1:1 문의</h5>
			</div>
			<div class="menu-item">
				<h5>회원정보</h5>
			</div>
		</div>
		<h2>내가 쓴 리뷰</h2>
		<table>
			<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
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
							<td>${k.cr_content}</td> <!-- 보류 -->
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
</body>
</html>
