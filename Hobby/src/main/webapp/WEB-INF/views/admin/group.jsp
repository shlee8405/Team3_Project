<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑 모임 관리</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
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
    	} else if (actionControl == "revive") {
    		alert("삭제된 모임을 복구 하셨습니다.");
    		<% session.removeAttribute("adminActionControl"); %>
    	} else if (actionControl == 'create') {
    		alert("성공적으로 추가하셨습니다.");
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
							  <option value="1" selected>모임 생성자</option>
							  <option value="2" >모임 제목</option>
							  <option value="3" >모임 날짜</option>
							  <option value="3" >모임 위치</option>
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
							location.href="/adminGroup.do";
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
				                           		<th> 모임 상태 </th>
					                            <th> 모임 생성자 </th>
					                            <th> 모임 제목</th> 
					                            <th> 모임 정보 </th>
					                            <th> 모임 날짜 </th>
					                            <th> 모임 위치 </th> <!-- g_cdo+ g_gugun + g_location  -->
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
															<c:choose>
																<c:when test="${k.g_status==1}">
																	<td> - </td>
																</c:when>
																<c:otherwise>
																	<c:choose>
																		<c:when test="${k.g_status==0}">
																			<td><b style="color:gray;"><i>삭제된 모임 입니다</i></b></td>
																		</c:when>
																		<c:otherwise>
																			<td> 기간이 지난 모임입니다.  </td>
																		</c:otherwise>
																	</c:choose> 
																	
																</c:otherwise>
															</c:choose>
														<!-- group creator -->
														<c:forEach var="j" items="${userlist}">
															<c:if test="${k.u_idx==j.u_idx}">
																<td>${j.u_nickname}</td>
															</c:if>
														</c:forEach>
														<!-- g_title -->
														<td>${k.g_title}</td>
														<!-- g_intro -->
														<td>${k.g_intro}</td>
														<!-- g_date -->
														<td>${k.g_date.substring(0,13)}:00</td>
														<!-- location (g_cdo + g_gugun + g_location) -->
														<td>${k.g_cdo} ${k.g_gugun} ${k.g_location}</td>
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
													
													<!-- 참가자 모달  -->
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
																				<div class="row" style="width:60%; margin-left:20%; margin-right:20%; margin-bottom: 3rem; border-bottom: 1px solid black;">
																					<div class="col-3">
																						<b>참가자:</b>  
																					</div>
																					<div class="col-9">
																						<c:forEach var="gu" items="${groupuserlist}">
																							<c:if test="${k.g_idx==gu.g_idx}">
																								<ul>
																									<li>
																										<c:forEach var="j" items="${userlist}">
																											<c:if test="${gu.u_idx==j.u_idx}">
																												${j.u_nickname}
																											</c:if>
																										</c:forEach>
																									</li>
																								</ul>
																							</c:if>
																						</c:forEach>
																					</div>
																				</div> 
																				<div class="row">
																					<div class="col">
																					</div>
																					<div class="col">
																					</div>
																					<div class="col" >
																						<button type="button" class="btn btn-light  ms-5 " data-bs-dismiss="modal" aria-label="Close" >취소</button>
																					</div>
																				</div>
																			</div>																		
																		</div>
																	</div>
																</form>
															</div>															
														</div>
													</div>
													
													<!-- 상세 보기 모달 -->
													<div class="modal fade" id="groupModal${k.g_idx}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
														<div class="modal-dialog modal-xl" id="oneGroupModal">
															<div class="modal-content">
																<div class="modal-header titlemodal">
																	<h5 class="modal-title" id="exampleModalLabel"><b>${k.g_title}</b> 모임 수정</h5>
																	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<form>
																	<div class="modal-body">
																		<div class="container-fluid">
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%; margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-3">
																					<b>생성자:</b>  
																				</div>
																				<div class="col-9">
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
																				<div class="col-3">
																					<b>모임 제목:</b>  
																				</div>
																				<div class="col-9">
																					<div>
																					${k.g_title}
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%; margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-3">
																					<b>모임 정보 :</b>  
																				</div>
																				<div class="col-9">
																					<div>
																					${k.g_intro}
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%;margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-3">
																					<b>모임 날짜 :</b>  
																				</div>
																				<div class="col-9">
																					<div>
																					${k.g_date.substring(0,13)}:00
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%;margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-3">
																					<b>모임 상세 정보 :</b>  
																				</div>
																				<div class="col-9">
																					<div>
																					${k.g_desc}
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%;margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-3">
																					<b>모임 주소 :</b>  
																				</div>
																				<div class="col-9">
																					<div>
																					${k.g_cdo} ${k.g_gugun} ${k.g_location}
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%;margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-3">
																					<b>총 모임 정원 :</b>  
																				</div>
																				<div class="col-9">
																					<div>
																					${k.g_maxPeople} 명
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%;margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-3">
																					<b>총 참가 신청 :</b>  
																				</div>
																				<div class="col-9">
																					<% int count = 0; %>
																					<c:forEach var="gu" items="${groupuserlist}">
																						<c:if test="${k.g_idx==gu.g_idx}">
																							<% count++; %>
																						</c:if>
																					</c:forEach>
																					<div>
																					<%=count%> 명
																					</div>
																				</div>
																			</div> 
																			<div class="row" style="width:60%; margin-left:20%; margin-right:20%;margin-bottom: 1rem; border-bottom: 1px solid black;">
																				<div class="col-3">
																					<b>모임 바로가기 :</b>  
																				</div>
																				<div class="col-9">
																					<a href="/group_onelist.do?g_idx=${k.g_idx}">
																					[바로가기 링크]
																					</a>
																				</div>
																			</div> 
																			
																			<script>
																				function deleteGroup(f) {
																					const response = confirm('정말로 삭제 하시겠습니까?')
																					if(response) {
																						f.action = "/deleteGroupAdmin"
																						f.submit();
																					} else {
																						alert("취소하셨습니다");
																						refresh();
																					}
																				}
																				function reviveGroup(f){
																					const response = confirm('정말로 삭제를 복구 하시겠습니까?');
																					if(response) {
																						f.action = "/reviveGroupAdmin"
																						f.submit();
																					} else {
																						alert("취소하셨습니다");
																						refresh();
																					}
																				}
																			</script>
																			
																			<div class="row">
																				<div class="col">
																				</div>
																				<div class="col">
																				</div>
																				<div class="col">
																					<input type="hidden" name="g_idx" value="${k.g_idx}">
																					<c:choose>
																						<c:when test="${k.g_status==1}">
																							<button class="btn btn-danger ms-3" onclick="deleteGroup(this.form)" >삭제</button>
																						</c:when>
																						<c:otherwise>
																							<button class="btn btn-info ms-3" onclick="reviveGroup(this.form)" >복구</button>
																						</c:otherwise>
																					</c:choose>
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
		
        
        
        	<script>
        	function createGroup(f) {
        		// 유효성 검사 
        		const cdo = document.getElementById("g_cdo").value;
	            const gugun = document.getElementById("g_gugun").value;
	        		if(f.g_title.value.trim().length <=0){
	        			alert("제목을 입력하세요");
	        			f.g_title.focus();
	        			return;
	        		}
	        		if(f.g_maxPeople.value.trim().length <=0){
	        			alert("총인원을 입력하세요");
	        			f.g_maxPeople.focus();
	        			return;
	        		}
	        		if(f.g_intro.value.trim().length <=0){
	        			alert("모임소개를 입력하세요");
	        			f.g_intro.focus();
	        			return;
	        		}
	        		if(f.g_desc.value.trim().length <=0){
	        			alert("내용을 입력하세요");
	        			f.g_desc.focus();
	        			return;
	        		}
	        		if(f.g_date.value.trim().length <=0){
	        			alert("날짜를 입력하세요");
	        			f.g_date.focus();
	        			return;
	        		}
	        		if(f.g_location.value.trim().length <=0){
	        			alert("캠핑 장소를 입력하세요");
	        			f.g_location.focus();
	        			return;
	        		}
	        		if (cdo === "시/도 선택" || gugun === "군/구 선택") {
	        		      alert("지역을 선택하세요");
	        		      return;
	        		    }
	        		
	        		f.action="/groupInsertAdmin.do";
	        		f.submit();
        	}
        		
        		function categoryChange(e) {
        			  const state = document.getElementById("g_gugun");

        			  const gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
        			  const gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
        			  const gyeongsangnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
        			  const gyeongsangbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
        			  const gwangju = ["광산구", "남구", "동구", "북구", "서구"];
        			  const daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
        			  const daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
        			  const busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
        			  const seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
        			  const ulsan = ["남구","동구","북구","중구","울주군"];
        			  const incheon = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
        			  const jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
        			  const jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
        			  const jeju = ["서귀포시","제주시","남제주군","북제주군"];
        			  const chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];

        			  if (e.value == "강원") {
        			    add = gangwon;
        			  } else if (e.value == "경기") {
        			    add = gyeonggi;
        			  } else if (e.value == "경남") {
        			    add = gyeongsangnam;
        			  } else if (e.value == "경북") {
        			    add = gyeongsangbuk;
        			  } else if (e.value == "광주") {
        			    add = gwangju;
        			  } else if (e.value == "대구") {
        			    add = daegu;
        			  } else if (e.value == "대전") {
        			    add = daejeon;
        			  } else if (e.value == "부산") {
        			    add = busan;
        			  } else if (e.value == "서울") {
        			    add = seoul;
        			  } else if (e.value == "울산") {
        			    add = ulsan;
        			  } else if (e.value == "인천") {
        			    add = incheon;
        			  } else if (e.value == "전남") {
        			    add = jeonnam;
        			  } else if (e.value == "전북") {
        			    add = jeonbuk;
        			  } else if (e.value == "제주") {
        			    add = jeju;
        			  } else if (e.value == "충남") {
        			    add = chungnam;
        			  } else if (e.value == "충북") {
        			    add = chungbuk;
        			  }

        			  g_gugun.options.length = 1;
        			  // 군/구 갯수;
        				for (property in add) {
        					let opt = document.createElement("option");
        					opt.value = add[property];
        					opt.innerHTML = add[property];
        					g_gugun.appendChild(opt);
        				}
        			}
        		
        		function limitInputLength(event) {
        	        if (event.target.value.length > 18) {
        	            event.target.value = event.target.value.slice(0, 18);
        	            alert("17자 이하로 작성해주세요");
        	        }
        	    }
        	
        	</script>
	        <div class="bottomcontainer ms-2 me-3 mt-1"   style="height:auto;">
    					<div class="container">
			                <form method="post" enctype="multipart/form-data">
								<table summary="게시판 글쓰기" style="width:70%; margin-left:15%; margin-right:15%;">
									<caption>모임 개설하기</caption>
									<tbody>
										<tr>
											<th>제목</th>
											<td><input type="text" name="g_title" size="45"/></td>
										</tr>
										<tr>
											<th>모임 총인원</th>
											<td><input type="number" name="g_maxPeople" /></td>
										</tr>
											
										<tr>
											<th>썸네일 이미지</th>  <!-- 첨부파일 유효성검사 해주자 -->
											<td><input type="file" name="file"/></td>
										</tr>
										<tr>
											<th>모임 소개</th>  <!-- 첨부파일 유효성검사 해주자 -->
											<td><input type="text" name="g_intro" size="60" oninput="limitInputLength(event)"/></td>
										</tr>
										<tr>
											<th>캠핑 날짜</th>
											<td><input type="datetime-local" name="g_date" size="10" id="g_date" /></td>
										</tr>
										<tr>
											<th>캠핑 장소</th>
											<td>
												<div class="search_boxes">
									            <select name="g_cdo" id="g_cdo" onchange="categoryChange(this)">
									              <option>시/도 선택</option>
									              <option value="강원">강원</option>
									              <option value="경기">경기</option>
									              <option value="경남">경남</option>
									              <option value="경북">경북</option>
									              <option value="광주">광주</option>
									              <option value="대구">대구</option>
									              <option value="대전">대전</option>
									              <option value="부산">부산</option>
									              <option value="서울">서울</option>
									              <option value="울산">울산</option>
									              <option value="인천">인천</option>
									              <option value="전남">전남</option>
									              <option value="전북">전북</option>
									              <option value="제주">제주</option>
									              <option value="충남">충남</option>
									              <option value="충북">충북</option>
									            </select>
									          
									            <select name="g_gugun" id="g_gugun">
									              <option>군/구 선택</option>
									            </select>
									          	</div>
									          	<input type="text" name="g_location" id="g_location" placeholder="캠핑장 이름을 입력하세요"/>
									          </td>
										</tr>
										<tr>
											<th>내용</th>
											<td><textarea name="g_desc" cols="60" rows="10" id="g_desc"></textarea></td>
										</tr>
										<tr>
											<td colspan="2">
												<input type="hidden" value='<%=(String)request.getSession().getServletContext().getAttribute("sessionUidx")%>' name="u_idx"/>
												<input type="button" value="완료" onclick="createGroup(this.form)"/>
												<input type="reset" value="취소" />
											</td>
										</tr>
									</tbody>
								</table>
								<%=(String)session.getAttribute("sessionUidx")%>
							</form>
						</div>
				    	<script src="resources/js/summernote-lite.js"></script>
				    	<script src="resources/js/lang/summernote-ko-KR.js"></script>
				    	<script type="text/javascript">
				    	$(function(){
				    		$('#g_desc').summernote({
				    			lang : 'ko-KR',
				    			height : 300,
				    			focus : true,
				    			callbacks : {
				    				onImageUpload :  function(files, editor){
				    					for (var i = 0; i < files.length; i++) {
											sendImage(files[i], editor);
										}
				    				}
				    			}
							});
				    	});
				    	function sendImage(file, editor) {
							var frm = new FormData();
							frm.append("s_file",file);
							$.ajax({
								url : "/saveImage.do",
								data : frm,
								type : "post",
								contentType : false,
								processData : false,
								dataType : "json",
							}).done(function(data) {
								var path = data.path;
								var fname = data.fname;
								$("#g_desc").summernote("editor.insertImage",path+"/"+fname);
							});
						}
				    	</script>
		        	</div>
		          </div>
   </div>
 

   

</main>

</body>
</html>