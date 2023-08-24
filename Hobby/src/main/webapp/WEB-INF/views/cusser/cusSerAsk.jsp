<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style type="text/css">
	.card{
		margin: auto;
		width: 50%;
	}
	
	.sidebar-link {
		color:#ffffff!important;
	
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

function go_inquiry() {
	location.href="/go_inquiry.do"
}
function go_AskDetail() {
	location.href="/go_AskDetail.do?q_idx=" + q_idx;
}
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<div style="position:relative; top:200px; z-index:1;">

<%-- <jsp:include page="sidebar.jsp"/> --%>

	<div class="card">
      <div class="card-body">
        <h5 class="card-title" style="font-size: 30px;">1:1 문의</h5>
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
         
          <c:forEach var="k" items="${alllist}" varStatus="loop">
            <tr>
              <td>${loop.count}</td>
              <td>${k.u_name}</td>
              <td>${k.q_content}</td>
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
	<button type="button" class="btn btn-success" onclick="go_inquiry()">문의하기</button>
</div>

</div>
</body>
</html>
</div>	
