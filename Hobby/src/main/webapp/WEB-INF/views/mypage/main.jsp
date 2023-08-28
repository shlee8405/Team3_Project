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
	crossorigin="anonymous" ></script>
<script type="text/javascript">

function check(){
	var form = document.btnradio;
	if(form.btnradio[0].checked == true){
		form.action="/myPagemain.do";
	}
	else if(form.btnradio[1].checked == true){
		form.action = "/myreview.do";
	}
	else if(form.btnradio[2].checked == true){
		form.action = "/myqna.do";
	}
	else{
		form.action = "/mypage.do";
	}
	form.submit();
}
</script>
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
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;">

		<div>
			<h1 class="mypage-title">마이페이지</h1>
		</div>
		<!-- 메뉴바 -->
		<form name="form1" method="post" >
		 <div class="btn-group btn-custom " role="group" aria-label="Basic radio toggle button group">
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myPagemain.do')">내가 찜한 캠핑장</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myreview.do')">내가 작성한 리뷰</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myqna.do')">1:1문의 내역</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/mypage.do')">내 정보</button>
            </div>
		</form>
		
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
	<script type="text/javascript">
		function goToPage(url){
			location.href = url;
		}
	</script>
</body>
</html>
