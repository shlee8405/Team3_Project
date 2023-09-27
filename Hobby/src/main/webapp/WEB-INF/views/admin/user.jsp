<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 관리</title>
 <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico">
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
        var z = document.getElementById("test3");
        var test4 = document.getElementById("test4");
        document.getElementById("btn-tab-1").style.backgroundColor = "#0f4200";
        document.getElementById("btn-tab-2").style.backgroundColor = '#198754';
        document.getElementById("btn-tab-3").style.backgroundColor = '#198754';
        document.getElementById("btn-tab-4").style.backgroundColor = '#198754';
        $('#btn-tab-1').addClass('btnclicked');
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
        document.getElementById("btn-tab-2").style.backgroundColor = "#0f4200";
        document.getElementById("btn-tab-1").style.backgroundColor = '#198754';
        document.getElementById("btn-tab-3").style.backgroundColor = '#198754';
        document.getElementById("btn-tab-4").style.backgroundColor = '#198754';
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
        document.getElementById("btn-tab-3").style.backgroundColor = "#0f4200";
        document.getElementById("btn-tab-1").style.backgroundColor = '#198754';
        document.getElementById("btn-tab-2").style.backgroundColor = '#198754';
        document.getElementById("btn-tab-4").style.backgroundColor = '#198754';
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
        document.getElementById("btn-tab-4").style.backgroundColor = "#0f4200";
        document.getElementById("btn-tab-1").style.backgroundColor = '#198754';
        document.getElementById("btn-tab-2").style.backgroundColor = '#198754';
        document.getElementById("btn-tab-3").style.backgroundColor = '#198754';
        x.style.display = "none";
        y.style.display = "none";
        z.style.display = "none";
        test4.style.display = "block";
    }
    
    $(document).ready( function () {
    	try{
	        $('#myTable2').DataTable();
    	}catch {
    	}
    } );
    $(document).ready( function () {
	    try{
	    	$('#myTable1').DataTable();
	    }catch{
	    	
	    }
	    	
    } );
    $(document).ready(()=>{
    	var actionControl = "${adminActionControl}";
    	if(actionControl == "ban") {
    		alert("성공적으로 밴하셨습니다.");
    		actionControl = "";
    		<% session.removeAttribute("adminActionControl"); %>
    	} else if (actionControl == "update") {
    		alert("성공적으로 수정하셨습니다.");
    		<% session.removeAttribute("adminActionControl"); %>
    	} else if (actionControl == "delete") {
    		alert("성공적으로 삭제하셨습니다.");
    		<% session.removeAttribute("adminActionControl"); %>
    	} else if (actionControl == "error") {
    		alert("뭔가 잘 못 되었습니다. 개발자에게 문의하세요.");
    		<% session.removeAttribute("adminActionControl"); %>
    	} else if (actionControl == "unban") {
    		alert("정지를 풀었습니다.");
    		<% session.removeAttribute("adminActionControl"); %>
    	}
    })
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
	            	<label class="btn btn-success" for="btn-check" id="btn-tab-1">유저 리스트</label>
	
	            	<input type="button" class="btn-check" id="btn-check2" autocomplete="off" onclick="hidetest2()">
	            	<label class="btn btn-success" for="btn-check2" id="btn-tab-2">유저 생성</label>
	
	            	<input type="button" class="btn-check" id="btn-check3" autocomplete="off" onclick="hidetest3()">
	            	<label class="btn btn-success" for="btn-check3" id="btn-tab-3">관리자 리스트</label>
	   
	            	<input type="button" class="btn-check" id="btn-check4" autocomplete="off" onclick="hidetest4()">
	            	<label class="btn btn-success" for="btn-check4" id="btn-tab-4">관리자 생성</label>
				</div>
			</div>
	
	        <!-- SEARCH CONTAINER -->
	        <div id="test"> 
	        	<!-- FIRST CONTAINER (USER LIST SEARCH) -->
		        <div class="topcontainer  ps-5  mt-0 p-1">
		       		<div class="row row-search">
		       				       				
		       			<div class="col ">
		       			</div>
		       			<div class="col col-title-text" >
		       				<h1 class="col-title-h1">/유저 리스트.do</h1>
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
						var input = document.getElementById("searchTextInput");

						input.addEventListener("keypress", function(event) {
						  if (event.key === "Enter") {
						    event.preventDefault();
						    document.getElementById("searchSubmitBtn").click();
						  }
						});
						
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
						function refresh() {
							location.href="/adminUser.do";
						}
						</script>
						<div class="col" style=" align-items:center;"> 
							<input class="row-content btn btn-success" type="button" onclick='search()' style="width:100%" value="검색" id="searchSubmitBtn">
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
					                            <th> 아이디 </th>
					                            <th> 닉네임 </th>
					                            <th> 이름 </th>
					                            <th> 이메일</th>
					                            <th> 생년월일</th>
					                            <th> 전화번호 </th>
					                            <th> 밴유무 </th>
					                            <th> 약관동의</th>
					                            <th> 더보기 </th>
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
												
												
													<c:if test="${k.u_status==0}">
														<tr>
															<!-- 아이디 숨기기 -->
															<c:choose>
																<c:when test="${not empty k.u_id}">
																	<c:set var="inputString" value="${k.u_id}" /> <!-- Replace with your input string -->
																    <c:set var="firstLetter" value="${inputString.substring(0, 1)}" />
																    <c:set var="lastLetter" value="${inputString.substring(fn:length(inputString) - 1)}" />
																    <c:set var="middleAsterisks" value="" />
																    <c:forEach var="i" begin="1" end="${fn:length(inputString) - 2}">
															        <c:set var="middleAsterisks" value="${middleAsterisks}*"/>
																    </c:forEach>
																	<td>${firstLetter}${middleAsterisks}${lastLetter}</td>
																</c:when>
																
																<c:otherwise>
																	<td>-</td>
																</c:otherwise>
															</c:choose>
															
															<td>${k.u_nickname}</td>
															
															<!-- 이름 숨기기 -->
													    	<td>탈퇴회원</td>
															
															<!-- 이메일 숨기기 -->
													 	   	<td>-</td>
															 	
															
															<!-- 생년월일 숨기기 -->		
															<td>-</td>
															
															<!-- 핸드폰 번호 숨기기 -->
															<td>-</td>
															
																	
																	
															<!-- 벤 유무 -->
															<td>-</td>
															
															<!-- 약관 동의 -->
															<td>-</td>


															<!-- 유저 상세보기 -->
															<td> 
																<a href="#"  class="btn btn-success" style="padding:0;" data-bs-toggle="modal" data-bs-target="#modal${k.u_idx}">
																  유저 정보 보기
																</a>
															</td>
														</tr>
														
														<div class="modal fade" id="modal${k.u_idx}"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														
															<div class="modal-dialog modal-xl" id="oneUserModal" >
																 <div class="modal-content">
															      <div class="modal-header titlemodal">
															        <h5 class="modal-title" id="exampleModalLabel"><b>${k.u_nickname}</b>님의 정보</h5>
															        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															      </div>
													      	 	<form>
															      		<div class="modal-body">	
														      			 <!-- 유저 상세보기 정보 컨테이너 -->
															      	 		<div class="container-fluid">
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			아이디
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_id" placeholder="${k.u_id}">
																	      	 		</div>
																	      	 	</div>
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			닉네임
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_nickname" placeholder="${k.u_nickname }">
																	      	 		</div>
																	      	 	</div>
																				<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			이메일
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_email" placeholder="-" readonly>
																	      	 		</div>
																	      	 	</div>
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			이름
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_name" placeholder="-" readonly>
																	      	 		</div>
																	      	 	</div>
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			생년월일
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_birthday" placeholder="-"readonly>
																	      	 		</div>
																	      	 	</div>
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			전화번호
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_phone" placeholder="-" readonly>
																	      	 		</div>
																	      	 	</div>
																	      	 	<input type="hidden" name="u_idx" value="${k.u_idx}">
															      			</div>
																	      
															      		</div>
															      		
															      		<script type="text/javascript">
															      			// 상세 유저 CRUD
															      			const banUser = (idx) => {
															      				const response = confirm("정말로 밴하겠습니까?");
															      				if(response) location.href = "/banUserAdmin?idx="+idx;
															      				else alert("취소하셨습니다");
															      			}
															      			
															      			const unbanUser = (idx) => {
															      				const response = confirm("정말로 밴을 풀겠습니까?");
															      				if(response) location.href = "/unbanUserAdmin?idx="+idx;
															      				else alert("취소하셨습니다");
															      			}
															      			
															      			
															      			const deleteUser = (idx) => {
															      				const response = confirm("정말로 삭제 하시겠습니까?");
															      				if(response) location.href = "/deleteUserAdmin?idx="+idx;
															      				else alert("취소하셨습니다");
															      			}
															      			
															      			function updateUser(f) {
															      				const response = confirm("정말로 수정 하시겠습니까?");
															      				if(response) {
															      					f.action = "/updateUserAdmin";
															      					f.submit();
															      				}
															      				else alert("취소하셨습니다");
															      			}							
															      			
															      		</script>
															      			
																      <div class="modal-footer">
																      <c:choose>
																      	<c:when test="${k.u_ban == 0}">
																	        <button type="button" onclick="banUser(${k.u_idx})" class="btn btn-danger">정지</button>
																		</c:when>
																		<c:otherwise>
																	        <button type="button" onclick="unbanUser(${k.u_idx})" class="btn btn-primary">정지풀기</button>
																		</c:otherwise>
																      </c:choose>
																        <button type="button" onclick="deleteUser(${k.u_idx})" class="btn btn-danger">삭제</button>
																        <button type="button" onclick="updateUser(this.form)" class="btn btn-primary">수정</button>
														  	            <input type="reset" class="btn btn-secondary" data-bs-dismiss="modal" value="취소"> 
																      </div>
														      	 </form>
															    </div>
															</div>
														</div>
														
														
														
													</c:if>
													
													
													
													<c:if test="${k.u_status==1||k.u_status==2}">
														<tr>
															<c:choose>
																<c:when test="${k.u_status==2}">
																	<c:choose>
																		<c:when test="${not empty k.u_id}">
																			<c:set var="inputString" value="${k.u_id}" /> <!-- Replace with your input string -->
																		    <c:set var="firstLetter" value="${inputString.substring(0, 1)}" />
																		    <c:set var="lastLetter" value="${inputString.substring(fn:length(inputString) - 1)}" />
																		    <c:set var="middleAsterisks" value="" />
																		    <c:forEach var="i" begin="1" end="${fn:length(inputString) - 2}">
																	        <c:set var="middleAsterisks" value="${middleAsterisks}*"/>
																		    </c:forEach>
																			<td>${firstLetter}${middleAsterisks}${lastLetter} <b style="color:gold;">: 카카오계졍</b></td>
																		</c:when>
																		<c:otherwise>
																			<td>-</td>
																		</c:otherwise>
																	</c:choose>
																</c:when>
																<c:otherwise>
																	<c:choose>
																		<c:when test="${not empty k.u_id}">
																			<c:set var="inputString" value="${k.u_id}" /> <!-- Replace with your input string -->
																		    <c:set var="firstLetter" value="${inputString.substring(0, 1)}" />
																		    <c:set var="lastLetter" value="${inputString.substring(fn:length(inputString) - 1)}" />
																		    <c:set var="middleAsterisks" value="" />
																		    <c:forEach var="i" begin="1" end="${fn:length(inputString) - 2}">
																	        <c:set var="middleAsterisks" value="${middleAsterisks}*"/>
																		    </c:forEach>
																			<td>${firstLetter}${middleAsterisks}${lastLetter}</td>
																		</c:when>
																		<c:otherwise>
																			<td>-</td>
																		</c:otherwise>
																	</c:choose>
																</c:otherwise>
															</c:choose>
															
															
															<td>${k.u_nickname}</td>
															
															<!-- 이름 숨기기 -->
															<c:choose>
																<c:when test="${not empty k.u_name }">
																	<c:choose>
																		<c:when test="${k.u_name.length() >= 3}">  
																			<c:set var="inputString" value="${k.u_name}" /> <!-- Replace with your input string -->
																		    <c:set var="firstLetter" value="${inputString.substring(0, 1)}" />
																		    <c:set var="lastLetter" value="${inputString.substring(fn:length(inputString) - 1)}" />
																		    <c:set var="middleAsterisks" value="" />
																		    <c:forEach var="i" begin="1" end="${fn:length(inputString) - 2}">
																	        <c:set var="middleAsterisks" value="${middleAsterisks}*"/>
																		    </c:forEach>
																			<td>${firstLetter}${middleAsterisks}${lastLetter}</td>
																	    </c:when>
																	    <c:otherwise>
																	    	<td>${k.u_name}</td>
																	    </c:otherwise>
																	</c:choose>
																</c:when>
																
																<c:otherwise>
																	<td>-</td>
																</c:otherwise>
															</c:choose>
															
															<!-- 이메일 숨기기 -->
															<c:choose>
																<c:when test="${not empty k.u_email }">
																	<c:set var="email" value="${k.u_email}" /> <!-- Replace with your email address -->
																    <c:set var="atIndex" value="${email.indexOf('@')}" />
																    <c:set var="firstVisiblePart" value="${email.substring(0,2)}" />
																    <c:set var="hiddenPart" value="${email.substring(2, atIndex)}" />
																    <c:set var="visiblePart" value="${email.substring(atIndex)}" />
																    <c:set var="maskedPart" value="" />
																    <c:forEach var="i" begin="0" end="${fn:length(hiddenPart) - 1}">
																        <c:set var="maskedPart" value="${maskedPart}*"/>
																    </c:forEach>
																    <td>${k.u_email.substring(0, 2)}${maskedPart}${visiblePart}</td>
																</c:when>
																
																<c:otherwise>
																	<td>-</td>
																</c:otherwise>
															</c:choose>
															 	
															
															<!-- 생년월일 숨기기 -->		
															<c:choose>
																<c:when test="${not empty k.u_birthday }">
																	<td>${k.u_birthday.substring(0,4)}*****</td>
																</c:when>
																<c:otherwise>
																	<td>-</td>
																</c:otherwise>
															</c:choose>				
															
															<!-- 핸드폰 번호 숨기기 -->
															<c:choose>
																<c:when test="${not empty k.u_phone }">
																	<td>010-****-${k.u_phone.substring((fn:length(k.u_phone) - 4),(fn:length(k.u_phone)))}</td>
																</c:when>
																<c:otherwise>
																	<td>-</td>
																</c:otherwise>
															</c:choose>				
															
																	
																	
															<!-- 벤 유무 -->
															<c:choose>
																<c:when test="${k.u_ban==0}">
																	<td>X</td>
																</c:when>
																<c:otherwise>
																	<td style="color:red; font-weight:bolder">O</td>
																</c:otherwise>
															</c:choose>					
															
															<!-- 약관 동의 -->
															<c:choose>
																<c:when test="${k.u_terms==1}">
																	<td>동의</td>
																</c:when>
																<c:otherwise>
																	<td style="color:red; font-weight:bolder">비동의</td>
																</c:otherwise>
															</c:choose>		


															<!-- 유저 상세보기 -->
															<td> 
																<a href="#"  class="btn btn-success" style="padding:0;" data-bs-toggle="modal" data-bs-target="#modal${k.u_idx}">
																  유저 정보 보기
																</a>
															</td>
														</tr>
														
														<div class="modal fade" id="modal${k.u_idx}"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														
															<div class="modal-dialog modal-xl" id="oneUserModal" >
																 <div class="modal-content">
															      <div class="modal-header titlemodal">
															        <h5 class="modal-title" id="exampleModalLabel"><b>${k.u_nickname}</b>님의 정보</h5>
															        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															      </div>
													      	 	<form>
															      		<div class="modal-body">	
														      			 <!-- 유저 상세보기 정보 컨테이너 -->
															      	 		<div class="container-fluid">
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			아이디
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_id" placeholder="${k.u_id}">
																	      	 		</div>
																	      	 	</div>
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			닉네임
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_nickname" placeholder="${k.u_nickname }">
																	      	 		</div>
																	      	 	</div>
																				<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			이메일
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_email" placeholder="${k.u_email }">
																	      	 		</div>
																	      	 	</div>
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			이름
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_name" placeholder="${k.u_name }">
																	      	 		</div>
																	      	 	</div>
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			생년월일
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_birthday" placeholder="${k.u_birthday.substring(0,10)}">
																	      	 		</div>
																	      	 	</div>
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			전화번호
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<input type="text" name="u_phone" placeholder="${k.u_phone }">
																	      	 		</div>
																	      	 	</div>
																	      	 	<input type="hidden" name="u_idx" value="${k.u_idx}">
															      			</div>
																	      
															      		</div>
															      		
															      		<script type="text/javascript">
															      			// 상세 유저 CRUD
															      			const banUser = (idx) => {
															      				const response = confirm("정말로 밴하겠습니까?");
															      				if(response) location.href = "/banUserAdmin?idx="+idx;
															      				else alert("취소하셨습니다");
															      			}
															      			
															      			const unbanUser = (idx) => {
															      				const response = confirm("정말로 밴을 풀겠습니까?");
															      				if(response) location.href = "/unbanUserAdmin?idx="+idx;
															      				else alert("취소하셨습니다");
															      			}
															      			
															      			
															      			const deleteUser = (idx) => {
															      				const response = confirm("정말로 삭제 하시겠습니까?");
															      				if(response) location.href = "/deleteUserAdmin?idx="+idx;
															      				else alert("취소하셨습니다");
															      			}
															      			
															      			function updateUser(f) {
															      				const response = confirm("정말로 수정 하시겠습니까?");
															      				if(response) {
															      					f.action = "/updateUserAdmin";
															      					f.submit();
															      				}
															      				else alert("취소하셨습니다");
															      			}							
															      			
															      		</script>
															      			
																      <div class="modal-footer">
																      <c:choose>
																      	<c:when test="${k.u_ban == 0}">
																	        <button type="button" onclick="banUser(${k.u_idx})" class="btn btn-danger">정지</button>
																		</c:when>
																		<c:otherwise>
																	        <button type="button" onclick="unbanUser(${k.u_idx})" class="btn btn-primary">정지풀기</button>
																		</c:otherwise>
																      </c:choose>
																        <button type="button" onclick="deleteUser(${k.u_idx})" class="btn btn-danger">삭제</button>
																        <button type="button" onclick="updateUser(this.form)" class="btn btn-primary">수정</button>
														  	            <input type="reset" class="btn btn-secondary" data-bs-dismiss="modal" value="취소"> 
																      </div>
														      	 </form>
															    </div>
															</div>
														</div>
														
														
														
													</c:if>
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
			       				<h1 class="col-title-h1">/유저 계정 추가.do</h1>
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
         
         

        <!-- THIRD CONTAINER () -->
		<div id="test3" style="display:none;">
		
	         <div class="topcontainer  ps-5  mt-0 p-1">
			       		<div class="row row-search">
			       			<div class="col ">
			       			</div>
			       			<div class="col col-title-text" >
			       				<h1 class="col-title-h1">/관리자 리스트.do</h1>
			       			</div>
			       			<div class="col">
			       			</div>
			       		</div>
			       		<div class="row row-search">
			       		</div>
			       		<div class="row row-search">
			       		</div>
			</div>
	        
	       <!-- THIRD CONTAINER ( ADMIN LIST )-->
		        <div class="bottomcontainer ms-2 me-3 mt-1"   style="height:auto; min-height: 70vh;">
		                <table class="display" id="myTable2" >	
		                    <thead class="table-success" >
			                   	<c:choose>
			                   		<c:when test="${empty list}">
										<tr>
											<th></th>
										</tr>
			                   		</c:when>
			                   		<c:otherwise>
				                        <tr>
				                            <th> 아이디 </th>
				                            <th> 닉네임 </th>
				                            <th> 비밀번호</th>
				                            <th> 더보기 </th>
				                        </tr>
			                   		</c:otherwise>
			                   	</c:choose>
		                     </thead>
		                     <tbody class="table-group-divider">
								<c:choose>
											<c:when test="${empty list}">
												<tr>
													<td><h2>원하는 정보가 존재하지 않습니다.</h2></td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="k" items="${list}" varStatus="vs">
													<c:if test="${k.u_status == 9}">
														<tr>
															<td>${k.u_id}</td>
															<td>${k.u_nickname}</td>
															<td>****</td>
														<td> 
																<a href="#"  class="btn btn-success" style="padding:0;" data-bs-toggle="modal" data-bs-target="#modalA${k.u_idx}">
																 	관리자 정보 보기
																</a>
															</td>
														</tr>
														
														<div class="modal fade" id="modalA${k.u_idx}"  tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														
															<div class="modal-dialog modal-xl" >
																 <div class="modal-content">
															      <div class="modal-header titlemodal">
															        <h5 class="modal-title" id="exampleModalLabel"><b>${k.u_nickname}</b>님의 정보</h5>
															        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															      </div>
													      	 	<form>
															    
															    
															      		<div class="modal-body">	
														      			 <!-- 유저 상세보기 정보 컨테이너 -->
															      	 		<div class="container-fluid">
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			아이디
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<b>${k.u_id}</b>
																	      	 		</div>
																	      	 	</div>
																	      	 	<div class="row"> 
																	      	 		<div class="col labelmodal">
																	      	 			닉네임
																	      	 		</div>
																	      	 		<div class="col">
																	      	 			<b>${k.u_nickname }</b>
																	      	 		</div>
																	      	 	</div>
															      			</div>
																	      
															      		</div>
																      <div class="modal-footer">
																        <button type="button" class="btn btn-danger">삭제</button>
														  	            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
																      </div>
														      	 </form>
															    </div>
															</div>
														</div>
														
														
														
														
														
													</c:if>
												</c:forEach>
											</c:otherwise>
										</c:choose>
		                        </tbody>
		                </table> 
		        </div>
			</div>
		   
		   
		   
		   
		<!-- FOURTH CONTAINER () -->
		<div id="test4" style="display:none;"> 
			<div class="topcontainer  ps-5  mt-0 p-1">
			       		<div class="row row-search">
			       			<div class="col ">
			       			</div>
			       			<div class="col col-title-text" >
			       				<h1 class="col-title-h1">/관리자 계정 추가.do</h1>
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
		                 <form action="/signupGoAdminAdmin.do" method="post">
		                    
		                    <div class="row" >
		                       	<div class="col"  style="display:flex; justify-content: center;">
		                       		<h1>관리자 생성</h1>
		                       	</div> 
		                    </div>
		                    
		                    <div class="row justify-content-md-center " >
		                       <div class="col col-lg-2" style="display:flex; justify-content: flex-end;">
		                            <label for="u_id">아이디</label>
		                        </div>
		                        <div class="col col-lg-2">
		                            <input type="text" name="u_id" id="u_id" placeholder="관리자 아이디를 적어주세요"required >
		                        </div>
		                    </div>
		                    
                           	<div class="row justify-content-md-center">
		                        <div class="col col-lg-2"style="display:flex; justify-content: flex-end;">
		                            <label for="confirm_pw">닉네임 :</label> 
		                        </div>
		                        <div class="col col-lg-2">
		                            <input type="text" name="u_nickname" id="u_nickname"placeholder="관리자 닉네임을 적어주세요" required>
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
		                            <div class="col col-lg-1"></div>
		                            <div class="col col-lg-1"></div>
		                            <div class="col col-lg-1"><input type="submit" class="btn btn-primary" value="관리자 생성"  style="float:right;"></div>
		                            <div class="col col-lg-1"><input type="reset" class="btn btn-danger" value="취소" style="float:left;"> </div>
		                      
		                    </div>
		                </form>

	   		</div>
	 
		</div>

   </div>
 

   

</main>

</body>
</html>