<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
   .accordion{
	   	width: 30%;
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

<h1>FAQ</h1>

<c:forEach var="k" items="${list}" varStatus="status">
    <div class="accordion" id="accordionExample${status.index}">
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.index}" aria-expanded="true" aria-controls="collapse${status.index}">
            ${k.f_content}
          </button>
        </h2>
        <div id="collapse${status.index}" class="accordion-collapse collapse ${status.index == 0 ? 'show' : ''}" data-bs-parent="#accordionExample${status.index}">
          <div class="accordion-body">
            ${k.f_response}
          </div>
        </div>
      </div>
    </div>
</c:forEach>

</div>
</body>
</html>
