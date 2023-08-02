<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go_camp() {
		location.href = "/camp.do"
	}

	function go_group() {
		location.href = "/group.do"
	}

	function go_login() {
		location.href = "/login.do"
	}
	
	function go_signup() {
		location.href = "/signup.do"

	}
	function go_hello() {
		location.href = "/hello.do"
	}
	
	function go_world() {
		location.href = "/world.do"

	}
</script>


<style type="text/css">
a {
	text-decoration: none;
}

table {
	width: 600px;
	border-collapse: collapse;
	text-align: center;
}

table, th, td {
	border: 1px solid black;
	padding: 3px;
}

div {
	width: 600px;
	text-align: center;
	margin: auto;
}

input {
	padding: 3px;
}
</style>
</head>
<body>

	<h1>Hello World</h1>
	<h2 class="m2"> hello</h2>
	<table>
		<thead>
			<tr>
				<th>캠핑장</th>
				<th>캠핑장모임</th>
				<th>로그인</th>
				<th>회원가입</th>
				<th>Hello</th>
				<th>World</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<button onclick="go_camp()">캠핑장</button>
				</td>
				<td>
					<button onclick="go_group()">캠핑장모임</button>
				</td>
				<td>
					<button onclick="go_login()">로그인</button>
				</td>
				<td>
					<button onclick="go_signup()">회원가입</button>
				</td>
				<td>
					<button onclick="go_hello()">Hello</button>
				</td>
				<td>
					<button onclick="go_world()">World</button>
				</td>
				
			</tr>
		</tbody>
	</table>
</body>
</html>