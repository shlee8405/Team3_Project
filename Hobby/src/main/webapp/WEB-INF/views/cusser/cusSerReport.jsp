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

    th {
        border: 1px solid black;
        white-space: nowrap; /* Add this line */
        padding: 5px;
    }

    table, td {
        border: 1px solid black;
        padding: 5px;
    }

    .faq-buttons {
        text-align: center;
    }

    .table-margin {
        margin-top: 10px;
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

function go_report() {
	location.href="/report.do"
}
</script>
</head>
<body>

<h1 class="text-center">신고 내역</h1>

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

<div class="table-margin"></div> <!-- 10px 간격용 div -->

<div class="text-center">
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>내용</th>
            </tr>
        </thead>
        <c:forEach var="k" items="${list}" varStatus="loop">
            <tr>
                <c:choose>
                    <c:when test="${k.r_status == 0}">
                        <td colspan="4">삭제된 문의입니다</td>
                    </c:when>
                    <c:otherwise>
                        <td>${loop.count}</td>
                        <td style="white-space: nowrap;">${k.r_name}</td>
                        <td>${k.r_content}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty k.r_response}">
                                    <a href="/go_ReportDetail.do?q_idx=${k.r_idx}">답변보기</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/go_ReportDelete.do?q_idx=${k.r_idx}">수정하기</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>

    </table>
</div>

<div class="text-center">
    <button class="btn" onclick="go_report()">신고하기</button>
</div>

</body>
</html>
