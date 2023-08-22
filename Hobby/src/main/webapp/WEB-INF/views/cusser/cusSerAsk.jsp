<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
    .navbar-custom {
        background-color: #0F4200;
    }
    
    .navbar-custom .navbar-brand,
    .navbar-custom .navbar-nav .nav-link {
        color: white;
    }
    
    .footer-bar {
	    background-color: #0F4200;
	    height: 50px;
	    position: fixed;
	    bottom: 0;
	    width: 100%;
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

function go_inquiry() {
	location.href="/go_inquiry.do"
}
function go_AskDetail() {
	location.href="/go_AskDetail.do?q_idx=" + q_idx;
}
</script>
</head>
<body>

<h1 class="text-center">1:1 문의</h1>

<nav class="navbar navbar-expand-lg navbar-light navbar-custom fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">고객센터</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/cusSer.do" onclick="go_cusser()">고객센터 메인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/cusSerFAQ.do" onclick="go_cusserFAQ()">자주묻는질문</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/cusSerAsk.do" onclick="go_cusserAsk()">1:1 문의</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/go_AskDelete.do" onclick="go_cusserReport()">신고하기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/home.do" onclick="go_home()">홈으로</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="table-margin"></div> <!-- 10px 간격용 div -->

<div class="container mt-5 mb-5">
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
