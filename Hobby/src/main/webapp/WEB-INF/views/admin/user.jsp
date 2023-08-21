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
        var test4 = document.getElementById("test4");
        y.style.display = "none";
        z.style.display = "none";
		test4.style.display = "none";
        x.style.display = "block";
    }

    function hidetest2() {
        var x = document.getElementById("test");
        var y = document.getElementById("test2");
        var z = document.getElementById("test3");
        var test4 = document.getElementById("test4");
        x.style.display = "none";
        z.style.display = "none";
		test4.style.display = "none";       
        y.style.display = "block";
    }

    function hidetest3() {
        var x = document.getElementById("test");
        var y = document.getElementById("test2");
        var z = document.getElementById("test3");
        var test4 = document.getElementById("test4");
        x.style.display = "none";
        y.style.display = "none";
        test4.style.display = "none";
        z.style.display = "block";
    }
    
    function hidetest4() {
        var x = document.getElementById("test");
        var y = document.getElementById("test2");
        var z = document.getElementById("test3");
        var test4 = document.getElementById("test4");
        x.style.display = "none";
        y.style.display = "none";
        z.style.display = "none";
        test4.style.display = "block";
    }
    
</script>
</head>
<body>
<main>
	<!-- SIDEBAR -->
   	<jsp:include page="sidebar.jsp" />




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
            <input type="button" class="btn-check" id="btn-check" autocomplete="off" onclick="hidetest()" checked>
            <label class="btn btn-primary" for="btn-check">유저 리스트</label>

            <input type="button" class="btn-check" id="btn-check2" autocomplete="off" onclick="hidetest2()">
            <label class="btn btn-primary" for="btn-check2">유저 생성</label>

            <input type="button" class="btn-check" id="btn-check3" autocomplete="off" onclick="hidetest3()">
            <label class="btn btn-primary" for="btn-check3">관리자 리스트</label>
   
            <input type="button" class="btn-check" id="btn-check4" autocomplete="off" onclick="hidetest4()">
            <label class="btn btn-primary" for="btn-check4">관지라 생성</label>
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
        display: none;" >
    
         <div class="ps-4 pt-5 text-center container" style="align-items: center;">
                 <form action="/" method="post">
                    
                    <div class="row">
                        <h1>일반 유저 생성</h1>
                    </div>
                    
                    <div class="row justify-content-md-center">
                       <div class="col col-lg-2" style="align-items: flex-start;">
                            <label for="u_id">아이디</label>
                        </div>
                        <div class="col col-lg-2">
                            <input type="text" name="u_id" id="u_id" required>
                        </div>
                    </div>
                    <div class="row justify-content-md-center">
                        <div class="col col-lg-2">
                            <label for="u_name">이름</label> 
                        </div>
                        <div class="col col-lg-2">
                            <input type="text" name="u_name" id="u_name"required>
                        </div>
                    </div>
                    <div class="row justify-content-md-center">
                        <div class="col col-lg-2">
                            <label for="u_pw">비밀번호 :</label>
                        </div>
                        <div class="col col-lg-2">
                            <input type="password" name="u_pw" id="u_pw"required>
                        </div>
                    <div class="row justify-content-md-center"></div>
                        <div class="col col-lg-2">
                            <label for="confirm_pw">비밀번호 확인 :</label> 
                        </div>
                        <div class="col col-lg-2">
                            <input type="password" name="confirm_pw" id="confirm_pw"required></label>
                        </div>
                    </div>
                    
                    <div class="row justify-content-md-center">
                        <div class="col col-lg-2">
                            <label for="email">이메일 :</label>
                        </div>
                        <div class="col col-lg-2">
                            <input type="email" name="u_email" id="u_email"required>
                        </div>
                    </div>
    
                    <div class="row justify-content-md-center">
                        <div class="col col-lg-2">
                            <label for="u_phone">Phone Number: </label>
                        </div>
                        <div class="col col-lg-2">
                            <input type="tel" name="u_phone" id="u_phone"required>
                        </div>
                    </div>
                    
                    <div class="row justify-content-md-center"></div>
                    <div><label for="license">Read and agree to our license/terms?<input type="checkbox" name="license" id="license" required></label></div>
                    
                    <div class="row justify-content-md-center">
                            <div class="col col-lg-1"></div>
                            <div class="col col-lg-1"></div>
                            <div class="col col-lg-1"></div>
                            <div class="col col-lg-1"><input type="submit" value="유저 생성"  style="float:right;"></div>
                            <div class="col col-lg-1"><input type="reset" value="취소" style="float:left;"> </div>
                      
                    </div>
                </form>
         </div>
        
         
         
        </div>

        <!-- THIRD CONTAINER () -->
        <div id="test3" class="container mt-4" style="background-color: rgba(200, 200, 200, 0.3); height:55vh; width: 90%;  box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px; display:none;" >
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
 
		<!-- FOURTH CONTAINER () -->
        <div id="test4" class="container mt-4" style="background-color: rgba(200, 200, 200, 0.3); height:55vh; width: 90%;  box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px; display:none;" >
	  		<div class="ps-4 pt-5 text-center container" style="align-items: center;">
	                 <form action="/" method="post">
	                    
	                    <div class="row">
	                        <h1>관리자 계정 생성</h1>
	                    </div>
	                    
	                    <div class="row justify-content-md-center">
	                       <div class="col col-lg-2" style="align-items: flex-start;">
	                            <label for="u_id">아이디</label>
	                        </div>
	                        <div class="col col-lg-2">
	                            <input type="text" name="u_id" id="u_id" required>
	                        </div>
	                    </div>
	                    <div class="row justify-content-md-center">
	                        <div class="col col-lg-2">
	                            <label for="u_name">이름</label> 
	                        </div>
	                        <div class="col col-lg-2">
	                            <input type="text" name="u_name" id="u_name"required>
	                        </div>
	                    </div>
	                    <div class="row justify-content-md-center">
	                        <div class="col col-lg-2">
	                            <label for="u_pw">비밀번호 :</label>
	                        </div>
	                        <div class="col col-lg-2">
	                            <input type="password" name="u_pw" id="u_pw"required>
	                        </div>
	                    <div class="row justify-content-md-center"></div>
	                        <div class="col col-lg-2">
	                            <label for="confirm_pw">비밀번호 확인 :</label> 
	                        </div>
	                        <div class="col col-lg-2">
	                            <input type="password" name="confirm_pw" id="confirm_pw"required></label>
	                        </div>
	                    </div>
	                    
	                    <div class="row justify-content-md-center">
	                        <div class="col col-lg-2">
	                            <label for="email">이메일 :</label>
	                        </div>
	                        <div class="col col-lg-2">
	                            <input type="email" name="u_email" id="u_email"required>
	                        </div>
	                    </div>
	    
	                    <div class="row justify-content-md-center">
	                        <div class="col col-lg-2">
	                            <label for="u_phone">Phone Number: </label>
	                        </div>
	                        <div class="col col-lg-2">
	                            <input type="tel" name="u_phone" id="u_phone"required>
	                        </div>
	                    </div>
	                    
	                    <div class="row justify-content-md-center"></div>
	                    <div><label for="license">Read and agree to our license/terms?<input type="checkbox" name="license" id="license" required></label></div>
	                    
	                    <div class="row justify-content-md-center">
	                            <div class="col col-lg-1"></div>
	                            <div class="col col-lg-1"></div>
	                            <div class="col col-lg-1"></div>
	                            <div class="col col-lg-1"><input type="submit" value="유저 생성"  style="float:right;"></div>
	                            <div class="col col-lg-1"><input type="reset" value="취소" style="float:left;"> </div>
	                      
	                    </div>
	                </form>
	         </div>
   		</div>
 


   </div>
 

   

</main>

</body>
</html>