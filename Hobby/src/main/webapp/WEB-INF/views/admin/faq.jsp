<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 관리</title>
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

	/* 
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
    */
    
    
    // 데이터테이블로 테이블 생성
    $(document).ready( function () {
	    try{
	    	$('#myTable1').DataTable();
	    }catch{
	    }
    } );
    
    $(document).ready(()=>{
    	var actionControl = "${adminActionControl}";
    	if(actionControl == "hide") {
    		alert("성공적으로 숨기셨습니다.");
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
    	} else if (actionControl == "unhide") {
    		alert("보이기로 바꾸셨습니다.");
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
					<input type="button" class="btn-check" id="btn-check" autocomplete="off" onclick="refresh()" checked>
	            	<label class="btn btn-success" for="btn-check" id="btn-tab-1">등록된 FAQ</label>
	
	            	<!-- <input type="button" class="btn-check" id="btn-check2" autocomplete="off" onclick="hidetest2()"> -->
	            	<!-- <label class="btn btn-success" for="btn-check2" id="btn-tab-2">FAQ 추가</label> -->
	            	<a href="#"  class="btn btn-success" id="btn-tab-1" style="" 
						data-bs-toggle="modal" data-bs-target="#addFaqModal">
				  		FAQ 추가
					</a>
					<!-- FAQ 추가 modal JS -->
					<script>
						function addFaq(f) {
							const response = confirm("정말로 추가 하시겠습니까?");
		      				if(response) {
		      					f.action = "/addFaqAdmin";
		      					f.submit();
		      				}
		      				else {
		      					alert("취소하셨습니다");
		      					refresh();
		      				}
						}												
					</script>
					
					<!-- FAQ 추가 modal -->
				<div class="modal fade" id="addFaqModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl" id="oneGroupModal">
						<div class="modal-content">
							<div class="modal-header titlemodal">
								<h5 class="modal-title" id="exampleModalLabel" style="margin-left:50%; transform: translate(-50%, 0%); font-size:3rem;"><b>/FAQ 추가.do</b></h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<form >
								<div class="modal-body">
									<div class="container-fluid"> 
										<div class="row" style="width:60%; margin-left:20%; margin-right:20%;">
											<div class="col">
												<textarea name="f_content" style="width:100%; height: 3rem;'" placeholder="FAQ 제목을 입력해주세요..."></textarea>
											</div>
										</div> 
										<div class="row" style="width:60%; margin-left:20%; margin-right:20%;">
											<div class="col">
												<textarea name="f_response" style="width:100%; height: 10rem;" placeholder="FAQ 내용을 입력해주세요..."></textarea>
											</div>
										</div>
										<div class="row">
											<div class="col">
											</div>
											<div class="col">
											</div>
											<div class="col">
												<button class="btn btn-primary" onclick="addFaq(this.form)" >추가하기</button>
												<button type="button" class="btn btn-danger" data-bs-dismiss="modal" aria-label="Close" >취소</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>															
					</div>
				</div>
				
	            	
				</div>
			</div>
	        <div id="test"> 
	        
	        <!-- SEARCH CONTAINER -->
		        <div class="topcontainer  ps-5  mt-0 p-1">
		       		<div class="row row-search">
		       			<div class="col ">
		       			</div>
		       			<div class="col col-title-text" >
		       				<h1 class="col-title-h1">/FAQ 관리.do</h1>
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
							  <option value="1" selected>질문</option>
							  <option value="2" >답변</option>
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
									//TODO search
									location.href = "/adminFaqDetailSearch?text="+text+"&query="+subject;
								} else if (subject == '2') {
									location.href = "/adminFaqDetailSearch?text="+text+"&query="+subject;
								} 
							}
						}

						// 전체보기 function
						function refresh() {
							location.href="/adminFAQ.do";
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
					                            <th> 질문 </th> 
					                            <th> 답변 </th>
					                            <th> 보이기 상태 </th>
					                            <th> 더 보기 </th>
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
														<!-- f_content -->
														<td>${k.f_content}</td>
														<!-- f_response -->
														<td>${k.f_response}</td>
														<!-- f_status //보이기 상태 -->
														<c:choose>
															<c:when test="${k.f_status==1}">
																<td style="color:black; font-weight:bolder;"> 보임 </td>
															</c:when>
															<c:otherwise>
																<td style="color:red; font-weight:bolder;"> 숨김 </td>
															</c:otherwise>
														</c:choose>
														<!-- 더보기 -->
														<td> 
															<a href="#"  class="btn btn-success" style="padding:0;" 
															data-bs-toggle="modal" data-bs-target="#faqModal${k.f_idx}">
															  더 보기
															</a>
														</td>
													</tr>
													
													<!-- modal create start -->
													
													<!-- modal script -->
													<script>
													
														function deleteFaq(idx){
															const response = confirm("정말로 삭제하시겠습니까?");
															if(response) {
																location.href="/deleteFaqAdmin?idx="+idx;
															}
														}
														function hideFaq(idx){
															const response = confirm("정말로 숨기겠습니까?");
															if(response) {
																location.href="/hideFaqAdmin?idx="+idx;
															}
														}
														function unhideFaq(idx){
															const response = confirm("정말로 표시하겠습니까?");
															if(response) {
																location.href="/unhideFaqAdmin?idx="+idx;
															}	
														}
														function updateFaq(f) {
															const response = confirm("정말로 수정 하시겠습니까?");
										      				if(response) {
										      					f.action = "/updateFaqAdmin";
										      					f.submit();
										      				}
										      				else {
										      					alert("취소하셨습니다");
										      					refresh();
										      				
										      				}
														}												
														
													
													</script>
													
													<!-- faqModal -->
													<div class="modal fade" id="faqModal${k.f_idx}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-xl" id="oneGroupModal">
															<div class="modal-content">
																<div class="modal-header titlemodal">
																	<h5 class="modal-title" id="exampleModalLabel"><b>FAQ 수정</b></h5>
																	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<form >
																	<div class="modal-body">
																		<div class="container-fluid">
																			<input type="hidden" name="f_idx" value="${k.f_idx}">
																			<div>
																				<textarea name="f_content" style="width:60%; margin-left:20%; margin-right:20%; height: 2em;">${k.f_content}</textarea>
																				<textarea name="f_response" style="width:60%; margin-left:20%; margin-right:20%; height: 10em;">${k.f_response}</textarea>
																			</div>
																			<div class="row">
																				<div class="col"></div>
																				<div class="col"></div>
																				<div class="col"></div>
																				<div class="col" style="display: flex; flex-direction: row-reverse;">
																					<button class="btn btn-success"  onclick="updateFaq(this.form)" style="margin:1%;">수정</button>
																					<c:choose>
																						<c:when test="${k.f_status==1}">
																							<a class="btn btn-warning" onclick="hideFaq(${k.f_idx})" style="margin:1%;">숨김</a>
																						</c:when>
																						<c:otherwise>
																							<a class="btn btn-primary" onclick="unhideFaq(${k.f_idx})" style="margin:1%;">보이기</a>
																						</c:otherwise>
																					</c:choose>
																					<a class="btn btn-danger" onclick="deleteFaq(${k.f_idx})" style="margin:1%;">삭제</a>
																				</div>
																				<div class="col"></div>
																			</div>
																		</div>
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
			       				<h1 class="col-title-h1">/FAQ 추가.do</h1>
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
		                    
		                </form>
		        	</div>
		          </div>
   </div>
 

   

</main>

</body>
</html>