<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보 수정</title>
<link rel="stylesheet" href="/resources/css/withdrawal.css">
<script type="text/javascript">
function save_go(f) {
    var form = document.getElementById("withdrawal-form");
    if (form) {
        form.action = "/withdrawal2.do";
        form.submit();
    } else {
        console.error("Form not found");
    }
}
function goBack() {
    window.history.back();
}

function goToPage(url){
	location.href = url;
}
window.onload = function() {
    var errorMsg = "${errorMsg}";
    if (errorMsg) {
        alert(errorMsg);
    }
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
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;"></div>
	<div class="my-page-title">
		<h1>회원 탈퇴</h1>
	</div>
	
	<!-- 메뉴바 -->
	<div  style="text-align: center;">
		<div class="btn-group btn-custom " role="group" aria-label="Basic radio toggle button group">
		    <button id="button1" type="button" onmouseover="applyHover('button1');" onmouseout="removeHover('button1');" style="border: 2px solid black;" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myPagemain.do')">내가 찜한 캠핑장</button>
		    <button id="button2" type="button" onmouseover="applyHover('button2');" onmouseout="removeHover('button2');" style="border: 2px solid black;" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myreview.do')">내가 작성한 리뷰</button>
		    <button id="button4" type="button" onmouseover="applyHover('button4');" onmouseout="removeHover('button4');" style="border: 2px solid black;" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/mypage.do')">내 정보</button>
		</div>
	</div>
    <div class="scrollable-content" style="width: 30%; margin: auto;">
    <div style="margin-top: 40px;"></div>
   <form action="/withdrawal.do"  method="post" id="withdrawal-form">
   
	
     <input type="hidden" name="u_idx" value="${user.u_idx}">
    <table style="border-collapse: collapse; width: 100%; border: 2px solid black;">
    <thead>
    	<tr>
            <th>항목</th>
            <th style="border: 1px solid black; padding: 8px;">내용</th>
        </tr>
    </thead>
		<tr align="center">
			<td style="border: 1px solid black; padding: 8px;">현재 비밀번호 입력</td>
			<td style="border: 1px solid black; padding: 8px;"><input type="password" id="currentPassword" name="currentPassword" required></td>
		</tr>
		
		<tfoot>
			<tr align="center">
				<td colspan="2" style="border: 1px solid black; padding: 8px;">
					<input type="button" value="탈퇴하기" onclick="save_go(this.form)" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="취소" onclick="goBack()"/>
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
	</div>
	
</body>
</html>