<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


function go_mypagemain() {
	location.href = "/myPagemain.do"
}

function go_mypage() {
	location.href = "/mypage.do"
}

function go_mypageedit() {
	location.href = "/myPageEdit.do"
}
function go_myqna(){
	location.href = "/myqna.do"
}
function go_myreview(){
	location.href = "/myreview.do"
}

function go_home() {
	location.href="/home.do"
}

</script>

</head>
<body>

<h1>마이페이지 메인</h1>


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
					나의 1:1 문의 내역
				</th>
				<th> 
					나의 리뷰
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
					<button onclick="go_mypage()">나의 정보 보기</button>
				</td>
				<td>
					<button onclick="go_mypageedit()">나의 정보 수정</button>
				</td>
				<td>
					<button onclick="go_myqna()">나의 1:1문의 내역</button>
				</td>
				<td>
					<button onclick="go_myreview()">나의 리뷰</button>
				</td>
				<td>
					<button onclick="go_home()">홈으로</button>
				</td>
			</tr>
		</tbody>
	</table>


</body>
</html>