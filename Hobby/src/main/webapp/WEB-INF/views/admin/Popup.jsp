<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
 <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico">

<style type="text/css">

main {
    display:flex;
    flex-direction: row;
    max-width: 100%;
    height: auto;
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
	
</script>
</head>
<body>
<main>
    <!-- SIDEBAR -->
   	<jsp:include page="sidebar.jsp" />

  <!-- MAIN CONTAINER -->
   <div class="container" style="padding-bottom: 20px;">

        <!-- FIRST CONTAINER ( USER LIST )-->
        <div id="test" class="container mt-4" style="background-color: rgba(200, 200, 200, 0.3); box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);border-radius: 10px;">
		    <div class="row justify-content-center">
		        <h1>팝업 관리</h1>
		    </div>
		    <div class="row">
		        <c:forEach var="vo" items="${list}">
		            <div class="col-md-6 mb-3">
		                <div class="card">
		                    <div class="card-header">
		                        ${vo.pop_title}
		                    </div>
		                    <div class="card-body">
		                        <p class="card-text">${vo.pop_content}</p>
		                    </div>
		                    <div class="card-footer d-md-flex justify-content-md-end">
							    <form action="/delete_Popup.do" method="post">
							        <input type="hidden" name="pop_idx" value="${vo.pop_idx}">
							        <button type="submit" class="btn btn-primary" style="padding: 5px;">삭제</button>
							    </form>
							    <form action="/update_Popup.do" method="post">
							        <input type="hidden" name="pop_idx" value="${vo.pop_idx}">
							        <button type="submit" class="btn btn-primary" style="padding: 5px;">수정</button>
							    </form>
							</div>
		                </div>
		            </div>
		        </c:forEach>
		    </div>
		    <div class="row justify-content-end">
		    	<a class="btn btn-primary btn-block" href="/PopupWrite.do" role="button">작성하기</a>
		    </div>
		</div>

   </div>
</main>

</body>
</html>