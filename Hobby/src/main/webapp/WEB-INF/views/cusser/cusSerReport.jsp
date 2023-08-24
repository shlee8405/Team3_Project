<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style type="text/css">
    .container {
		margin: auto;
		width: 50%;
		background-color: #d4ead7; /* 변경된 배경색 */
		padding: 20px; /* 내용과의 간격을 위해 추가 */
		border-radius: 10px; /* 컨테이너 모서리 둥글게 */
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
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

function go_report() {
	location.href="/report.do"
}
</script>
</head>
<body>

	<jsp:include page="../header.jsp"  />
	<div style="position:relative; top:200px; z-index:1;">
	
	<div class="container">
      <div class="card-body">
        <table class="table caption-top">
 		 <caption>신고 목록</caption>
          <thead>
            <tr>
              <th scope="col">번호</th>
              <th scope="col">제목</th>
              <th scope="col">내용</th>
              <th scope="col">상태</th>
            </tr>
          </thead>
          
          <tbody>
          <c:forEach var="k" items="${list}" varStatus="loop">
            <tr>
              <td>${loop.count}</td>
              <td>${k.r_name}</td>
              <td>${k.r_content}</td>
              <td>대기중</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
        <!-- End Default Table Example -->
      </div>
	  <div class="text-end"> <!-- 오른쪽 정렬 -->
        <button type="button" class="btn btn-success" onclick="go_inquiry()">신고하기</button>
      </div>
      </div>
</div>
</body>
</html>
