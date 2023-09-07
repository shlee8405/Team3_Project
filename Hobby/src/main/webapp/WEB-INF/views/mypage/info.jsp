<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보</title>
<style type="text/css">
	.user-table {
		width: 600px;
		border-collapse: collapse;
		margin: auto;
		text-align: center;
	}
	
	.user-table td {
		padding: 8px;
		border: 1px solid #ccc;
	}
	
	.user-table .label {
		font-weight: bold;
		background-color: white;
	}
	
	.user-table .user-info {
		background-color: white;
	}
	.my-page-title{
		text-align: center; /* 가운데 정렬 */
	    margin-top: 250px; /* 상단 여백 조절 */
	    padding-bottom: 80px;
	}
	.btn-group {
	    display: flex; /* 가로 정렬 */
	    justify-content: space-between; /* 양 옆 여백 */
	    max-width: 1100px; /* 최대 폭 설정 */
	    margin: 0 auto; /* 가운데 정렬 */
	    padding: 0 1px; /* 왼쪽과 오른쪽 여백 설정 */
	}
	.btn-custom{
		background-color: white;
		color: black;
	    border-color: #637F42;
	}
	
	.btn-comp {
	    flex-grow: 1;
	    transition: background-color 0.3s; /* 애니메이션 효과 추가 */
	}
	
	.btn-comp.active {
	    background-color: #637F42; /* 클릭 시 배경색 고정 */
	    color: white; /* 텍스트 색상을 밝게 조정 */
	}
	a {
		text-decoration: none;
	}
	
	table {
	    margin: 0 auto; /* 가운데 정렬 */
	    width: 800px; /* 내용에 맞게 자동 조절 */
	    max-width: 100%; /* 최대 폭 설정 */
	    border-collapse: collapse;
	    text-align: center;
	}
	th, td {
	    padding: 8px;
	    text-align: center;
	    border-bottom: 1px solid #ddd;
	    vertical-align: middle; /* 세로 가운데 정렬 */
	}
	th {
		background-color: #637F42;
		color: white;
	}
	
	.scrollable-content {
	    max-height: 80vh; /* 최대 높이 설정 */
	    overflow-y: auto; /* 세로 스크롤바 활성화 */
	}
</style>
<script type="text/javascript">
	function sendData(f) {
		f.action="/myPageEdit.do";
		f.submit();
	}
	function sendData2(f) {
		f.action="/changePassword.do";
		f.submit();
}
	


	
	
	var buttonStyles = {};

	function applyHover(buttonId) {
	    var button = document.getElementById(buttonId);
	    buttonStyles[buttonId] = {
	        backgroundColor: button.style.backgroundColor,
	        color: button.style.color
	    };

	    button.style.backgroundColor = '#4f6d3a';
	    button.style.color = 'white';

	    // 다른 버튼들의 스타일을 초기 스타일로 설정
	    for (var id in buttonStyles) {
	        if (id !== buttonId) {
	            var otherButton = document.getElementById(id);
	            var style = buttonStyles[id];
	            otherButton.style.backgroundColor = style.backgroundColor;
	            otherButton.style.color = style.color;
	        }
	    }
	}

	function removeHover(buttonId) {
	    // 호버 이벤트가 제거될 때 해당 버튼의 스타일을 초기 스타일로 복원
	    var button = document.getElementById(buttonId);
	    var style = buttonStyles[buttonId];
	    if (style) {
	        button.style.backgroundColor = style.backgroundColor;
	        button.style.color = style.color;
	    }
	}
/* function go_myPageEdit() {
	location.href = "/myPageEdit2.do"?u_idx=" + u_idx;
} */
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;"></div>
	<div class="my-page-title">
		<h1>내 정보</h1>
	</div>
	
	<div style="text-align: center;">
	<!-- 메뉴바 -->
		<div class="btn-group btn-custom " role="group" aria-label="Basic radio toggle button group">
		    <button id="button1" type="button" onmouseover="applyHover('button1');" onmouseout="removeHover('button1');" style="border: 2px solid black;" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myPagemain.do')">내가 찜한 캠핑장</button>
		    <button id="button2" type="button" onmouseover="applyHover('button2');" onmouseout="removeHover('button2');" style="border: 2px solid black;" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myreview.do')">내가 작성한 리뷰</button>
		    <button id="button4" type="button" onmouseover="applyHover('button4');" onmouseout="removeHover('button4');" style="border: 2px solid black;" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/mypage.do')">내 정보</button>
		</div>
	</div>
    <div class="scrollable-content" style="width: 30%; margin: auto;">
    <div style="margin-top: 40px;"></div>
		<form method="post">
		<table style="border-collapse: collapse; width: 100%; border: 2px solid black;">
    <thead>
        <tr>
            <th>항목</th>
            <th style="border: 1px solid black; padding: 8px;">내용</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${empty list}">
                <tr>
                    <td colspan="2">
                        <h3>나의 문의 내역이 없습니다.</h3>
                    </td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="k" items="${list}" varStatus="vs">
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">아이디</td>
                        <td style="border: 1px solid black; padding: 8px;">${k.u_id}</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">닉네임</td>
                        <td style="border: 1px solid black; padding: 8px;">${k.u_nickname}</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">이름</td>
                        <td style="border: 1px solid black; padding: 8px;">${k.u_name}</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">휴대전화</td>
                        <td style="border: 1px solid black; padding: 8px;">${k.u_phone}</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black; padding: 8px;">이메일</td>
                        <td style="border: 1px solid black; padding: 8px;">${k.u_email}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </tbody>
    <tfoot>
    	<tr align="center">
        	<td colspan="2">
        		<input type="submit" onclick="sendData(this.form)" value="내 정보 수정">
				<input type="submit" onclick="sendData2(this.form)" value="비밀번호 변경">
			</td>
        </tr>	
    </tfoot>
</table>
			</form>
			</div>
	<script type="text/javascript">
		function goToPage(url){
			location.href = url;
		}
		
	</script>
</body>
</html>
