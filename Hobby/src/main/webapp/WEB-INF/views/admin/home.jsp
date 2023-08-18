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
    <div class="flex-shrink-0 p-3  " style="height:100vh; width: 280px; background-color: #0f4200; color:white;">
        <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom border-2 sidebar-link">
        <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
        <span class="fs-5 fw-semibold">/CAMPING.do</span>
        </a>
        <ul class="list-unstyled ps-0">
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed sidebar-link" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
            대시보드
            </button>
            <div class="collapse" id="dashboard-collapse" style="">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="/adminHome.do" class="ps-4 link-dark rounded sidebar-link">페이지 조회수</a></li>
                <li><a href="#" class="ps-4 link-dark rounded sidebar-link">페이지 이미지 설정	</a></li>
            </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed sidebar-link" data-bs-toggle="collapse" data-bs-target="#user-collapse" aria-expanded="false">
            유저관리
            </button>
            <div class="collapse" id="user-collapse" style="">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="/adminUser.do" class="ps-4 link-dark rounded sidebar-link">사용자 리스트</a></li>
                <li><a href="#" class="ps-4 link-dark rounded sidebar-link">관리자 테이블</a></li>
                <li><a href="#" class="ps-4 link-dark rounded sidebar-link">ㅁㄴㅇㄹ</a></li>
            </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed sidebar-link" data-bs-toggle="collapse" data-bs-target="#groups-collapse" aria-expanded="false">
            캠핑모임 관리
            </button>
            <div class="collapse" id="groups-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="/adminGroup.do" class="ps-4 link-dark rounded sidebar-link">모임 리스트</a></li>
                <li><a href="#" class="ps-4 ink-dark rounded sidebar-link">모임 생성</a></li>
                <li><a href="#" class="ps-4 link-dark rounded sidebar-link">ㅁㄴㅇㄹ</a></li>
            </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed sidebar-link" data-bs-toggle="collapse" data-bs-target="#cusser-collapse" aria-expanded="false">
            고객지원
            </button>
            <div class="collapse" id="cusser-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="#" class="ps-4 link-dark rounded sidebar-link">F A Q</a></li>
                <li><a href="/adminQNA.do" class="ps-4 ink-dark rounded sidebar-link">1대1 문의</a></li>
                <li><a href="/adminReport.do" class="ps-4 link-dark rounded sidebar-link">신고</a></li>
            </ul>
            </div>
        </li>
        <li class="border-top border-2 my-3"></li>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed sidebar-link" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
            계정
            </button>
            <div class="collapse" id="account-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                <li><a href="/home.do" class="ps-4 link-dark rounded sidebar-link">로그아웃</a></li>
            </ul>
            </div>
        </li>
        </ul>
    </div>


   


    <div>
        hi
    </div>
   

</main>

</body>
</html>