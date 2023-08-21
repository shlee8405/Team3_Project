<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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

    function hidetest() {
        var x = document.getElementById("test");
        var y = document.getElementById("test2");
        var z = document.getElementById("test3");
       // if (x.style.display === "none") {
            x.style.display = "block";
            y.style.display = "none";
            z.style.display = "none";
            // } else {
       //     x.style.display = "none";
       //     y.style.display = "block";
       // }
    }

    function hidetest2() {
        var x = document.getElementById("test");
        var y = document.getElementById("test2");
        var z = document.getElementById("test3");
        x.style.display = "none";
        y.style.display = "block";
        z.style.display = "none";
    }

    function hidetest3() {
        var x = document.getElementById("test");
        var y = document.getElementById("test2");
        var z = document.getElementById("test3");
        x.style.display = "none";
        y.style.display = "none";
        z.style.display = "block";
    }
</script>
</head>
<body>
<main>

    <!-- SIDE BAR ( NAV BAR )-->
    <div class="flex-shrink-0 p-3  " style="height:100vh; width: 15%; background-color: #0f4200; color:white;">
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
                <li><a href="/adminHome.do" class="ps-4 link-dark rounded sidebar-link">11</a></li>
                <li><a href="#" class="ps-4 link-dark rounded sidebar-link">22</a></li>
                <li><a href="#" class="ps-4 link-dark rounded sidebar-link">33</a></li>
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


    <!-- MAIN CONTAINER -->
   <div class="container"  style="width: 85%;">


        <!-- SEARCH CONTAINER -->
        <div class="container  ps-5 col-5 mt-5 p-1  " style="background-color: rgba(200, 200, 200, 0.3); height:25vh; width: 90%; box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px; flex-direction: column;
        " >
            <div class="row justify-content-center align-items-center g-2 m-1 ms-5 me-5" style="height: 4vh;">
                <div class="col" style="width: 20%;">Search</div>
                <div class="col-10" > <input type="search" name="" id="" style="width: 80%;"></div>
            
            </div>
            <div class="row justify-content-center align-items-center g-2 m-2 m-1 ms-5 me-5" style="height: 4vh;">
                <div class="col-2 ">Search</div>
                <div class="col-lg" > <input type="search" name="" id="" style="width: 80%;"></div>
            
            </div>
            <div class="row justify-content-center align-items-center g-2 m-2 m-1 ms-5 me-5" style="height: 4vh;">
                <div class="col-2 ">Search</div>
                <div class="col-10" > <input type="search" name="" id="" style="width: 80%;"></div>
            </div>
            <div class="row justify-content-center align-items-center g-2 m-2 m-1 ms-5 me-5">
                <div class="col-10"></div>
                <div class="col"> <div class="d-grid gap-2">
                    
                <button type="button" name="" id="" class="btn btn-primary">Button</button>
                </div></div>
            </div>
        </div>


        <!-- TOGGLE BUTTON CONTAINER -->
        <div class="container mt-4 ps-5 p-1 col-6">
            <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off" onclick="hidetest()" checked>
            <label class="btn btn-primary" for="btn-check">유저 리스트</label>

            <input type="checkbox" class="btn-check" id="btn-check2" autocomplete="off" onclick="hidetest2()">
            <label class="btn btn-primary" for="btn-check2">Single toggle</label>

            <input type="checkbox" class="btn-check" id="btn-check3" autocomplete="off"  onclick="hidetest3()">
            <label class="btn btn-primary" for="btn-check3">Single toggle</label>
   
        </div>
        

        <!-- FIRST CONTAINER ( USER LIST )-->
        <div id="test" class="container mt-4" style="background-color: rgba(200, 200, 200, 0.3); height:55vh; width: 90%;  box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px;
        " >
            <div class="table-responsive pt-4 ps-5 pe-5" style="height: 50vh; padding-bottom: 1rem;">
                <table class="table 
                table-hover	
                table-sm
                table-success   
                align-middle
                overflow-auto">
                    <thead class="table-primary">
                        <caption>Table Name</caption>
                        <tr>
                            <th> 아이디 </th>
                            <th> 닉네임 </th>
                            <th> 비밀번호</th>
                            <th> 이름 </th>
                            <th> 이메일</th>
                            <th> 생년월일</th>
                            <th> 전화번호 </th>
                            <th> 밴유무 </th>
                            <th> 약관동의</th>
                            <th> status </th>
                            <th> 더보기 </th>
                        </tr>
                     </thead>
                        <tbody class="table-group-divider">
							<c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="4"><h2>원하는 정보가 존재하지 않습니다.</h2></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="k" items="${list}" varStatus="vs">
											<tr>
												<td>${k.u_id}</td>
												<td>${k.u_nickname}</td>
												<td>${k.u_pw}</td>
												<td>${k.u_name}</td>
												<td>${k.u_email}</td>
												<td>${k.u_birthday}</td>
												<td>${k.u_phone}</td>
												<td>${k.u_ban}</td>
												<td>${k.u_terms}</td>
												<td>${k.u_status}</td>
												<td> 
													<button> 유저 상세보기 </button>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
                        </tbody>
                </table> 
            </div>
            
            

        </div>


        <!-- SECOND CONTAINER () -->
        <div id="test2" class="container mt-4" style="background-color: rgba(200, 200, 200, 0.3); height:55vh; width: 90%;  box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px;
        display:none;" >

         <div class="ps-4 pt-5">
         	    <form action="/" method="post">
			        <h1>Sign Up</h1>
			        <p>welcome to Sunmade!</p><p>sign up to join our company</p>
			        <div>
			        	<label for="name">First Name:</label>
			        	<input type="text" name="name" id="name" required>
			    	</div>
			    	<div><label for="lastName">Last Name:</label> <input type="text" name="lastName" id="lastName"required></div>
			    	<div>
			        	<label for="password">Password:</label> <input type="password" name="Password" id="Password"required>
			    	</div>
			    	<div><label for="confirm_password">Confirm Password:</label> <input type="password" name="confirm_password" id="confirm_password"required></label></div>
			    	<div><label for="email">Email:</label>
			        	<input type="email" name="email" id="email"required>
			    	</div>
			    	<div><label for="phone_number">Phone Number: </label><input type="tel" name="phone_number" id="phone_number"required></div>
			    	<div><label for="license">Read and agree to our license/terms?<input type="checkbox" name="license" id="license" required></label></div>
			    	<div><input type="submit" value="Sign Up"></div>
			    </form>
         </div>
         
         
        </div>

        <!-- THIRD CONTAINER () -->
        <div id="test3" class="container mt-4" style="background-color: rgba(200, 200, 200, 0.3); height:55vh; width: 90%;  box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px;
        display:none;" >

         <H1>관리자 생성 폼 들어갈 곳</H1>

        <div class="container">
            <form>
                <div class="mb-3 row">
                    <label for="inputName" class="col-4 col-form-label">Name</label>
                    <div class="col-8">
                        <input type="text" class="form-control" name="inputName" id="inputName" placeholder="Name">
                    </div>
                </div>
                <fieldset class="mb-3 row">
                    <legend class="col-form-legend col-4">Group name</legend>
                    <div class="col-8">
                        you can use radio and checkboxes here
                    </div>
                </fieldset>
                <div class="mb-3 row">
                    <div class="offset-sm-4 col-sm-8">
                        <button type="submit" class="btn btn-primary">Action</button>
                    </div>
                </div>
            </form>
        </div>
        </div>


   </div>
 

   

</main>

</body>
</html>