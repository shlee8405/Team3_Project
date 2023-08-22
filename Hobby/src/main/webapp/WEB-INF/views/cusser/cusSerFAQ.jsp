<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
    body {
        padding-top: 50px;
        padding-bottom: 50px;
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

<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">

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

</div>
</body>
</html>
