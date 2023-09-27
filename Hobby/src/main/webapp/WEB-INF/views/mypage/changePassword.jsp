<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보 수정</title>
 <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico">
<style type="text/css">
.my-page-title{
	text-align: center; /* 가운데 정렬 */
    margin-top: 250px; /* 상단 여백 조절 */
    padding-bottom: 80px;
}/* 메뉴바 스타일 */
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
    width: 800px; /* 내용에 맞게 자동 조절 */
    max-width: 100%; /* 최대 폭 설정 */
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
    overflow-y: auto; /* 세로 스크롤바 활성화 */
}
</style>
<script type="text/javascript">
function save_go(f) {
	f.action="/change.do";
	f.submit();
}

function goBack() {
    window.history.back();
}

function goToPage(url){
	location.href = url;
}

window.onload = function() {
    var errorMsg = "${errorMsg}";
    if (errorMsg) {
        alert(errorMsg);
    }
}


</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;"></div>
	<!-- 메뉴바 -->
		<br>
        <br>
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
		    <a class="nav-link " aria-current="page" style="color: black;" href = "/myreview.do">내가 작성한 리뷰</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active border border-4 rounded border-success" href="/mypage.do" style="color: black;">내 정보</a>
		  </li>
		</ul>
        <br>
        <br>
    <div class="scrollable-content" style="width: 75%; margin: auto;">
    <div style="margin-top: 40px;"></div>
    <form method="post">
    <table style="border-collapse: collapse; width: 100%; border: 2px solid black;">
    <thead>
    	<tr>
            <th>항목</th>
            <th style="border: 1px solid black; padding: 8px;">내용</th>
        </tr>
    </thead>
		<tr align="center">
			<td style="border: 1px solid black; padding: 8px;">현재 비밀번호</td>
			<td style="border: 1px solid black; padding: 8px;"><input type="password" id="currentPassword" name="currentPassword" required></td>
		</tr>
		<tr align="center">
			<td style="border: 1px solid black; padding: 8px;">새로운 비밀번호</td>
			<td style="border: 1px solid black; padding: 8px;"><input type="password"  id="newPassword" name="newPassword" required></td>
		</tr>
		<tr align="center">
			<td style="border: 1px solid black; padding: 8px;">새로운 비밀번호 확인</td>
			<td style="border: 1px solid black; padding: 8px;"><input type="password" id="confirmPassword" name="confirmPassword" required></td>
		</tr>
		<tfoot>
			<tr align="center">
				<td colspan="2" style="border: 1px solid black; padding: 8px;">
					<input type="button" value="변경하기" onclick="save_go(this.form)" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="취소" onclick="goBack()"/>
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
	</div>
	</div>
	</div>
    
</body>
</html>
