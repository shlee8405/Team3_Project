<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

main {
    display:flex;
    flex-direction: row;
}


.sidebar-link {
color:#ffffff!important;

}

</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script type="text/javascript">
	function go_admin() {
		location.href = "/adminHome.do"
	}

	function go_adminUser() {
		location.href = "/adminUser.do"
	}

	function go_adminGroup() {
		location.href = "/adminGroup.do"
	}

	function go_adminQNA() {
		location.href = "/adminQNA.do"
	}

	function go_adminReport() {
		location.href = "/adminReport.do"
	}

	function go_home() {
		location.href = "/home.do"
	}
</script>
</head>
<body>
<main>
    <!-- SIDEBAR -->
   	<jsp:include page="sidebar.jsp" />

   


    <div>
        <table>
		<thead>
			<tr>
				<th>
					 관지자 홈
				</th>
				<th> 
					회원 관리
				</th>
				<th> 
					캠핑모임 관리
				</th>
				<th> 
					1대1 문의
				</th>
				<th> 
					신고 목록
				</th>
				<th>
					홈으로
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<button onclick="go_admin()">관리자 홈</button>
				</td>
				<td>
					<button onclick="go_adminUser()">회원 관리</button>
				</td>
				<td>
					<button onclick="go_adminGroup()">캠핑모임 관리</button>
				</td>
				<td>
					<button onclick="go_adminQNA()">1대1 문의</button>
				</td>
				<td>
					<button onclick="go_adminReport()">신고 목록</button>
				</td>
				<td>
					<button onclick="go_home()">홈으로</button>
				</td>
			</tr>
		</tbody>
	</table>

	<table>
		<thead>
			<tr style="background-color: #99ccff">
				<th>신고자 index</th>
				<th>신고당한자 index</th>
				<th>신고내용</th>
				<th>신고처리상태</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4"><h2>원하는 정보가 존재하지 않습니다.</h2></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list}" varStatus="vs">
						<tr>
							<td>${k.r_content}</td>
							<td>${k.r_status}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

    </div>
   

</main>

</body>
</html>