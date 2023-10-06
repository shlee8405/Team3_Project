<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 대시보드</title>
 <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico">
<script src="https://kit.fontawesome.com/55da9ebea0.js" crossorigin="anonymous"></script>
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
	background-color: rgba(200, 200, 200, 0.1); 
	width: 100%; 
	box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
    border-radius: 10px; 
	padding:2.5rem;  
	display: inline-block;  

}

.bottomcontainer {
	background-color: rgba(200, 200, 200, 0.1); 
	width: 100%; 
	box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
    border-radius: 10px; 
	padding:2.5rem;  
	display: inline-block;  
}

.boxtitle{
	font-family:MBCM;
	font-size:1.4rem;
	font-style:italics;
	margin:auto;
	padding:auto;
}

.myBox {
	background-color: rgba(147, 188, 136, 0.24); 
	box-shadow: 0px 5px 2px rgba(0,0,0,0.25);
	border-radius:10px;
	padding:1rem;
}
.myBox2 {
	background-color: rgba(180, 188, 136, 0.24); 
	box-shadow: 0px 5px 2px rgba(0,0,0,0.25);
	border-radius:10px;
	padding:1rem;
}
.myBox3 {
	background-color: rgba(200, 180, 146, 0.24); 
	box-shadow: 0px 5px 2px rgba(0,0,0,0.25);
	border-radius:10px;
	padding:1rem;
}

.myBox4 {
	background: rgb(147,188,136);
	background: linear-gradient(90deg, rgba(147,188,136,0.24) 0%, rgba(180,188,136,0.24) 35%, rgba(200,180,146,0.24) 100%);
	box-shadow: 0px 5px 2px rgba(0,0,0,0.25);
	border-radius:10px;
	padding:1rem;
}

