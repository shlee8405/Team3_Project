<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style type="text/css">
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

.menu-item-wish {
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

.my-camping {
	width: 600px;
	margin: auto;
	border-collapse: collapse;
	text-align: center;
}

.my-capming th, .my-camping td {
	border: 1px solid black;
	padding: 3px;
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
.btn-comp.active {
    background-color: #637F42; 
    color: white; 
  }



</style>

<script type="text/javascript">
	  function myreview_go()() {
		location.href="/myreview.do"
	}
</script>
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
		
	<!-- 공백 -->
	<div style="height: 100px;"></div>
	
	<table class="my-camping">
		<thead>
			<tr>
				<td class="label">캠핑장 이름</td>
				<td class="label">캠핑장 위치</td>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4"><h2>찜한 캠핑장이 없습니다.</h2></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list}" varStatus="vs">
						<tr>
							<td>${k.camp_id}</td>
							<td>${k.facltNm}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	</div>
</body>
</html>
