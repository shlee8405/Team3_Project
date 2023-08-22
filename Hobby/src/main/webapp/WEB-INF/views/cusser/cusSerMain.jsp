<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
    .qna-title {
        font-weight: bold;
        font-size: 20px;
    }
    
    .qna-content {
        display: none;
        text-align: right; /* 추가: 텍스트를 오른쪽으로 정렬 */
        font-size: 20px;
    }
    
    .button-group {
        display: flex;
        justify-content: center; /* 가로 정렬을 중앙으로 설정 */
        margin-top: 20px; /* 버튼 그룹 위쪽 여백 */
        font-size: 20px;
    }
    
    .toggle-button {
        cursor: pointer;
        text-decoration: none; /* 밑줄 없애기 */
        background: none;
        border: none;
        margin: 0 10px;
        font-size: 20px;
    }
    
	.qna-box {
        padding: 1rem;
        transition: height 0.3s ease-in-out; /* 크기 변화에 애니메이션 적용 */
        overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
        font-size: 20px;
    }

    .qna-content-visible {
        height: auto; /* 답변 내용이 보일 때 크기를 자동으로 조절 */
        font-size: 20px;
    }
    
    .qna-content-Report{
   		font-size: 20px;
    }
    
    .qna-content-qna{
    	font-size: 20px;
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
    
    var faqButtonAdded = false; // Initialize the flag

    function toggleAllContent() {
        var contents = document.getElementsByClassName("qna-content");
        var qnaContents = document.getElementsByClassName("qna-content-qna");
        var reportContents = document.getElementsByClassName("qna-content-Report");

        var toggleButton = document.getElementById("toggle-all");
        var toggleButtonQna = document.getElementById("toggle-all-qna");
        var toggleButtonReport = document.getElementById("toggle-all-Report");

        // Hide all other content
        for (var i = 0; i < contents.length; i++) {
            contents[i].style.display = "none";
        }
        for (var i = 0; i < qnaContents.length; i++) {
            qnaContents[i].style.display = "none";
        }
        for (var i = 0; i < reportContents.length; i++) {
            reportContents[i].style.display = "none";
        }

        // Toggle FAQ content
        for (var i = 0; i < contents.length; i++) {
            contents[i].style.display = "block";
        }
        toggleButton.innerText = "FAQ";

        // Show the "다른 FAQ 보기" button outside the FAQ content
        var faqButton = document.getElementById("faq-view-button");
        faqButton.style.display = "block";
        faqButton.onclick = go_cusserFAQ; // Attach the function

        allContentVisible = true;
        allQnaVisible = false;
        allReportVisible = false;
    }

    function toggleAllQna() {
        var contents = document.getElementsByClassName("qna-content");
        var qnaContents = document.getElementsByClassName("qna-content-qna");
        var reportContents = document.getElementsByClassName("qna-content-Report");

        var toggleButton = document.getElementById("toggle-all");
        var toggleButtonQna = document.getElementById("toggle-all-qna");
        var toggleButtonReport = document.getElementById("toggle-all-Report");

        
        var faqButton = document.getElementById("faq-view-button");
        var qnaButton = document.getElementById("qna-view-button");
        var reportButton = document.getElementById("report-view-button");
        faqButton.style.display = "none";
        qnaButton.style.display = "none";
        reportButton.style.display = "none";

        var faqButton = document.getElementById("faq-view-button");
        faqButton.style.display = "none";

        // Hide all other content
        for (var i = 0; i < contents.length; i++) {
            contents[i].style.display = "none";
        }
        // Display the "다른 QnA 보기" button
        var qnaButton = document.getElementById("qna-view-button");
        qnaButton.style.display = "block";

        for (var i = 0; i < qnaContents.length; i++) {
            qnaContents[i].style.display = "none";
        }
        for (var i = 0; i < reportContents.length; i++) {
            reportContents[i].style.display = "none";
        }

        // Toggle QnA content
        for (var i = 0; i < qnaContents.length; i++) {
            qnaContents[i].style.display = "table-row";
        }
        toggleButtonQna.innerText = "QnA";

        allContentVisible = false;
        allQnaVisible = true;
        allReportVisible = false;
    }

    function toggleAllReport() {
        var contents = document.getElementsByClassName("qna-content");
        var qnaContents = document.getElementsByClassName("qna-content-qna");
        var reportContents = document.getElementsByClassName("qna-content-Report");

        var toggleButton = document.getElementById("toggle-all");
        var toggleButtonQna = document.getElementById("toggle-all-qna");
        var toggleButtonReport = document.getElementById("toggle-all-Report");

        
        var faqButton = document.getElementById("faq-view-button");
        var qnaButton = document.getElementById("qna-view-button");
        var reportButton = document.getElementById("report-view-button");
        faqButton.style.display = "none";
        qnaButton.style.display = "none";
        reportButton.style.display = "none";

        var faqButton = document.getElementById("faq-view-button");
        faqButton.style.display = "none";

        // Hide all other content
        for (var i = 0; i < contents.length; i++) {
            contents[i].style.display = "none";
        }
        // Display the "다른 신고 목록 보기" button
        var reportButton = document.getElementById("report-view-button");
        reportButton.style.display = "block";

        for (var i = 0; i < qnaContents.length; i++) {
            qnaContents[i].style.display = "none";
        }
        for (var i = 0; i < reportContents.length; i++) {
            reportContents[i].style.display = "none";
        }

        // Toggle Report content
        for (var i = 0; i < reportContents.length; i++) {
            reportContents[i].style.display = "table-row";
        }
        toggleButtonReport.innerText = "신고 목록";

        allContentVisible = false;
        allQnaVisible = false;
        allReportVisible = true;
    }


</script>
</head>
<body>

<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">
	<div class="container">
    <!-- FAQ 버튼 -->
    <div class="container">
    <!-- FAQ 버튼 -->
    <div class="button-group">
        <button class="toggle-button" id="toggle-all" onclick="toggleAllContent()">FAQ</button>
        <button class="toggle-button" id="toggle-all-qna" onclick="toggleAllQna()">QnA</button>
        <button class="toggle-button" id="toggle-all-Report" onclick="toggleAllReport()">신고 목록</button>
    </div>
	</div>
	
	<div class="container">
	    <div class="row">
	        <div class="col-md-12">
	            <button class="toggle-button" id="faq-view-button" style="display: none;">다른 FAQ 보기</button>
<button class="toggle-button" id="qna-view-button" style="display: none;" onclick="go_cusserAsk()">다른 QnA 보기</button>
<button class="toggle-button" id="report-view-button" style="display: none;" onclick="go_cusserReport()">다른 신고 목록 보기</button>

	        </div>
	    </div>
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

<div class="container">
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

<div class="container">
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

</div>
</body>
</html>
