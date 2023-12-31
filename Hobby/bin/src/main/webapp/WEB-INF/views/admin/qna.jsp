<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1대1 문의 관리</title>

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
	        <div id="test"> 
	        
	        <!-- SEARCH CONTAINER -->
		        <div class="topcontainer  ps-5  mt-0 p-1">
		       		<div class="row row-search">
		       			<div class="col ">
		       			</div>
		       			<div class="col col-title-text" >
		       				<h1 class="col-title-h1">/1대1 문의 관리.do</h1>
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
							  <option value="1" selected>문의 제목</option>
							  <option value="2" >문의자</option>
							</select> 
						</div>
						<div class="col-2" style="align-items:center;"> 
							<input class="row-content" type="text" id="searchTextInput" style="width:100%">
						</div>
					<script type="text/javascript">
						// 검색 버튼 자바스크립트 function
						//TODO 검색
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
									location.href = "/adminQnaDetailSearch?text="+text+"&query="+subject;
								} else if (subject == '2') {
									location.href = "/adminQnaDetailSearch?text="+text+"&query="+subject;
								} 
							}
						}

						// 전체보기 function
						function refresh() {
							location.href="/adminQNA.do";
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
					                            <th> 답변 상태 </th> 
					                            <th> 문의 제목 </th>
					                            <th> 문의자 </th>
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
														<!-- QNA 답변 상태 -->
														<c:choose>
															<c:when test="${k.q_response!=null}">
																<td style="color:black; font-weight:bolder;"> 답변완료 </td>
															</c:when>
															<c:otherwise>
																<td style="color:red; font-weight:bolder;"> 답변안됨 </td>
															</c:otherwise>
														</c:choose>
														<!-- QNA 제목 -->
														<td>${k.q_title}</td>
														<!-- 문의자 -->
														<c:forEach var="j" items="${userlist}">
															<c:if test="${k.u_idx==j.u_idx}">
																<td>${j.u_nickname}</td>
															</c:if>
														</c:forEach>
													
														<!-- 더보기 -->
														<td> 
															<a href="#"  class="btn btn-success" style="padding:0;" 
															data-bs-toggle="modal" data-bs-target="#faqModal${k.q_idx}">
															  더 보기
															</a>
														</td>
													</tr>
													
													<!-- modal create start -->
													
													<!-- modal script -->
													<script>
														function sendQna(f) {
															const response = confirm("정말로 수정 하시겠습니까?");
										      				if(response) {
										      					f.action = "/updateQnaAdmin";
										      					f.submit();
										      				}
										      				else {
										      					alert("취소하셨습니다");
										      					refresh();
										      				}
														}
														function deleteQna(f) {
															const response = confirm("정말로 삭제 하시겠습니까?");
										      				if(response) {
										      					f.action = "/deleteQnaAdmin";
										      					f.submit();
										      				}
										      				else {
										      					alert("취소하셨습니다");
										      					refresh();
										      				}
														}	
														
													
													</script>
													
													<!-- one QnaModal  -->
													<div class="modal fade" id="faqModal${k.q_idx}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-xl" id="oneGroupModal">
															<div class="modal-content">
																<div class="modal-header titlemodal">
																	<h5 class="modal-title" id="exampleModalLabel" style="margin-left:50%; transform: translate(-50%, 0%); font-size:3rem;"><b>1대1 문의 정보</b></h5>
																	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<form >
																	<div class="modal-body">
																		<div class="container-fluid">
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%; margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-2">
																					<b>문의자:</b>  
																				</div>
																				<div class="col-10">
																					<div>
																						<c:forEach var="j" items="${userlist}">
																							<c:if test="${k.u_idx==j.u_idx}">
																								${j.u_nickname}
																							</c:if>
																						</c:forEach>
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%; margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-2">
																					<b>제목:</b>  
																				</div>
																				<div class="col-10">
																					<div>
																					${k.q_title}
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%; margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-2">
																					<b>내용 :</b>  
																				</div>
																				<div class="col-10">
																					<div>
																					${k.q_content}
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%;">
																				<div class="col-2">
																					<b>작성 날짜 :</b>  
																				</div>
																				<div class="col-10">
																					<div>
																					${k.q_date.substring(2,10)}
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%; margin-top:1rem;">
																				<div class="col">
																					
																					<c:choose>
																						<c:when test="${k.q_response!=null}">
																							<textarea name="q_response" style="width:100%; height: 10rem;"> ${k.q_response} </textarea>
																						</c:when>
																						<c:otherwise>
																							<textarea name="q_response" style="width:100%; height: 10rem;" placeholder="1대1 답변을 작성해주세요..."></textarea>
																						</c:otherwise>
																					</c:choose>
																				
																					
																				</div>
																			</div>
																			<div class="row">
																				<div class="col">
																				</div>
																				<div class="col">
																				</div>
																				<div class="col">
																					<input type="hidden" name="q_idx" value="${k.q_idx}">
																					<button class="btn btn-primary" onclick="sendQna(this.form)" >저장</button>
																					<button class="btn btn-danger" onclick="deleteQna(this.form)" >삭제</button>
																					<button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close" >취소</button>
																				</div>
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