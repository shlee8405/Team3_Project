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
   h1 {
        margin-top: 5px; /* Add space above the FAQ header */
        text-align: center;
    }
    
    .container {
        background-color: #d4ead7;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add shadow to the bottom */
        margin-bottom: 10px; /* Add space at the bottom of the container */
    }
    
    .scroll-content::-webkit-scrollbar {
       width: 0.5em;
   }
   
   .scroll-content::-webkit-scrollbar-thumb {
       background-color: #888;
   }
   
   .scroll-content::-webkit-scrollbar-track {
       background: transparent;
   }
    
    .accordion-container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
   }
   
   .accordion {
        width: 70%;
        margin: 10px auto;
   }
</style>

<script type="text/javascript">
	  
</script>
</head>
<body>

<jsp:include page="../header.jsp"  />
<div class="accordion-container">
    <div class="container shadow-lg p-3 mb-5 bg-body-tertiary rounded">
        <h1>FAQ</h1>
        <!-- Content here -->
        <div class="scroll-content">
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
    </div>
</div>

</body>
</html>
