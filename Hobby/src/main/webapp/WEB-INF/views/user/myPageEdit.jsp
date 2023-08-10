<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


function go_mypagemain() {
	location.href = "/myPage.do"
}

function go_mypageonelist() {
	location.href = "/myPageOneList.do"
}

function go_mypageedit() {
	location.href = "/myPageEdit.do"
}

function go_home() {
	location.href="/home.do"
}

</script>

</head>
<body>

<h1>마이페이지 내 정보 수정 페이지</h1>


	<!-- 나중에 사이드바 나 메뉴바로 변경 예정 -->
<table>
		<thead>
			<tr>
				<th>
					마이페이지 메인
				</th>
				<th> 
					나의 정보 보기
				</th>
				<th> 
					나의 정보 수정
				</th>
				<th>
					홈
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<button onclick="go_mypagemain()">마이페이지 메인</button>
				</td>
				<td>
					<button onclick="go_mypageonelist()">나의 정보 보기</button>
				</td>
				<td>
					<button onclick="go_mypageedit()">나의 정보 수정</button>
				</td>
				<td>
					<button onclick="go_home()">홈으로</button>
				</td>
			</tr>
		</tbody>
	</table>


</body>
</html>