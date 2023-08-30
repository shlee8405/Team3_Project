<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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

.menu-item-info {
	background-color: #637F42;
	color: white;
}

a {
	text-decoration: none;
}

table{width: 600px;
    height: 300px;
    border-collapse: collapse;
    text-align: center;
    margin: 0 auto; /* 수평 가운데 정렬 */
    margin-top: 100px;}

th, td{
		padding: 8px;
		text-align: center;
		border-bottom: 1px solid #ddd;
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
<script type="text/javascript">
function sendData(f) {
	f.action="/myPageEdit.do";
	f.submit();
}
</script>
</head>
<body>

	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;">
		<h1 class="mypage-title">마이페이지</h1>

			<!-- 메뉴바 -->
		<div class="btn-group btn-custom " role="group" aria-label="Basic radio toggle button group">
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myPagemain.do')">내가 찜한 캠핑장</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myreview.do')">내가 작성한 리뷰</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myqna.do')">1:1문의 내역</button>
                <button type="button" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/mypage.do')">내 정보</button>
            </div>
		
		<!-- 공백 -->
		<div style="height: 50px;"></div>
		
		<div class="user-info">
		 <h4>내 정보</h4>
		
		<form action="myPageEdit.do" method="post">
		<table>
				<c:choose>
	     			<c:when test="${empty list}">
	     				<tr><td colspan="4"><h3>나의 문의 내역이 없습니다.</h3> </td></tr>
	     			</c:when>
	     			<c:otherwise>
	     			  <c:forEach var="k" items="${list}" varStatus="vs">
	     			  	  <tr>
                    <th>이름</th>
                    <td>${k.u_name }</td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>${k.u_id }</td>
                </tr>
                <tr>
                    <th>휴대전화</th>
                    <td>${k.u_phone }</td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${k.u_email }</td>
                </tr>
	     			  </c:forEach> 
	     			</c:otherwise>
	     		</c:choose>
			</tbody>
		</table>
			&nbsp;
			<div class="button-wrapper">
				<input type="submit" onclick="sendData(this.form)" value="수정">
			</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function goToPage(url){
			location.href = url;
		}
		 
	</script>
	
</body>
</html>
