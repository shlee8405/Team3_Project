<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑 모임 관리</title>

<style type="text/css">

main {
    display:flex;
    flex-direction: row;
}

.super {
	margin: 0px;
	margin-right:0px;
	padding-right:0px;
	width: 85%;
	margin-left:15vw;
	justify-items:center;
	background-color: rgba(217, 255, 204, 0.05);

}


.btn-tab-clicked {
	background-color: #0f4200;
}

.sidebar-link {
color:#ffffff!important;

}

.row.topper {
}

.topcontainer{
	margin:0;
	padding:2.5rem;
	width:100%;
	height:25vh;
	background-color: rgba(200,200,200,0.1);
	border-radius:10px;
}

.topcontainer2{
	margin:0;
	padding:2.5rem;
	width:100%;
	height:17vh;
	background-color: rgba(200,200,200,0.1);
	border-radius:10px;
}

.bottomcontainer {
	background-color: rgba(200, 200, 200, 0.1); 
	width: 100%; 
	box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
    border-radius: 10px; 
	padding:2.5rem;  
	display: inline-block;  
}
.col-title-text {
background-color: transparent;height:100%;display: flex;align-items: center;font-size: 2em;border-bottom: 1px solid black;justify-content: center;
}
.row-search {
	height:33%;
}
.col-title-h1 {
    font-weight: bolder;
    font-family: 'MBCM2';
    }

.row-content{
	margin-top: 25px;
}

.labelmodal {
	display: flex;
	justify-content: flex-end;
}

.titlemodal {
	display: flex;
	justify-content: flex-end;
}
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" />
<link rel="stylesheet" href="/resources/css/datatable.css?after">
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.js">
	// 데이터테이블 임포트
	import DataTable from 'datatables.net-dt';
	import 'datatables.net-responsive-dt';
</script>

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
        document.getElementById("btn-tab-1").style.backgroundColor = "#0f4200";
        document.getElementById("btn-tab-2").style.backgroundColor = '#198754';
        $('#btn-tab-1').addClass('btnclicked');
        y.style.display = "none";
        x.style.display = "block";
    }

    function hidetest2() {
        var x = document.getElementById("test");
        var y = document.getElementById("test2");
        document.getElementById("btn-tab-2").style.backgroundColor = "#0f4200";
        document.getElementById("btn-tab-1").style.backgroundColor = '#198754';
        x.style.display = "none";
        y.style.display = "block";
    }
    // 데이터테이블로 테이블 생성
    $(document).ready( function () {
	    try{
	    	$('#myTable1').DataTable();
	    }catch{
	    }
    } );
