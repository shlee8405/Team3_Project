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
    .card{
		margin: auto;
		width: 50%;
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

<h1 class="text-center">신고 내역</h1>

<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">

<div class="card">
      <div class="card-body">
        <h5 class="card-title" style="font-size: 30px;">신고 내역</h5>
		<br><br>
        <!-- Default Table -->
        <table class="table table-hover">
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
    </div>
<br>
<div class="text-center">
	<button type="button" class="btn btn-success" onclick="go_report()">신고하기</button>
</div>
</div>
</body>
</html>