.myBox4title{
	font-family:MBCM;
	font-size:3em;
	
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

canvas#myChart {
	width:200px;
}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.0/Chart.bundle.js" integrity="sha512-DIPwqdbQmibJAGuY6pu+8YnhD14ejjf1Zar0/+YK8IcBm1AESA4x229uUgTNAv9AY8FIMmhhl2voEUbQSSwATA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="/resources/css/datatable.css?after">
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
	        	<!-- first inner container -->
	        	<div class="container p-5">
	        		<div class="row">
	        				<h1 class="d-flex justify-content-center" style="font-family:MBCM; font-size:4em;">
	        					/대시보드.do
	        				</h1>
	        		</div>
	        	</div>
	        	
	        	 
	        	<!-- second inner container -->
		        <div class=" ms-2 me-3 mt-1">
		       		<div class="row p-5 w-100">
						 <div class="col myBox me-4">
						 	<div class="boxtitle">페이지 트래픽</div>
						 	<canvas id="viewcountchart"></canvas>
						 </div>
		       			 <div class="col myBox2 ms-4 me-4">
		       			 	<div class="boxtitle">로그인 트래픽</div>
		       			 	<canvas id="logincountchart"></canvas>
		       			 </div>
		       			 <div class="col myBox3 ms-4">
		       			 
		       			 	<div class="row p-4 d-flex flex-row pb-0 pt-2">
								<div class="col m-0 p-0">
									<i class="fa-regular fa-circle-user fa-lg"></i>
								</div>
								<!-- check if exists today user sign up -->
								<c:choose>
									<c:when test="${userCount!=0}">
										<div class="col-10">
											오늘 총 <b>${userCount}</b>유저가 회원 가입 했습니다!! 😋
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-10">
											오늘은 회원 가입을 한 유저가 없습니다 😪
										</div>
									</c:otherwise>
								</c:choose>
								<div class="col">
								</div>
		       			 	</div><hr>
		       			 	
		       			 	<div class="row p-4 d-flex flex-row pb-0 pt-2">
		       			 		<div class="col m-0 p-0">
									<i class="fa-solid fa-people-group"></i>
								</div>
								<!-- check if exists today user sign up -->
								<c:choose>
									<c:when test="${groupCount!=0}">
										<div class="col-10">
											오늘 총 <b>${groupCount}</b>모임이 생성 되었습니다! 😆		
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-10">
											오늘은 생성된 모임은 없습니다 😪
										</div>
									</c:otherwise>
								</c:choose>
								<div class="col">
								</div>
		       			 	</div><hr>
		       			 	
		       			 	<div class="row p-4 d-flex flex-row pb-0 pt-2">
		       			 		<div class="col m-0 p-0">
									<i class="fa-solid fa-eye"></i>
								</div>
								<!-- check if exists today user sign up -->
								<c:choose>
									<c:when test="${viewCount!=0}">
										<div class="col-10">
											오늘의 누적 조희수는 <b>${viewCount}</b>이고! 😋
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-10">
											오늘은 조회수가 없고... 😲								
										</div>
									</c:otherwise>
								</c:choose>
								<div class="col">
								</div>
		       			 	</div><hr>
		       			 	
		       			 	<div class="row p-4 d-flex flex-row pb-0 pt-2">
		       			 		<div class="col m-0 p-0">
									<i class="fa-solid fa-arrow-right-to-bracket"></i>
								</div>
								<!-- check if exists today user sign up -->
								<c:choose>
									<c:when test="${loginCount!=0}">
										<div class="col-10">
											총 <b>${loginCount}</b>유저가 로그인 했습니다!! 😁
										</div>
									</c:when>
									<c:otherwise>
										<div class="col-10">
											로그인이 없습니다... 🙄
										</div>
									</c:otherwise>
								</c:choose>
								<div class="col">
								</div>
		       			 	</div>
		       			 	
		       			 </div>
		       		</div>
		        </div>
		
	        	<!-- third inner container -->
		        <div class=" p-3" style="height:auto;">
					<div class="myBox4 p-5">
						<div class="row ">
							<div class="d-flex justify-content-center myBox4title" >
								확인 안 한 1대1문의 총 : ${fn:length(qnalist)}개
							</div>
						</div>
		        		<div class="row p-5 flex-row flex-nowrap overflow-auto">
		        			<c:choose>
		        				<c:when test="${empty qnalist}">
		        					<div class="col">
		        						<h3 class="d-flex justify-content-center">
		        							확인 안 한 1대1 문의가 없습니다!
		        						</h3>
		        					</div>
		        				</c:when>
		        				
		        				<c:otherwise>
		        					<c:forEach var="k" items="${qnalist}">
		        						<div class="col-3">
		        							<div class="card text-dark border-success mb-3">
		        								<div class="card-header">
														<c:forEach var="j" items="${userlist}">
															<c:if test="${k.u_idx==j.u_idx}">
																<a href="/adminQNA.do">[바로가기]</a> 작성자 : ${j.u_nickname}
															</c:if>
														</c:forEach>
		        								</div>
		        								<div class="card-body text-success">
		        									<h5 class="card-title">
		        										제목 : ${k.q_title}
		        									</h5>
		        									<p class="card-text">
		        										내용 : ${k.q_content}
		        									</p>
		        								</div>
		        							</div>
		        						</div>
		        					</c:forEach>
		        				</c:otherwise>
		        			</c:choose>
		        		
		        		</div>
		        		<div class="row mt-5">
							<div class="d-flex justify-content-center myBox4title">
								확인 안 한 신고글 총 : ${fn:length(reportlist)}개
							</div>
						</div>
		        		<div class="row  p-5 flex-row flex-nowrap overflow-auto">
					        <c:choose>
		        				<c:when test="${empty reportlist}">
		        					<div class="col">
		        						<h3 class="d-flex justify-content-center">
		        							확인 안 한 신고가 문의가 없습니다!
		        						</h3>
		        					</div>
		        				</c:when>
		        				
		        				<c:otherwise>
		        					<c:forEach var="k" items="${reportlist}">
		        					
		        						<div class="col-3">
		        							<div class="card text-dark border-success mb-3">
		        								<div class="card-header">
														<c:forEach var="j" items="${userlist}">
															<c:if test="${k.u_idx1==j.u_idx}">
																<a href="/adminReport.do">[바로가기]</a> 작성자 : ${j.u_nickname}
															</c:if>
														</c:forEach>
		        								</div>
		        								<div class="card-body text-success">
		        									<h5 class="card-title">
		        										제목 : ${k.r_title}
		        									</h5>
		        									<p class="card-text">
		        										내용 : ${k.r_content}
		        									</p>
		        								</div>
		        							</div>
		        						</div>
		        					</c:forEach>
		        				</c:otherwise>
		        			</c:choose>
		        		</div>
		        	</div>
		        </div>
			</div>
	   </div>



<script>
  const viewcountctx = document.getElementById('viewcountchart');
  const logincountctx = document.getElementById('logincountchart');
  $(document).ready(function() {
	  $.ajax({
		  url: '/getviewcountlist.do',
		  type:'GET',
		  dataType:'json',
		  success:function(data){
			  console.log(data)
			  	new Chart(viewcountctx, {
				    type: 'line',
				    data: {
				      labels: data[0].labels,
				      datasets: [{
				        label: '총 조회수',
				        data: data[0].datasets,
				        borderWidth: 1,
				        fill: false,
				        borderColor: 'rgb(75, 192, 192)',
				        tension: 0.1
				      }]
				    },
				    options: {
				      scales: {
				        y: {
				          beginAtZero: true
				        }
				      }
				    }
				  });
			 	new Chart(logincountctx, {
				    type: 'line',
				    data: {
				      labels: data[1].labels,
				      datasets: [{
				        label: '총 로그인 수',
				        data: data[1].datasets,
				        borderWidth: 1,
				        fill: false,
				        borderColor: 'rgb(225, 192, 192)',
				        tension: 0.1
				      }]
				    },
				    options: {
				      scales: {
				        y: {
				          beginAtZero: true
				        }
				      }
				    }
				  });
		  },
		  error: function(xhr, status, error) {
			  console.log(error);
		  }
	  })
  })

</script>

   

</main>

</body>
</html>