</script>
</head>
<body>
<main>
		<!-- SIDEBAR -->
	   	<jsp:include page="sidebar.jsp" />

	    <!-- MAIN CONTAINER -->
	   <div class="super" >
			<div class="row topper ms-1" style="width:100%; ">
				<div class="col" style="border-bottom: 1px solid  #0f4200;">
					<input type="button" class="btn-check" id="btn-check" autocomplete="off" onclick="hidetest()" checked>
	            	<label class="btn btn-success" for="btn-check" id="btn-tab-1">모임 리스트</label>
	
	            	<input type="button" class="btn-check" id="btn-check2" autocomplete="off" onclick="hidetest2()">
	            	<label class="btn btn-success" for="btn-check2" id="btn-tab-2">모임 생성</label>
				</div>
			</div>
	        <!-- SEARCH CONTAINER -->
	        <div id="test"> 
	        	<!-- FIRST CONTAINER (GROUP LIST SEARCH) -->
		        <div class="topcontainer  ps-5  mt-0 p-1">
		       		<div class="row row-search">
		       				       				
		       			<div class="col ">
		       			</div>
		       			<div class="col col-title-text" >
		       				<h1 class="col-title-h1">/캠핑 모임 리스트.do</h1>
		       			</div>
		       			<div class="col">
		       			</div>
		       		</div>
		       		
		       		<div class="row row-search">
		       		</div>
		       		
		       		<div class="row row-search" >
						<div class="col-4"> </div>
						<div class="col" style="align-items:center;">
							<select class="form-select row-content" id="searchTextSelect" aria-label="Default select example" style="width:100% ; " >
							  <option value="1" selected>닉네임</option>
							  <option value="2" >출생년도</option>
							  <option value="3" >번호 마지막 4</option>
							</select> 
						</div>
						<div class="col-2" style="align-items:center;"> 
							<input class="row-content" type="text" id="searchTextInput" style="width:100%">
						</div>
					<script type="text/javascript">
						// 검색 버튼 자바스크립트 function
						function search() {
							const text = document.getElementById("searchTextInput").value;		
							if(text==''|| !text) {
								alert('검색어를 입력해주세요');
								document.getElementById("searchTextInput").focus();
							}
							else {
								const subject = document.getElementById("searchTextSelect").value;
								if (subject == '1') {
									location.href = "/adminUserPageDetailSearch?text="+text+"&query="+subject;
								} else if (subject == '2') {
									location.href = "/adminUserPageDetailSearch?text="+text+"&query="+subject;
								} else if (subject == '3') {
									location.href = "/adminUserPageDetailSearch?text="+text+"&query="+subject;
								}
							}
						}
						// 전체보기 function
						function refresh() {
							location.href="/adminUser.do";
						}
					</script>
						<div class="col" style=" align-items:center;"> 
							<input class="row-content btn btn-success" type="button" onclick='search()' style="width:100%" value="검색">
						</div>
						<div class="col" style="align-items:center;">
							<input class="row-content btn btn-success" type="button" onclick='refresh()' style="width:100%" value="전체보기">
						</div>
						<div class="col-3"> </div>
		       		</div>
		       		
		        </div>
		
		        <!-- FIRST CONTAINER ( USER LIST )-->
		        <div class="bottomcontainer ms-2 me-3 mt-1"   style="height:auto;">
		                <table class="display" id="myTable1">	
		                    <thead class="table-success" >
			                   	<c:choose>
			                   		<c:when test="${empty list}">
										<tr>
											<th></th>
										</tr>
			                   		</c:when>
			                   		<c:otherwise>
				                           <tr>
					                            <th> 모임 제목</th> 
					                            <th> 모임 정보 </th>
					                            <th> 모임 설명 </th>
					                            <th> 모임 날짜 </th>
					                            <th> 모임 위치 </th> <!-- g_cdo+ g_gugun + g_location  -->
					                            <th> 모임 생성자 </th>
					                            <th> 모임 참가자 </th>  <!-- GROUPUSERS 참고 -->
					                            <th> 더보기 </th> <!-- 모달로 삭제 prompt -->
					                        </tr>
			                   		</c:otherwise>
			                   	</c:choose>
		                        
		            
		                     </thead>
		                     <tbody class="table-group-divider">
								<c:choose>
											<c:when test="${empty list}">
												<tr>
													<td ><h2>원하는 정보가 존재하지 않습니다.</h2></td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="k" items="${list}" varStatus="vs">
													<tr>
														<!-- g_title -->
														<td>${k.g_title}</td>
														<!-- g_intro -->
														<td>${k.g_intro}</td>
														<!-- g_desc -->
														<td>${k.g_desc}</td>
														<!-- g_date -->
														<td>${k.g_date}</td>
														<!-- location (g_cdo + g_gugun + g_location) -->
														<td>${k.g_cdo} ${k.g_gugun} ${k.g_location}</td>
														<!-- group creator -->
														<td>${k.u_idx}</td>
														<!-- group registered users -->
														<td> 
															<a href="#"  class="btn btn-success" style="padding:0;" 
															data-bs-toggle="modal" data-bs-target="#usersModal${k.g_idx}">
															  참가자 보기
															</a>
														</td>
														<!-- edit group -->
														<td> 
															<a href="#"  class="btn btn-success" style="padding:0;" 
															data-bs-toggle="modal" data-bs-target="#groupModal${k.g_idx}">
															  모임 상세 보기
															</a>
														</td>
													</tr>
													
													<!-- modal create start -->
													
													<!-- usersModal -->
													<div class="modal fade" id="usersModal${k.g_idx}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-xl" id="oneGroupModal">
															<div class="modal-content">
																<div class="modal-header titlemodal">
																	<h5 class="modal-title" id="exampleModalLabel"><b>${k.g_title}</b> 모임 참가자들</h5>
																	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<form>
																	<div class="modal-body">
																		<div class="container-fluid">
																			<div class="row">
																				
																			</div>																		
																		</div>
																	</div>
																</form>
															</div>															
														</div>
													</div>
													
															<!-- usersModal -->
													<div class="modal fade" id="groupModal${k.g_idx}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-xl" id="oneGroupModal">
															<div class="modal-content">
																<div class="modal-header titlemodal">
																	<h5 class="modal-title" id="exampleModalLabel"><b>${k.g_title}</b> 모임 수정</h5>
																	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<form>
																	<div class="modal-body">
																	<!-- TODO -->
																	</div>
																</form>
															</div>															
														</div>
													</div>
													
													
												</c:forEach>
											</c:otherwise>
										</c:choose>
		                        </tbody>
		                </table> 
		        </div>
			</div>
      
        <!-- SECOND CONTAINER () -->
        <div id="test2" style="display:none;">
        
        
        			<div class="topcontainer  ps-5  mt-0 p-1">
			       		<div class="row row-search">
			       			<div class="col ">
			       			</div>
			       			<div class="col col-title-text" >
			       				<h1 class="col-title-h1">/캠핑 모임 추가.do</h1>
			       			</div>
			       			<div class="col">
			       			</div>
			       		</div>
			       		<div class="row row-search">
			       		</div>
			       		<div class="row row-search">
			       		</div>
					</div>
		
        
	        <div class="bottomcontainer ms-2 me-3 mt-1"   style="height:70vh;">
    
		                 <form action="/signupGoAdmin.do" method="post">
		                    
		                    <div class="row" >
		                       	<div class="col"  style="display:flex; justify-content: center;">
		                       		<h1>일반 유저 생성</h1>
		                       	</div> 
		                    </div>
		                    
		                    <div class="row justify-content-md-center " >
		                       <div class="col col-lg-2" style="display:flex; justify-content: flex-end;">
		                            <label for="u_id">아이디</label>
		                        </div>
		                        <div class="col col-lg-2">
		                            <input type="text" name="u_id" id="u_id" placeholder="아이디 입력하세요" required >
		                        </div>
		                    </div>
		                     <div class="row justify-content-md-center " >
		                       <div class="col col-lg-2" style="display:flex; justify-content: flex-end;">
		                            <label for="u_id">닉네임</label>
		                        </div>
		                        <div class="col col-lg-2">
		                            <input type="text" name="u_nickname" id="u_nickname" placeholder="닉네임 입력하세요" required >
		                        </div>
		                    </div>
		                    <div class="row justify-content-md-center ">
		                        <div class="col col-lg-2" style="display:flex; justify-content: flex-end;">
		                            <label for="u_name">이름</label> 
		                        </div>
		                        <div class="col col-lg-2">
		                            <input type="text" name="u_name" id="u_name" placeholder="이름 입력하세요" required>
		                        </div>
		                    </div>
		                    <div class="row justify-content-md-center ">
		                        <div class="col col-lg-2"style="display:flex; justify-content: flex-end;">
		                            <label for="u_pw">비밀번호 :</label>
		                        </div>
		                        <div class="col col-lg-2">
		                            <input type="password" name="u_pw" id="u_pw" placeholder="비밀번호 입력하세요" required>
		                        </div>
		                        
		                    </div>
		                    <div class="row justify-content-md-center">
		                        <div class="col col-lg-2"style="display:flex; justify-content: flex-end;">
		                            <label for="confirm_pw">비밀번호 확인 :</label> 
		                        </div>
		                        <div class="col col-lg-2">
		                            <input type="password" name="confirm_pw" id="confirm_pw"placeholder="비밀번호 입력하세요" required>
		                        </div>
		                    </div>
		                    
		                    <div class="row justify-content-md-center">
		                        <div class="col col-lg-2"style="display:flex; justify-content: flex-end;">
		                            <label for="email">이메일 :</label>
		                        </div>
		                        <div class="col col-lg-2">
		                            <input type="email" name="u_email" id="u_email" placeholder="이메일 입력하세요" required>
		                        </div>
		                    </div>
		    
		                    <div class="row justify-content-md-center">
		                        <div class="col col-lg-2"style="display:flex; justify-content: flex-end;">
		                            <label for="u_phone">전화번호 : </label>
		                        </div>
		                        <div class="col col-lg-2">
		                            <input type="tel" name="u_phone" id="u_phone" placeholder="010-1234-5678" required>
		                        </div>
		                    </div>
		                    
		                    <div class="row justify-content-md-center">
		                    	<div class="col" style="display:flex; justify-content: center;" >
		                    		<label for="license"> 약관동의 <input type="checkbox" name="license" id="license" required></label>
		                    	</div>
		                    </div>
		                    
		                    <div class="row justify-content-md-center">
		                            <div class="col col-lg-1"></div>
		                            <div class="col col-lg-1"></div>
		                            <div class="col col-lg-1"><input type="submit" class="btn btn-primary" value="유저 생성"  style="float:right;"></div>
		                            <div class="col col-lg-1"><input type="reset" class="btn btn-danger" value="취소" style="float:left;"> </div>
		                      
		                    </div>
		                </form>
		        	</div>
		          </div>
   </div>
 

   

</main>

</body>
</html>