<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내가 찜한 캠핑장</title>
<style type="text/css">
.my-page-title {
    text-align: center;
    margin-top: 250px;
    padding-bottom: 80px;
}

/* Toggle Styles */

#viewport {
  padding-left: 250px;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

#content {
  width: 100%;
  position: relative;
  margin-right: 0;
}

/* Sidebar Styles */

#sidebar {
  z-index: -1;
  position: fixed;
  left: 250px;
  width: 250px;
  height: 100%;
  margin-left: -250px;
  padding-top: 105px;
  overflow-y: auto;
  background: #37474F;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

#sidebar header {
  background-color: #263238;
  font-size: 20px;
  line-height: 52px;
  text-align: center;
}

#sidebar header a {
  color: #fff;
  display: block;
  text-decoration: none;
}

#sidebar header a:hover {
  color: #fff;
}

#sidebar .nav{
  
}

#sidebar .nav a{
  background: none;
  border-bottom: 1px solid #455A64;
  color: #CFD8DC;
  font-size: 14px;
  padding: 16px 24px;
}

#sidebar .nav a:hover{
  background: none;
  color: #ECEFF1;
}

#sidebar .nav a i{
  margin-right: 16px;
}

/* 페이지 내용에 왼쪽 여백 추가 */
.content {
    margin-left: 60px; /* 왼쪽 여백 크기를 사이드바 폭과 일치하도록 설정 */
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
/* var buttonStyles = {};

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
} */
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
		<!-- <br>
        <br>
        <br>
        <br>
        <br>	
        <br>
        <br>
        <br>
        <br>
        <br>
	
	<div class="container-fluid align-self-center" style="max-height: 73vh;">
		<ul class="nav nav-tabs nav-justified border-0" style="font-size: 30px; width: 50%; margin: auto;">
		  <li class="nav-item">
		    <a class="nav-link " aria-current="page" style="color: black;" href = "/myPagemain.do">내가 찜한 캠핑장</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link " aria-current="page" style="color: black;" href = "/myreview.do">내가 작성한 리뷰</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active border border-4 rounded border-success" href="/mypage.do" style="color: black;">내 정보</a>
		  </li>
		</ul>
        <br>
        <br>	
	메뉴바
<div class="sidebar">
    <ul>
        <li>
            <button id="button1" type="button" onmouseover="applyHover('button1');" onmouseout="removeHover('button1');" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myPagemain.do')">
                <i class="fa fa-home fa-2x"></i>
                <span class="nav-text">
                   내가 찜한 캠핑장
                </span>
          </button>
        </li>
        <li>
            <button id="button2" type="button" onmouseover="applyHover('button2');" onmouseout="removeHover('button2');" class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/myreview.do')">
                <i class="fa fa-globe fa-2x"></i>
                <span class="nav-text">
                    내가 작성한 리뷰
                </span>
            </button>
        </li>
        <li>
            <button id="button4" type="button" onmouseover="applyHover('button4');" onmouseout="removeHover('button4');"  class="btn btn-outline btn-custom btn-comp" onclick="goToPage('/mypage.do')">
               <i class="fa fa-comments fa-2x"></i>
                <span class="nav-text">
                    내 정보
                </span>
            </button>
        </li>
    </ul>
</div> -->

<div id="viewport">
  <!-- Sidebar -->
  <div id="sidebar">
    <ul class="nav">
      <li>
        <a href="#">
          <i class="zmdi zmdi-view-dashboard"></i> Dashboard
        </a>
      </li>
      <li>
        <a href="#">
          <i class="zmdi zmdi-link"></i> Shortcuts
        </a>
      </li>
      <li>
        <a href="#">
          <i class="zmdi zmdi-widgets"></i> Overview
        </a>
      </li>
      <li>
        <a href="#">
          <i class="zmdi zmdi-calendar"></i> Events
        </a>
      </li>
      <li>
        <a href="#">
          <i class="zmdi zmdi-info-outline"></i> About
        </a>
      </li>
      <li>
        <a href="#">
          <i class="zmdi zmdi-settings"></i> Services
        </a>
      </li>
      <li>
        <a href="#">
          <i class="zmdi zmdi-comment-more"></i> Contact
        </a>
      </li>
    </ul>
  </div>
		<br>
        <br>
        <br>
        <br>
        <br>	
        <br>
        <br>
        <br>
        <br>
        <br>
        
    <div class="scrollable-content" style="width: 30%; margin: auto;">
    <div style="margin-top: 40px;"></div>
		<table style="border-collapse: collapse; width: 100%; border: 2px solid black;">
			<thead>
			<tr>
				<th style="border: 1px solid black; padding: 8px;">번호</th>
				<th style="border: 1px solid black; padding: 8px;">캠핑장 이름</th>
				<th style="border: 1px solid black; padding: 8px;">링크 바로가기</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
	     			<c:when test="${empty list}">
	     				<tr><td colspan="4" style="border: 1px solid black; padding: 8px;"><h3>내가 찜한 캠핑장이 없습니다.</h3></td></tr>
	     			</c:when>
	     			<c:otherwise>
	     			  <c:forEach var="k" items="${list}" varStatus="vs">
	     			  	<tr>
	     			  		<td style="border: 1px solid black; padding: 8px;">${vs.count }</td>
	     			  		<td style="border: 1px solid black; padding: 8px;">${k.facltNm }</td>
	     			  		 <td style="border: 1px solid black; padding: 8px;">
					            <c:url var="campDetailURL" value="/campDetail.do">
					                <c:param name="keyword" value="${k.facltNm}" />
					            </c:url>
					            <a href="${campDetailURL}">캠핑장 보기</a>
					        </td>
	     			  	</tr>
	     			  </c:forEach> 
	     			</c:otherwise>
	     		</c:choose>
			</tbody>
		</table>
	</div>
	</div>
    <script type="text/javascript">
		function goToPage(url){
			location.href = url;
		}
	</script>
</body>
</html>
