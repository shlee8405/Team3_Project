<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나의 리뷰</title>

<style type="text/css">
 #green-header {
        background-color: green;
        height: 30px; /* 높이 조절 (원하는 크기로 수정해주세요) */
    }
     #green-footer {
        background-color: green;
        height: 30px; /* 높이 조절 (원하는 크기로 수정해주세요) */
    }
     
	a{text-decoration: none;}
	table{
		width:600px; border-collapse: collapse; text-align: center;
	}
	table, th, td{
		border: 1px solid black; padding: 3px;	
	}
	div{width:600px; margin: auto; text-align: center;}
</style>
</head>
<body>
    <div>
    	<!-- <div class="header"> -->
        <div class="green-background"></div>
        <div id="green-header"></div>
        <h1 class="mypage-title">마이페이지</h1>
    </div>
    	
    	<hr>
    	<h2>내가 찜한 캠핑장 | 내가 작성한 리뷰 | 1:1 문의 | 회원정보 </h2>

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

    <div id="green-footer"></div>
        <div class="green-background"></div>
    </div>
</body>
</html>
