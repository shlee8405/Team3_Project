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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내가 찜한 캠핑장</title>
<style type="text/css">
.my-page-title {
    text-align: center;
    margin-top: 250px;
    padding-bottom: 80px;
}

/* 메뉴바 스타일 */
.sidebar {
    background: none; /* 검은색 네모 박스를 없애기 위해 배경을 없음으로 설정합니다. */
    border: none; /* 테두리 제거 */
    position: fixed;
    top: 130px; /* 헤더의 높이만큼 여백 추가 */
    bottom: 0;
    height: 50%;
    width: 250px; /* 사이드바의 넓이를 조정합니다. */
    overflow: hidden;
    -webkit-transition: width 0.05s linear;
    transition: width 0.05s linear;
    -webkit-transform: translateZ(0) scale(1, 1);
    z-index: 1000;
    left: 0;
    display: grid;
    grid-template-rows: repeat(3, 1fr); /* 세로로 세 칸으로 나눕니다. */
    gap: 1px; /* 각 칸 사이의 간격 설정 */
}


/* 메뉴 아이템 스타일 */
.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar li {
    text-align: center;
    padding: 10px 0; /* 각 아이템의 여백 조정 */
}

/* 각 메뉴 아이템의 스타일 */
.sidebar a {
    text-decoration: none;
    color: #637F42; /* 글자 색상 설정 */
    display: block;
    transition: color 0.2s ease; /* 글자 색상 변화에 트랜지션 추가 */
    font-size: 50px; 
}

/* 마우스 호버 시 글자 색상 변경 */
.sidebar a:hover {
    color: #4f6d3a; /* 호버 시 글자 색상 변경 */
}

/* 페이지 내용에 왼쪽 여백 추가 */
.content {
    margin-left: 60px; /* 왼쪽 여백 크기를 사이드바 폭과 일치하도록 설정 */
}
a {
	text-decoration: none;
}

table {
    margin: 0 auto; /* 가운데 정렬 */
    border-collapse: collapse;
    text-align: center;
}
th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    vertical-align: middle; /* 세로 가운데 정렬 */
}
th {
	background-color: #637F42;
	color: white;
}

.scrollable-content {
    max-height: 80vh; /* 최대 높이 설정 */
    overflow-y: hidden; /* 세로 스크롤바 활성화 */
}

.limited-text {
    max-width: 150px;  /* 적절한 값으로 조절하세요 */
    overflow: hidden; /* 칸 넘어가는거 안보이게*/
    text-overflow: ellipsis; /* 칸 넘어가는 내용은 ... 으로 표시*/
    white-space: nowrap; /* 줄 바꿈 삭제 */
}

</style>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;"></div>
	<br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
	
	<div class="container-fluid align-self-center" style="max-height: 73vh; background-color: #d4ead7; padding: 20px; border-radius: 10px; width: 50%">
	<div style="background-color: white; padding: 20px; border-radius: 10px;">
		<ul class="nav nav-tabs nav-justified border-0" style="font-size: 30px; margin: auto;">
		  <li class="nav-item">
		    <a class="nav-link " aria-current="page" style="color: black;" href = "/myPagemain.do">내가 찜한 캠핑장</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active border border-4 rounded border-success " aria-current="page" style="color: black;" href = "/myreview.do">내가 작성한 리뷰</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/mypage.do" style="color: black;">내 정보</a>
		  </li>
		</ul>
        <br>
        <br>
	<!-- 메뉴바 -->
	    <div class="scrollable-content" style="width: 80%; margin: auto; height: 53vh; overflow-y: auto;">
			<table style="border-collapse: collapse; width: 100%; border: 2px solid black;">
				<thead>
				<tr>
					<th style="border: 1px solid black; padding: 8px;">번호</th>
					<th style="border: 1px solid black; padding: 8px;">캠핑장</th>
					<th style="border: 1px solid black; padding: 8px;">내용</th>
					<th style="border: 1px solid black; padding: 8px;">별점</th>
					<th style="border: 1px solid black; padding: 8px;">작성날짜</th>
				</tr>
				</thead>
				<tbody>
					<c:choose>
		     			<c:when test="${empty list}">
		     				<tr><td colspan="4" style="border: 1px solid black; padding: 8px;"><h3>내가 찜한 캠핑장이 없습니다.</h3></td></tr>
		     			</c:when>
		     			<c:otherwise>
		     			  <c:forEach var="k" items="${list}" varStatus="vs">
		     			  	<tr>
		     			  		<td style="border: 1px solid black; padding: 8px;">${vs.count }</td>
		     			  		<td style="border: 1px solid black; padding: 8px;"><a href="/campDetail.do?keyword=${k.facltNm}">${k.facltNm}</a></td>
		     			  		<td class="limited-text" style="border: 1px solid black; padding: 8px;">${k.comment}</td>
		     			  		<td style="border: 1px solid black; padding: 8px;">${k.rating }</td>
		     			  		<td style="border: 1px solid black; padding: 8px; white-space: nowrap;">${k.created_date }</td>
		     			  	</tr>
		     			  </c:forEach> 
		     			</c:otherwise>
		     		</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	</div>
    <script type="text/javascript">
		function goToPage(url){
			location.href = url;
		}
	</script>
</body>
</html>
