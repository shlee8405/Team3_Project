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
.btn-group {
    display: flex; /* 가로 정렬 */
    justify-content: space-between; /* 양 옆 여백 */
    max-width: 1100px; /* 최대 폭 설정 */
    margin: 0 auto; /* 가운데 정렬 */
    padding: 0 1px; /* 왼쪽과 오른쪽 여백 설정 */
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
.btn-comp {
    flex-grow: 1;
    transition: background-color 0.3s; /* 애니메이션 효과 추가 */
}

.btn-comp.active {
    background-color: #637F42; /* 클릭 시 배경색 고정 */
    color: white; /* 텍스트 색상을 밝게 조정 */
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
		<div class="btn-group btn-custom " role="group" aria-label="Basic radio toggle button group">
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myPagemain.do')">내가 찜한 캠핑장</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myreview.do')">내가 작성한 리뷰</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myqna.do')">1:1문의 내역</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/mypage.do')">내 정보</button>
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
