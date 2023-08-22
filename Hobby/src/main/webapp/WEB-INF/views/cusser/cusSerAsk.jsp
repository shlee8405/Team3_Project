<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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

function go_inquiry() {
	location.href="/go_inquiry.do"
}
function go_AskDetail() {
	location.href="/go_AskDetail.do?q_idx=" + q_idx;
}
</script>
</head>
<body>
<jsp:include page="../header.jsp"  />
<h1 class="text-center">1:1 문의</h1>

<div class="table-margin"></div> <!-- 10px 간격용 div -->

<div style="position:relative; top:200px; z-index:1;">
    <!-- QnA 내용 -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                    <tr class="qna-content-qna" style="display: none;">
                        <td>${test[0]}</td>
                        <td>${test[1]}</td>
                        <td>${test[2]}</td>
                    </tr>
            </thead>
            <tbody>
                <c:forEach var="k" items="${alllist}" varStatus="loop">
                    <tr class="qna-content-qna" style="display: none;">
                        <td>${loop.count}</td>
                        <td>${k.q_content}</td>
                        <td>${k.q_response}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<div class="text-center">
    <button class="btn" onclick="go_inquiry()">문의하기</button>
</div>
<div class="footer-bar"></div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
