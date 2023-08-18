<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
    table {
        border-collapse: collapse;
        width: 50%;
        margin: 0 auto;
    }

    th, td {
        border: 2px solid black;
        padding: 5px;
        text-align: center;
    }

    .text-center {
        text-align: center;
    }
</style>

<script type="text/javascript">
function go_cusser() {
	location.href="/cusSer.do"	
}

function go_cusserFAQ() {
	location.href="/cusSerFAQ.do"
}

function go_cusserAsk() {
	location.href="/cusSerAsk.do"
}

function go_cusserReport() {
	location.href="/cusSerReport.do"
}

function go_home() {
	location.href="/home.do"
}

function go_delete(f) {
    // Add your delete logic here
}
</script>
</head>
<body>

<h1 class="text-center">1:1 문의 상세내역</h1>

<div class="text-center">
    <table>
        <thead>
            <tr>
                <th>
                    고객센터 메인
                </th>
                <th> 
                    자주묻는질문
                </th>
                <th> 
                    1:1 문의
                </th>
                <th> 
                    신고하기
                </th>
                <th>
                    홈
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <button onclick="go_cusser()">고객센터 메인</button>
                </td>
                <td>
                    <button onclick="go_cusserFAQ()">자주묻는질문</button>
                </td>
                <td>
                    <button onclick="go_cusserAsk()">1:1 문의</button>
                </td>
                <td>
                    <button onclick="go_cusserReport()">신고하기</button>
                </td>
                <td>
                    <button onclick="go_home()">홈으로</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<form method="post">
    <table>
            <tr>
                <th>작성자</th>
                <td>${rvo.r_name}</td>
            </tr>
            <tr>
           		<th>신고내용</th>
                <td>${rvo.r_content}</td>
            </tr>
            <tr>
           		<th>답변</th>
                <td>${rvo.r_response}</td>
            </tr>
    </table>
</form>

</body>
</html>
