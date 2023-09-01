<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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

.super {
	margin: 0px;
	margin-right:0px;
	padding-right:0px;
	width: 100%;
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
        $('#myTable2').DataTable();
    } );
    $(document).ready( function () {
	    $('#myTable1').DataTable();
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
	            	<label class="btn btn-success" for="btn-check" id="btn-tab-1">유저 리스트</label>
	
	            	<input type="button" class="btn-check" id="btn-check2" autocomplete="off" onclick="hidetest2()">
	            	<label class="btn btn-success" for="btn-check2" id="btn-tab-2">유저 생성</label>
	
	            	<input type="button" class="btn-check" id="btn-check3" autocomplete="off" onclick="hidetest3()">
	            	<label class="btn btn-success" for="btn-check3" id="btn-tab-3">관리자 리스트</label>
	   
	            	<input type="button" class="btn-check" id="btn-check4" autocomplete="off" onclick="hidetest4()">
	            	<label class="btn btn-success" for="btn-check4" id="btn-tab-4">관지라 생성</label>
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
							<select class="form-select row-content" aria-label="Default select example" style="width:100% ; " >
							  <option selected>닉네임</option>
							  <option value="1">출생년도</option>
							  <option value="2">번호 마지막 4</option>
							</select> 
						</div>
						<div class="col-2" style="align-items:center;"> 
							<input class="row-content" type="text" style="width:100%">
						</div>
						<div class="col" style=" align-items:center;"> 
							<input class="row-content" type="button" style="width:100%" value="검색">
						</div>
						<div class="col-4"> </div>
		       		</div>
		       		
		        </div>
		
		        <!-- FIRST CONTAINER ( USER LIST )-->
		        <div class="bottomcontainer ms-2 me-3 mt-1"   style="height:70vh;">
		                <table class="display" id="myTable1">	
		                    <thead class="table-success" >
		                        <tr>
		                            <th> 아이디 </th>
		                            <th> 닉네임 </th>
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
												
												
													<!-- 아이디 숨기기 -->
													<c:if test="${k.u_status==1}">
														<tr>
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
															
																								    
															<td>${k.u_ban}</td>
															<td>${k.u_terms}</td>
															<td>${k.u_status}</td>
															<td> 
																<button> 유저 상세보기 </button>
															</td>
														</tr>
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
		                            <input type="password" name="confirm_pw" id="confirm_pw"required>
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
	        
	       <!-- FIRST CONTAINER ( USER LIST )-->
		        <div class="bottomcontainer ms-2 me-3 mt-1"   style="height:70vh;">
		                <table class="display" id="myTable2" >	
		                    <thead class="table-success" >
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
													<c:if test="${k.u_status == 9}">
														<tr>
															<td>${k.u_id}</td>
															<td>${k.u_nickname}</td>
															<td>****</td>
															<td>****</td>
															<td>${k.u_email}</td>
															<td>${k.u_birthday.substring(0,10)}</td>
															<td>${k.u_phone}</td>
															<td>${k.u_ban}</td>
															<td>${k.u_terms}</td>
															<td>${k.u_status}</td>
															<td> 
																<button> 유저 상세보기 </button>
															</td>
														</tr>
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