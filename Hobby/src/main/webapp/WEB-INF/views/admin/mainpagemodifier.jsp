<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 이미지 설정</title>
 <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">

main {
    display:flex;
    flex-direction: row;
}


.sidebar-link {
	color:#ffffff!important;

}


.h1title{
	font-family:MBCM;
}
.h1title-sub{
	font-family:MBCM;
	font-size:1.5rem;
}

.h2title-sub{
	font-family:MBCM;
	font-size:1.2rem;
}

.maincontainer{
	background-color: rgba(200, 200, 200, 0.1); 
	box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
	border-radius:1rem;
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

.sidebar-link {
color:#ffffff!important;
}

.topcontainer{
	margin:0;
	padding:2.5rem;
	width:100%;
	height:auto;
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
	
	function go_adminMainPageModifier() {
		location.href = "/adminMainPageModifier.do";
	}
	
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

	   <div class="super" >
	        <!-- SEARCH CONTAINER -->
	        <script>
		        function sendImage(f) {
		        	f.action = "/uploadMPImage.do";
		        	f.submit();
		        }
	        </script>
	        <div id="test"> 
	        	<!-- FIRST CONTAINER (GROUP LIST SEARCH) -->
		        <div class="topcontainer  ps-5  mt-0 p-1">
		        		<div class="row ms-5 mt-5" > 
				   			<div class="col d-flex justify-content-center" >
				   				<h1 class="col-title-h1" style="border-bottom: 1px solid  #0f4200;" >/메인 페이지 이미지 업로드.do</h1>
				   			</div>
				   		</div>
						<form method="post" enctype="multipart/form-data">
							<div class="row  ms-5 mt-5" >
					   			<div class="col w-25"></div>
					   			<div class="col d-flex justify-content-end border w-25">
					   				<label> 이미지 제목 </label>
					   			</div>
					   			<div class="col d-flex justify-content-start border w-25">
					   				<input type="text" name="mp_title" placeholder="이미지 설명" /> 
					   			</div>
					   			<div class="col w-25"></div>
					   		</div>
					   		<div class="row  ms-5 mt-1" >
					   			<div class="col w-25"></div>
					   			<div class="col d-flex justify-content-end border w-25">
					   				<label> 이미지 설명 </label>
					   			</div>
					   			<div class="col d-flex justify-content-start border w-25">
					   				<textarea name="mp_desc" placeholder="이미지 설명"> </textarea> 
					   			</div>
					   			<div class="col w-25"></div>
					   		</div>
					   		<div class="row  ms-5 mt-1" >
					   			<div class="col w-25"></div>
					   			<div class="col d-flex justify-content-end border w-25">
					   				<label> 이미지 파일</label>
					   			</div>
					   			<div class="col d-flex justify-content-start border w-25">
					   				<input type="file" name="file" value="이미지 이름"/> 
					   			</div>
					   			<div class="col w-25"></div>
					   		</div>
					   		<div class="row  ms-5 mt-1 mb-5" >
					   			<div class="col w-25"></div>
					   			<div class="col d-flex justify-content-end border w-25">
					   			</div>
					   			<div class="col d-flex justify-content-start border w-25">
					   				<input type="button" class="btn btn-primary me-2" onclick="sendImage(this.form)" value="저장"/> 
					   				<input type="reset" class="btn btn-danger" value="취소"/> 
					   			</div>
					   			<div class="col w-25"></div>
					   		</div>
				   		</form>
		        </div>
		
		        <!-- BOTTOM CONTAINER ( LIST )-->
		        <div class="bottomcontainer ms-2 me-3 mt-1"   style="height:auto;">
		        	<!-- 불러오기 section -->
						<c:choose>
							<c:when test="${empty list}">
								<div class="row ms-5 mt-1 mb-1">
									<div class="col d-flex justify-content-center">
										<h1 class="h1title-sub"> /메인 페이지 이미지 리스트.do</h1>
									</div>
								</div>		
								<div class="row ms-5 mt-0 mb-5">
									<div class="col d-flex justify-content-center">
										<h2 class="h2title-sub"> 표시할 정보가 없습니다 </h2>
									</div>
								</div>			
							</c:when>
							<c:otherwise>
								<div class="row ms-5 mt-1 mb-1">
									<div class="col d-flex justify-content-center">
										<h1 class="h1title-sub"> /메인 페이지 이미지 리스트.do</h1>
									</div>
								</div>	
								<c:forEach var="k" items="${list}" >
									<div class="row ms-5 mt-1 mb-1">
										<div class="card mb-3">
										  <img src="resources/background/${k.mp_imgname}" class="card-img-top" alt="..." style="width:100%; height:30vh; object-fit:cover;">
										  <div class="card-body">
										    <h5 class="card-title">${k.mp_title}</h5>
										    <p class="card-text">${k.mp_desc}</p>
										    <div class="row justify-content-end">
										    	<div class="col" >
										    		<p class="card-text"><small class="text-muted">업로드 날짜: ${k.mp_date}</small></p>
										    	</div>
										    	<div class="col d-flex justify-content-end">
										    		<button class="btn btn-danger" onclick="deleteImage(${k.mp_idx},'${k.mp_imgname}')">삭제</button>
										    	</div>
										    </div>
										  </div>
										</div>

									</div>	
								</c:forEach>
							
							</c:otherwise>
						</c:choose>
		        	<script>
		        		function deleteImage(idx, imgname) {
		        			const response = confirm("정말로 삭제 하시겠습니까?");
		        			if(response){
			        			location.href="/deleteMPImage.do?idx="+idx+"&imgname="+imgname;
		        			}
		        			else {
		        				alert("취소하셨습니다.");
		        				refresh();
		        			}
		        		}
		        	</script>
		        </div>
			</div>
			
		</div>
<%-- 
   <div class="container maincontainer mt-5"  style="width: 85%; margin-left:25vw; margin-right:0; height:auto;" >
   		<!-- 업로드 section -->
   		<div class="row ms-5 mt-5" > 
   			<div class="col d-flex justify-content-center">
   				<h1 class="h1title">/메인 페이지 이미지 업로드.do</h1>
   			</div>
   		</div>
		<form>
			<div class="row  ms-5 mt-5" >
	   			<div class="col w-25"></div>
	   			<div class="col d-flex justify-content-end border w-25">
	   				<label> 이미지 제목 </label>
	   			</div>
	   			<div class="col d-flex justify-content-start border w-25">
	   				<input type="text" name="mp_title" placeholder="이미지 설명"> </input> 
	   			</div>
	   			<div class="col w-25"></div>
	   		</div>
	   		<div class="row  ms-5 mt-1" >
	   			<div class="col w-25"></div>
	   			<div class="col d-flex justify-content-end border w-25">
	   				<label> 이미지 설명 </label>
	   			</div>
	   			<div class="col d-flex justify-content-start border w-25">
	   				<textarea name="mp_desc" placeholder="이미지 설명"> </textarea> 
	   			</div>
	   			<div class="col w-25"></div>
	   		</div>
	   		<div class="row  ms-5 mt-1" >
	   			<div class="col w-25"></div>
	   			<div class="col d-flex justify-content-end border w-25">
	   				<label> 이미지 파일</label>
	   			</div>
	   			<div class="col d-flex justify-content-start border w-25">
	   				<input type="file" name="file" value="이미지 이름"/> 
	   			</div>
	   			<div class="col w-25"></div>
	   		</div>
	   		<div class="row  ms-5 mt-1" >
	   			<div class="col w-25"></div>
	   			<div class="col d-flex justify-content-end border w-25">
	   				<label> 기존 이미지 </label>
	   			</div>
	   			<div class="col d-flex justify-content-start border w-25">
	   				<img class='img' src='resources/images/background.jpg'alt='이미지가 없습니다' width='100%' height='100%' style='width: 50%; object-fit: cover; position: relative; border-radius:0.5rem;'>
	   			</div>
	   			<div class="col w-25"></div>
	   		</div>
	   		<div class="row  ms-5 mt-1 mb-5" >
	   			<div class="col w-25"></div>
	   			<div class="col d-flex justify-content-end border w-25">
	   			</div>
	   			<div class="col d-flex justify-content-start border w-25">
	   				<input type="button" class="btn btn-primary me-2" onclick="sendImage(this.form)" value="저장"/> 
	   				<input type="reset" class="btn btn-danger" value="취소"/> 
	   			</div>
	   			<div class="col w-25"></div>
	   		</div>
   		</form>
   		<!-- 불러오기 section -->
		<c:choose>
			<c:when test="${empty list}">
				<div class="row ms-5 mt-5 mb-1">
					<div class="col d-flex justify-content-center">
						<h1 class="h1title-sub"> /메인 페이지 이미지 리스트.do</h1>
					</div>
				</div>		
				<div class="row ms-5 mt-0 mb-5">
					<div class="col d-flex justify-content-center">
						<h2 class="h2title-sub"> 표시할 정보가 없습니다 </h2>
					</div>
				</div>			
			</c:when>
			<c:otherwise>
			
			
			</c:otherwise>
		</c:choose>

   </div> --%>


</main>

</body>
</html>