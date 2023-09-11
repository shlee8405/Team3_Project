<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/고객센터.do</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
	.accordion{
	   	width: 50%;
	   	margin: 0 auto;
   }
   
   h1 {
        margin-top: 50px; /* 제목 위쪽 여백 */
        text-align: center; /* 제목을 가운데 정렬 */
    }
    
</style>

<script type="text/javascript">

</script>
</head>
<body>

<jsp:include page="../header.jsp"  />
<div style="position:relative; top:200px; z-index:1;">


<div class="row justify-content-md-center" style=" margin: 0 auto; width: 60%">
	<div class="col">
	<div class="card" style="width: 25rem;">
	  <img src="/resources/images/FAQ.PNG" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title text-center">FAQ</h5>
    	<p class="card-text text-center">FAQ 목록</p>
	    <div class="mt-auto text-end"> <!-- Use "text-end" utility class to align content to the right -->
	      <a href="/cusSerFAQ.do" class="btn btn-primary">목록 보기</a>
	    </div>
	  </div>
	</div>
	</div>
	
	<div class="col">
	<div class="card" style="width: 25rem;">
	  <img src="/resources/images/FAQ.PNG" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title text-center">QnA</h5>
    	<p class="card-text text-center">QnA 목록</p>
	    <div class="mt-auto text-end"> <!-- Use "text-end" utility class to align content to the right -->
	      <a href="/cusSerAsk.do" class="btn btn-primary">목록 보기</a>
	    </div>
	  </div>
	</div>
	</div>
	
	<div class="col">
	<div class="card" style="width: 25rem;">
	  <img src="/resources/images/FAQ.PNG" class="card-img-top" alt="...">
	  <div class="card-body d-flex flex-column">
	    <h5 class="card-title text-center">신고</h5>
    	<p class="card-text text-center">신고 목록</p>
	    <div class="mt-auto text-end"> <!-- Use "text-end" utility class to align content to the right -->
	      <a href="/cusSerReport.do" class="btn btn-primary">목록 보기</a>
	    </div>
	  </div>
	</div>


	</div>

</div>

</div>
</body>
</html>
