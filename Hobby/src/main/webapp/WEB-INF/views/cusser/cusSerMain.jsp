<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인 페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
    body {
        padding-top: 50px;
        padding-bottom: 50px;
    }
    
    .navbar-custom {
        background-color: #0F4200;
    }
    
    .navbar-custom .navbar-brand,
    .navbar-custom .navbar-nav .nav-link {
        color: white;
    }
    
    .qna-title {
        font-weight: bold;
    }
    
    .qna-content {
        display: none;
        text-align: right; /* 추가: 텍스트를 오른쪽으로 정렬 */
    }
    
    .button-group {
        display: flex;
        justify-content: center; /* 가로 정렬을 중앙으로 설정 */
        margin-top: 20px; /* 버튼 그룹 위쪽 여백 */
    }
    
    .toggle-button {
        cursor: pointer;
        text-decoration: none; /* 밑줄 없애기 */
        background: none;
        border: none;
        margin: 0 10px;
    }
    
    .footer-bar {
	    background-color: #0F4200;
	    height: 50px;
	    position: fixed;
	    bottom: 0;
	    width: 100%;
	}
	
	.qna-box {
        padding: 1rem;
        transition: height 0.3s ease-in-out; /* 크기 변화에 애니메이션 적용 */
        overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
    }

    .qna-content-visible {
        height: auto; /* 답변 내용이 보일 때 크기를 자동으로 조절 */
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
    var allContentVisible = false; // 전체 내용이 보이는 상태를 나타내는 변수

    function toggleAllContent() {
        var contents = document.getElementsByClassName("qna-content");
        var toggleButton = document.getElementById("toggle-all");

        if (!allContentVisible) {
            for (var i = 0; i < contents.length; i++) {
                contents[i].style.display = "block";
            }
            toggleButton.innerText = "FAQ닫기";
            allContentVisible = true;
        } else {
            for (var i = 0; i < contents.length; i++) {
                contents[i].style.display = "none";
            }
            toggleButton.innerText = "FAQ";
            allContentVisible = false;
        }
    }

    var allQnaVisible = false; // 전체 QnA 내용이 보이는 상태를 나타내는 변수

    function toggleAllQna() {
        var qnaContents = document.getElementsByClassName("qna-content-qna");
        var toggleButton = document.getElementById("toggle-all-qna");

        if (!allQnaVisible) {
            for (var i = 0; i < qnaContents.length; i++) {
                qnaContents[i].style.display = "table-row";
            }
            toggleButton.innerText = "QnA닫기";
            allQnaVisible = true;
        } else {
            for (var i = 0; i < qnaContents.length; i++) {
                qnaContents[i].style.display = "none";
            }
            toggleButton.innerText = "QnA";
            allQnaVisible = false;
        }
    }
    
    var allReportVisible = false; // 전체 Report 내용이 보이는 상태를 나타내는 변수

    function toggleAllReport() {
        var ReportContents = document.getElementsByClassName("qna-content-Report");
        var toggleButton = document.getElementById("toggle-all-Report");

        if (!allReportVisible) {
            for (var i = 0; i < ReportContents.length; i++) {
                ReportContents[i].style.display = "table-row";
            }
            toggleButton.innerText = "신고 목록 닫기";
            allReportVisible = true;
        } else {
            for (var i = 0; i < ReportContents.length; i++) {
                ReportContents[i].style.display = "none";
            }
            toggleButton.innerText = "신고 목록";
            allReportVisible = false;
        }
    }
</script>
</head>
<body>
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

<div class="container mt-5 mb-5">
    <!-- FAQ 버튼 -->
    <div class="button-group">
        <button class="toggle-button" id="toggle-all" onclick="toggleAllContent()">FAQ</button>
        <button class="toggle-button" id="toggle-all-qna" onclick="toggleAllQna()">QnA</button>
        <button class="toggle-button" id="toggle-all-Report" onclick="toggleAllReport()">신고 목록</button>
    </div>
    <c:forEach var="k" items="${F_list}" varStatus="loop">
        <div class="card mt-3 qna-content" style="display: none;">
            <div class="card-header qna-title text-center">
                ${k.f_content}
            </div>
            <div class="card-body text-center">
                ${k.f_response}
            </div>
        </div>
    </c:forEach>
</div>

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
                <c:forEach var="k" items="${Q_list}" varStatus="loop">
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

<div class="container mt-5 mb-5">
    <!-- 신고목록 내용 -->
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                    <tr class="qna-content-Report" style="display: none;">
                        <td>${test[0]}</td>
                        <td>${test[1]}</td>
                        <td>${test[2]}</td>
                    </tr>
            </thead>
            <tbody>
                <c:forEach var="k" items="${R_list}" varStatus="loop">
                    <tr class="qna-content-Report" style="display: none;">
                        <td>${loop.count}</td>
                        <td>${k.r_name}</td>
                        <td>${k.r_content}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="footer-bar"></div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
