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



		

        <!-- FIRST CONTAINER ( USER LIST )-->
        <div id="test" class="container mt-4" style="background-color: rgba(200, 200, 200, 0.3); height:75vh; width: 90%;  box-shadow: 0px 5px 2px rgba(0, 0, 0, 0.25);
        border-radius: 10px;
        " >
        
        	<div class="row " style="justify-content:center;">
				<h1>FAQ </h1>
			</div>
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
                            <th> FAQ 번호 </th>
                            <th> 질문 </th>
                            <th> 답변 </th>
                            <th> 답변한 관리자 이름  </th>
                        </tr>
                     </thead>
                        <tbody class="table-group-divider">
	                        <!-- 일단 주석 -->
							<%-- <c:choose>
									<c:when test="${empty list}">
										<tr>
											<td colspan="4"><h2>원하는 정보가 존재하지 않습니다.</h2></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="k" items="${list}" varStatus="vs">
											<tr>
												<td>${k.q_idx}</td>
												<td>${k.q_content}</td>
												<td>${k.q_response}</td>
												<td>${k.u_idx}</td>
												<td> 
													<!-- if q_status == 1, show 답변 완료. else, show 답변하기 -->
													<select class="form-control form-control"> 
														<option> 답변하기 </option>
														<option> 답변 완료 </option>
													</select>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose> --%>
                        </tbody>
                </table> 
            </div>
            
            

        </div>



   </div>
 

   

</main>

</body>
</html>