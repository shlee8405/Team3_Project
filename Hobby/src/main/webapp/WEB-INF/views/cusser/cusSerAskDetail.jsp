<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/고객센터.do</title>
 <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">

	@font-face{
        font-family: OpenSans-Bold;
        src: url(/resources/fonts/IBMPlexSansKR-Light.ttf);
    }
    
    h1{
    	font-family: OpenSans-Bold;
    	text-align: center;
    }

    .container-fluid {
    font-family: OpenSans-Bold;
        margin: auto;
        width: 40%;
        background-color: #d4ead7;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    }
    
    .container-padding {
    font-family: OpenSans-Bold;
        overflow-y: auto; /* 내용이 넘칠 경우 스크롤 생성 */
        max-height: calc(650px); /* 최대 높이를 뷰포트 높이에서 헤더 높이를 뺀 값으로 제한 */
    }
    
    .table th, .table td {
    font-family: OpenSans-Bold;
        vertical-align: middle;
    }
    
    .table th:first-child, .table td:first-child {
    font-family: OpenSans-Bold;
        width: 10%;
        font-size: 14px;
        text-align: center; /* 가운데 정렬 추가 */
        border: 1px solid #dee2e6; /* 테두리 추가 */
    }

    .navbar {
    font-family: OpenSans-Bold;
        height: auto;
        min-height: 100vh;
        width: 250px;
   }
   
   .navbar-toggler {
   font-family: OpenSans-Bold;
        margin: auto;
   }
   
   .offcanvas {
   font-family: OpenSans-Bold;
        width: 320px;
        background-color: #637F42;
   }
   
   .navbar-nav.flex-column {
   font-family: OpenSans-Bold;
        align-items: center;
   }
   
   .navbar-nav.flex-column .nav-item {
   font-family: OpenSans-Bold;
        width: 100%;
        text-align: center;
   }

   .offcanvas-body {
   font-family: OpenSans-Bold;
       display: flex;
       flex-direction: column;
       align-items: center;
   }
   .dropdown {
   font-family: OpenSans-Bold;
       margin-top: 10px;
   }
</style>

<script type="text/javascript">
$(window).scroll(function() {
    var scroll = $(window).scrollTop();
    if (scroll > 50) { // 50px 이상 스크롤하면 배경색을 변경
        $(".navbar").css("background-color", "#0F4200"); // Change this color if needed
    } else {
        $(".navbar").css("background-color", "#637F42"); // Original color
    }
});

    function go_cusser() {
        location.href = "/cusSer.do"
    }

    function go_cusserFAQ() {
        location.href = "/cusSerFAQ.do"
    }

    function go_cusserAsk() {
        location.href = "/cusSerAsk.do"
    }

    function go_cusserReport() {
        location.href = "/cusSerReport.do"
    }

    function go_home() {
        location.href = "/home.do"
    }

    function go_inquiry() {
        location.href = "/go_updateQ.do"
    }
    function go_AskDetail(q_idx) {
        location.href = "/go_updateQ.do?q_idx=" + q_idx;
    }
    function go_Delete(q_idx) {
        location.href = "/go_deleteQ.do?q_idx=" + q_idx;
    }
    function go_List(q_idx) {
        location.href = "/cusSerAsk.do";
    }
</script>
</head>
<body>

<jsp:include page="../header.jsp" />

<div class="d-flex">

    <nav class="navbar navbar-dark" style="background-color: #637F42; width: 80px;">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon" style="color: black;"></span>
            </button>
        </nav>
        <!-- Offcanvas Navbar Content -->
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel" style="background-color: #637F42">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: white;">고객센터</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body" >
            	<div> <!-- 오른쪽 정렬 -->
                	<a class="btn btn-light" href="/cusSerFAQ.do" role="button">FAQ</a>
            	</div>
                <!-- Offcanvas Navigation Links -->
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
                      QnA
                    </button>
                    <ul class="dropdown-menu">
					  <li><a class="dropdown-item" href="/cusSerAsk.do">문의 목록 보기</a></li>
					  <li><a class="dropdown-item" href="/go_inquiry.do">문의 하기</a></li>
                    </ul>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Report
                    </button>
                    <ul class="dropdown-menu">
					  <li><a class="dropdown-item" href="/cusSerReport.do">신고 목록 보기</a></li>
					  <li><a class="dropdown-item" href="/report.do">신고하기</a></li>
                    </ul>
                  </div>
            </div>
        </div>
		
		
		<div class="container-fluid align-self-end" style="width: 50%">
		<div class="card-body container-padding">
            <div class="card-body">
                <!-- Default Table -->
                <table class="table caption-top" style="background-color: white; border-radius: 10px;">
                    <thead>
                        <tr>
                            <th scope="col" class="text-center">작성자</th>
                            <td>${user.u_name}</td>
                        </tr>
                        <tr>
                            <th scope="col" class="text-center">제목</th>
                            <td>${qvo.q_title}</td>
                        </tr>
                        <tr>
                            <th scope="col" class="text-center">내용</th>
                            <td>${qvo.q_content}</td>
                        </tr>
                        <tr>
                            <th scope="col" class="text-center">답변</th>
                            <td>${qvo.q_response}</td>
                        </tr>
                        <tr>
                        	<th scope="col" class="text-center">상태</th>
                        	<td>
					            <c:if test="${qvo.q_response == null}">
					                대기중
					            </c:if>
					            <c:if test="${qvo.q_response != null}">
					                답변 완료
					            </c:if>
				            </td>
				        </tr>
                        <tr>
                            <th scope="col" class="text-center">작성 날짜</th>
                            <td>${qvo.q_date}</td>
                        </tr>
                    </thead>
                </table>
                <!-- End Default Table Example -->
            </div>
            <div class="text-end">
                <!-- 오른쪽 정렬 -->
                <button type="button" class="btn btn-primary" onclick="go_AskDetail(${qvo.q_idx})">문의 수정</button>
                <button type="button" class="btn btn-primary" onclick="go_Delete(${qvo.q_idx})">문의 삭제</button>
                <button type="button" class="btn btn-primary" onclick="go_List(${qvo.q_idx})">목록 보기</button>
            </div>
        </div>
        </div>
    </div>
</div>


</body>
</html>
