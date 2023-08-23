<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
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
</style>
</head>
<body>
<jsp:include page="../header.jsp"  />
		<div style="position:relative; top:200px; z-index:1;">
		
    <div>
		<h1 class="mypage-title">마이페이지</h1>
	</div>
    <div class="menu">
		<div class="menu-item">
			<h5>내가 찜한 캠핑장</h5>
		</div>
		<div class="menu-item">
			<h5>내가 작성한 리뷰</h5>
		</div>
		<div class="menu-item menu-item-qna">
			<h5>1:1 문의</h5>
		</div>
		<div class="menu-item">
			<h5>회원정보</h5>
		</div>
	</div>
    <form action="/qna/submit" method="post">
        <input type="text" name="qContent" placeholder="문의 내용"><br>
        <input type="text" name="qName" placeholder="이름"><br>
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
