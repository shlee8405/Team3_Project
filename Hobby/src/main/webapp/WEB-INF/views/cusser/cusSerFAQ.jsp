<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<style type="text/css">
    body {
        margin: 0;
        padding: 0;
    }
    
    #top-section {
        height: 50px;
        background-color: #0F4200;
    }
    
    #middle-section {
        text-align: center;
        background-color: #FFFFFF;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    
    #bottom-section {
        position: fixed;
        bottom: 0;
        width: 100%;
        height: 50px;
        background-color: #0F4200;
    }
    
    table {
	    border-collapse: collapse;
	    width: 50%; /* 테이블 크기를 내용에 맞게 자동 조정 */
	    margin: 0 auto;
	    margin-bottom: 10px; /* 각 테이블 아래에 10px 여백 추가 */
	    border-radius: 20px; /* 테이블 모서리를 둥글게 만듦 */
	}

    table, th, td {
        border: 1px solid black;
        padding: 5px; /* 각 칸에 5px 여백 추가 */
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
    
    .qna-entry {
        display: table-row;
    }
    
    .qna-title {
        font-weight: bold;
    }
    
    .qna-content {
        display: none;
    }
    
    .toggle-button {
        cursor: pointer;
        text-decoration: underline;
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

function toggleContent(index) {
    var content = document.getElementById("content-" + index);
    var toggleButton = document.getElementById("toggle-" + index);
    
    if (content.style.display === "none") {
        content.style.display = "table-row";
        toggleButton.innerText = "닫기";
    } else {
        content.style.display = "none";
        toggleButton.innerText = "답변";
    }
}
</script>
</head>
<body>

<div id="top-section"></div> <!-- 상단 섹션 -->

<div id="middle-section">
    <h1 class="text-center">자주하는 질문</h1>

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

    <c:forEach var="k" items="${list}" varStatus="loop">
        <table>
            <thead>
                <tr>
                    <th>질문</th>
                </tr>
            </thead>
            <tbody>
                <tr class="qna-entry">
                    <td class="qna-title">${k.f_content}</td>
                </tr>
                <tr class="qna-entry qna-content" id="content-${loop.index}" style="display: none;">
                    <td colspan="2">${k.f_response}</td>
                </tr>
                <tr class="qna-entry">
                    <td colspan="2" class="text-center">
                        <span class="toggle-button" id="toggle-${loop.index}" 
                                onclick="toggleContent(${loop.index})">답변</span>
                    </td>
                </tr>
            </tbody>
        </table>
    </c:forEach>
</div>

<div id="bottom-section"></div> <!-- 하단 섹션 -->

</body>
</html>
