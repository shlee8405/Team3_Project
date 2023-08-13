<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function go_camp() {
		location.href = "/campList.do"
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

	function go_world() {
		location.href = "/world.do"
	}

	function go_map() {
		location.href = "/map.do"
	}

	function go_cusser() {
		location.href = "/cusSer.do"
	}

	function go_mypage() {
		location.href = "/myPage.do"
	}

	function go_admin() {
		location.href = "/adminHome.do"
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

	<main class="mt-5">
		<div class="container">
			<!--Section: Content-->
			<section>
				<div class="row justify-content-center">
					<div class="col-auto">
						<table class="table table-responsive">
							<thead>
								<tr>
									<th>캠핑장</th>
									<th>캠핑장모임</th>
									<th>고객센터</th>
									<th>마이페이지</th>
									<th>관리자</th>
									<th>로그인</th>
									<th>회원가입</th>
									<th>지도</th>
									<th>hello</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<button onclick="go_camp()" class="btn btn-primary">캠핑장</button>
									</td>
									<td>
										<button onclick="go_group()" class="btn btn-primary">캠핑장모임</button>
									</td>
									<td>
										<button onclick="go_cusser()" class="btn btn-primary">고객센터</button>
									</td>
									<td><button onclick="go_mypage()" class="btn btn-primary">마이페이지</button></td>

									<td>
										<button onclick="go_admin()" class="btn btn-primary">관리자</button>
									</td>
									<td>
										<button onclick="go_login()">로그인</button>
									</td>
									<td>
										<button onclick="go_signup()">회원가입</button>
									</td>
									<td>
										<button onclick="go_map()">지도</button>
									</td>
									<td>
										<button onclick="go_hello()">Hello</button>
									</td>

								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>
	</main>
</body>
</html>