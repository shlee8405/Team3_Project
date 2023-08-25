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
    <title>나의 1:1문의</title>

<style type="text/css">
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
.menu-item-qna{
	background-color: #637F42;
	color: white;
}
	a{text-decoration: none;}
	table{
		width:100%; border-collapse: collapse; text-align: center;
	}th, td{
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
	div{margin: auto; text-align: center;}
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
<jsp:include page="../header.jsp"  />
		<div style="position:relative; top:200px; z-index:1;">
		
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
		<div style="height: 50px;"></div>
		
    <form action="/qna/submit" method="post">
        <input type="text" name="qContent" placeholder="문의 내용"><br>
        <input type="text" name="qName" placeholder="이름"><br>
        <div style="height: 50px;"></div>
        <button type="submit">문의 등록</button>
    </form>
    <hr>
    <h2>문의 목록</h2>
    <table>
        <tr>
            <th>문의 내용</th>
            <th>답변 내용</th>
            <th>답변 상태</th>
        </tr>
        <tr th:each="qna : ${qnaList}">
            <td th:text="${qna.q_content}"></td>
            <td th:text="${qna.q_response}"></td>
            <td th:text="${qna.q_status}"></td>
        </tr>
    </table>

   
</body>
</html>
