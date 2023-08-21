<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인 페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
    table {
        border-collapse: collapse; /* 테이블 경계선을 결합 */
        border: 1px solid black;
        width: 50%;
        margin: 0 auto; /* 가운데 정렬을 위한 margin 설정 */
    }
    
    th, td {
        text-align: center; /* 셀 내부 내용 가운데 정렬 */
        border: 1px solid black; /* 각 셀의 테두리 설정 */
        padding: 5px; /* 셀 내용과 테두리 사이의 간격 설정 */
    }
    
    .button-Q {
        padding: 10px;
    }
    
    .center-text {
        text-align: center;
    }
    
</style>
<script type="text/javascript">
    function go_cusser() {
        location.href = "/cusSer.do";	
    }

    function go_cusserFAQ() {
        location.href = "/cusSerFAQ.do";
    }

    function go_cusserAsk() {
        location.href = "/cusSerAsk.do";
    }

    function go_cusserReport() {
        location.href = "/cusSerReport.do";
    }

    function go_home() {
        location.href = "/home.do";
    }
</script>
</head>
<body>
<h1 style="text-align: center;">고객센터 메인 페이지</h1>
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

<h2 class="center-text">FAQ 목록</h2>
<table border="1">
    <thead>
        <tr>
            <th>번호</th>
            <th>질문</th>
            <th>답변</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="faq" items="${F_list}" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${faq.f_content}</td>
                <td>${faq.f_response}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<h2 class="center-text">1:1 문의 목록</h2>
<table border="1">
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>내용</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="Qna" items="${Q_list}" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${Qna.q_content}</td>
                <td>${Qna.q_response}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<h2 class="center-text">신고 목록</h2>
<table border="1">
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>내용</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="report" items="${R_list}" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${report.r_name}</td>
                <td>${report.r_content}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
