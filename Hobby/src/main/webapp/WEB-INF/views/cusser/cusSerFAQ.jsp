<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
    body {
        padding-top: 50px;
        padding-bottom: 50px;
    }
    
    .navbar-custom {
        background-color: #0F4200;
        height: 100px;
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
    
    .toggle-button {
        cursor: pointer;
        text-decoration: underline;
        margin-left: auto;
        display: block; /* 추가: 버튼을 블록 요소로 설정하여 전체 너비를 차지하도록 함 */
        text-align: right; /* 추가: 텍스트를 오른쪽으로 정렬 */
    }
    
    .footer-bar {
	    background-color: #0F4200;
	    height: 50px;
	    width: 100%;
	    position: fixed;
	    bottom: -50px; /* 초기에는 숨겨진 상태로 설정 */
	    transition: bottom 0.3s ease-in-out; /* bottom 속성 변경에 애니메이션 적용 */
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
// 이전의 JavaScript 코드는 그대로 사용하셔도 됩니다.
	  function toggleContent(index) {
        var content = document.getElementById("content-" + index);
        var toggleButton = document.getElementById("toggle-" + index);
        
        if (content.style.display === "none") {
            content.style.display = "table-row";
            toggleButton.innerText = "닫기";
            content.classList.add("qna-content-visible"); // 내용이 보일 때의 스타일 클래스 추가
            content.style.backgroundColor = "#EFEFEF";
        } else {
            content.style.display = "none";
            toggleButton.innerText = "답변";
            content.classList.remove("qna-content-visible"); // 내용이 숨겨질 때의 스타일 클래스 제거
            content.style.backgroundColor = "initial";
        }
    }
    
</script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light navbar-custom fixed-top">
    <div class="container">
        <a class="navbar-brand" href=""><img src="/resources/images/logohorizontal3WHITE-removebg-preview_1.png" alt="로고 이미지"></a>
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
    <h1 class="text-center mb-4">자주하는 질문</h1>
	   <c:forEach var="k" items="${list}" varStatus="loop">
	    <div class="card mt-3">
	        <div class="card-header qna-title text-center" onclick="toggleContent(${loop.index})">${k.f_content}</div>
	        <div class="card-body qna-content text-center" id="content-${loop.index}" style="display: none;">
	            ${k.f_response}
	        </div>
	        <div class="card-footer">
	            <span class="toggle-button" id="toggle-${loop.index}" onclick="toggleContent(${loop.index})">답변</span>
	        </div>
	    </div>
	</c:forEach>
</div>


<footer class="footer-bar fixed-bottom"></footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
