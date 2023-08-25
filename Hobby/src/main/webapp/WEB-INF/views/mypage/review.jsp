<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;">

		<div>
			<h1 class="mypage-title">마이페이지</h1>
		</div>
		<!-- 메뉴바 -->
		<div class="btn-group btn-custom " role="group" aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check btn-custom btn-comp" name="btnradio" id="btnradio1" autocomplete="off" checked>
			<label class="btn btn-outline btn-custom btn-comp" for="btnradio1">내가 찜한 캠핑장</label>
			<input type="radio" class="btn-check btn-custom btn-comp" name="btnradio" id="btnradio2" autocomplete="off">
			<label class="btn btn-outline btn-custom btn-comp" for="btnradio2">내가 작성한 리뷰</label>
			<input type="radio"class="btn-check btn-custom btn-comp" name="btnradio" id="btnradio3" autocomplete="off">
			<label class="btn btn-outline btn-custom btn-comp" for="btnradio3">1:1문의 내역</label>
			<input type="radio"class="btn-check btn-custom btn-comp" name="btnradio" id="btnradio4" autocomplete="off">
			<label class="btn btn-outline btn-custom btn-comp" for="btnradio4">내 정보</label>
		</div>
		<div style="height: 100px;"></div>
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
		</div>
</body>
</html>
