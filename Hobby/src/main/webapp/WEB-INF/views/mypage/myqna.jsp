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
    <title>1:1 문의 내역</title>
<style type="text/css">
.my-page-title{
	text-align: center; /* 가운데 정렬 */
    margin-top: 250px; /* 상단 여백 조절 */
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

div {
	margin: auto;
	text-align: center;
}
.scrollable-content {
    max-height: 80vh; /* 최대 높이 설정 */
    overflow-y: auto; /* 세로 스크롤바 활성화 */
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;"></div>
	<div class="my-page-title">
		<h1>마이페이지</h1>
	</div>
   <!-- 메뉴바 -->
<div class="sidebar">
    <ul>
        <li>
            <button id="button1" type="button" onmouseover="applyHover('button1');" onmouseout="removeHover('button1');" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myPagemain.do')">
                <i class="fa fa-home fa-2x"></i>
                <span class="nav-text">
                   내가 찜한 캠핑장
                </span>
          </button>
        </li>
        <li>
            <button id="button2" type="button" onmouseover="applyHover('button2');" onmouseout="removeHover('button2');" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myreview.do')">
                <i class="fa fa-globe fa-2x"></i>
                <span class="nav-text">
                    내가 작성한 리뷰
                </span>
            </button>
        </li>
        <li>
            <button id="button4" type="button" onmouseover="applyHover('button4');" onmouseout="removeHover('button4');"  class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/mypage.do')">
               <i class="fa fa-comments fa-2x"></i>
                <span class="nav-text">
                    내 정보
                </span>
            </button>
        </li>
    </ul>
</div>
        <div style="margin-top: 20px;"></div>
		<div style="text-align: center;">
   		<form action="/qna/submit" method="post" style="display: inline-block;"> 
        <input type="text" name="qContent" placeholder="문의 제목"><br>
        <input type="text" name="qName" placeholder="문의 내용"><br>
        <div style="height: 50px;"></div>
        <button type="submit">문의 등록</button>
    </form>
    </div>
    <div style="margin-top: 20px;"></div>
    <table>
			<thead>
			<tr>
				<th>번호</th>
				<th>문의 내용</th>
				<th>답변 내용</th>
				<th>상태</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
	     			<c:when test="${empty list}">
	     				<tr><td colspan="4"><h3>나의 문의 내역이 없습니다.</h3> </td></tr>
	     			</c:when>
	     			<c:otherwise>
	     			  <c:forEach var="k" items="${list}" varStatus="vs">
	     			  	<tr>
	     			  		<td>${vs.count }</td>
	     			  		<td>${k.q_content }</td>
	     			  		<td>${k.q_response }</td>
	     			  		<td>${k.q_status }</td>
	     			  	</tr>
	     			  </c:forEach> 
	     			</c:otherwise>
	     		</c:choose>
			</tbody>
		</table>
   <script type="text/javascript">
		function goToPage(url){
			location.href = url;
		}
	</script>
</body>
</html>
