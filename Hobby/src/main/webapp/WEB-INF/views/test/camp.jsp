<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style type="text/css">
    #test1 {
        border: 1px solid black;
    }
    #test1 th,td {
        border: 1px solid black;
        text-align: center; /* 테이블 셀의 텍스트를 가운데 정렬 */
    }
</style>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	$("#allList").on("click", function() {
		$("#out").empty();
		$.ajax({
			url : "https://apis.data.go.kr/B551011/GoCamping/basedList?numOfRows=10&pageNo=1&MobileOS=WEB&MobileApp=AppTest&serviceKey=0jWBRiz0RJmRmzfMZ23uO9m7juS3aBNXJskrlUMMHsm15eOVy9oSxTPqJGoOVceVRR1oUCq%2BHjjzFSStiMpsdw%3D%3D&_type=xml.xml",
			method : "get",
			dataType : "xml",
			success : function(data) {
				var table = "<table>";
				table +="<thead><tr><th>이름</th><th>정보</th><th>사진</th></tr></thead>";
				table += "<tbody>";
				// 원하는 태그 검색
				$(data).find("item").each(function() {
					var name = $(this).find("facltNm").text();						
					var desc = $(this).find("featureNm").text();
					var image = $(this).find("firstImageUrl").text();
					table += "<tr>";
					table += "<td>"+ name +"</td><td>"+desc+"</td>";
					table += "<td><img src="+image+" style='width:100px; height:auto;'></td>";
					table += "</tr>";
				});
				table += "</tbody></table>";
				$("#out").append(table);
			},
			error : function() {
				alert("가져오기 실패");
			}
		});
	});
	
	
});

function getCampList2() {
	location.href="/campAllList.do";
}
</script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/home.do">LOGO 자리</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto ">
				<li class="nav-item active"><a class="nav-link" href="#">캠핑장
						<span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="/group.do" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 캠핑모임 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/group.do">캠핑모임 생성</a> <a
							class="dropdown-item" href="/groupList.do">캠핑모임 참가</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">test</a>
					</div></li>

			</ul>
			<a class="nav-link" href="/login.do">로그인 <span class="sr-only">(current)</span></a>
		</div>
	</nav>

	
	<div id="allList"> 전체보기 (눌러주세요) </div>
	<div id="allList2"> 
	<button onclick="getCampList2()">
	전체보기 (java)
	</button>
	</div>




	<div class="input-group mt-5">
		<input type="text" class="form-control" placeholder="Search this blog">
		<div class="input-group-append">
			<button class="btn btn-secondary" type="button">
				<i class="fa fa-search"></i>
			</button>
		</div>
	</div>
	
<<<<<<< HEAD

=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
	<p>테스트입니다.</p>
	<p>안녕하세요</p>
	<p>반가워요</p>
	<p>test</p>
	
=======
	
	
>>>>>>> refs/heads/sy
>>>>>>> refs/heads/main
	<!-- 나중에 jstl foreach로 할거임 -->
	<div class="container mt-5">
		<table id="test1">
			<thead> 
				<th>캠핑장 이름</th>
				<th>연락처</th>
				<th>좌표x</th>
				<th>좌표y</th>
				<th>몰루</th>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="k" items="${test}">
						<td>${k}</td>
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="k" items="${test1}">
						<td>${k}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
  

	<div class="container mt-7">
		<div class="row mt-7" id="out">
		<h2>데이터 불러오면 변경될 공간</h2>
		</div>
	</div>
	
	</body>
</html>