<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="resources/css/styles.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	
	
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
<h1>관리자 홈</h1>
	<!-- 나중에 사이드바 나 메뉴바로 변경 예정 -->
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


	
</body>
</html>