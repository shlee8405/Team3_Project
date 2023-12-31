<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/고객센터.do</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<style type="text/css">

	@font-face{
        font-family: OpenSans-Bold;
        src: url(/resources/fonts/IBMPlexSansKR-Light.ttf);
    }

   h1 {
        text-align: center;
        font-size: 60px;
        font-family: OpenSans-Bold;
    }
    
    .container-fluid {
        background-color: #d4ead7;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin-bottom: 10px;
        height: auto;
        width: 50%;
        max-height: 80vh;
        overflow-y: auto;
        font-family: OpenSans-Bold;
    }
    
    .scroll-content::-webkit-scrollbar {
       width: 0.5em;
       font-family: OpenSans-Bold;
   }
   
   .scroll-content::-webkit-scrollbar-thumb {
       background-color: #888;
       font-family: OpenSans-Bold;
   }
   
   .scroll-content::-webkit-scrollbar-track {
       background: transparent;
       font-family: OpenSans-Bold;
   }
    
    .accordion-container {
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: OpenSans-Bold;
   }
   
   .accordion {
        margin:  auto;
        font-family: OpenSans-Bold;
   }
   
   /* New styles for the navigation */
   .navbar {
        height: auto;
        min-height: 100vh;
        width: 250px;
        font-family: OpenSans-Bold;
   }
   
   .navbar-toggler {
        margin: auto;
        font-family: OpenSans-Bold;
   }
   
   .offcanvas {
        width: 320px;
        background-color: #637F42;
        font-family: OpenSans-Bold;
   }
   
   .navbar-nav.flex-column {
        align-items: center;
        font-family: OpenSans-Bold;
   }
   
   .navbar-nav.flex-column .nav-item {
        width: 100%;
        text-align: center;
        font-family: OpenSans-Bold;
   }

   .offcanvas-body {
       display: flex;
       flex-direction: column;
       align-items: center;
       font-family: OpenSans-Bold;
   }
   .dropdown {
       margin-top: 10px;
       font-family: OpenSans-Bold;
   }
   
</style>

<script type="text/javascript">

$(document).ready(function(){
    // Function to execute search
    function executeSearch() {
        var searchTerm = $("#search-input").val().toLowerCase();

        // Initially hide all accordion items
        $(".accordion-item").hide();

        // Iterate over accordion headers
        $(".accordion-header").each(function(){
            if ($(this).text().toLowerCase().indexOf(searchTerm) !== -1) {
                // If the header contains the search term, show the header and its corresponding body
                $(this).parent().show();
            }
        });
    }

    // Search on button click
    $("#search-button").on('click', function(e){
        e.preventDefault();  // Prevent default form submission
        executeSearch();
    });

    // Search on pressing Enter key in search input field
    $("#search-input").on('keypress', function(e){
        if (e.which == 13) {  // 13 is the code for Enter key
            e.preventDefault();  // Prevent default form submission
            executeSearch();
        }
    });
});


</script>
</head>
<body>
<div>
	<jsp:include page="../header.jsp"/>
</div>
        
        <br>
        <br>
        <br>
        <br>
        <br>	
        <br>
        
        <div class="container-fluid align-self-center" style="max-height: 70vh; overflow-y: auto; width: 50%">
		<ul class="nav nav-tabs nav-justified border-0" style="font-size: 30px;">
		  <li class="nav-item border border-4 rounded border-success">
		    <a class="nav-link active" aria-current="page">FAQ</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/cusSerAsk.do" style="color: black;">QNA</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/cusSerReport.do" style="color: black;">REPORT</a>
		  </li>
		</ul>		    
			<!-- 검색창 추가 -->
		    
		    <form class="d-flex justify-content-end mb-3" role="search" id="search-form" onsubmit="return false;" style="padding-top: 15px; ">
			    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="search-input">
			    <button class="btn btn-success" type="button" id="search-button">Search</button>
			</form>
		    
		    <div class="accordion" id="accordionExample">
			    <c:forEach var="k" items="${list}" varStatus="status">
			        <c:if test="${k.f_status != 0}">
			            <div class="accordion-item">
			                <h2 class="accordion-header">
			                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.index + 1}" aria-expanded="true" aria-controls="collapse${status.index + 1}">
			                        ${k.f_content}
			                    </button>
			                </h2>
			                <div id="collapse${status.index + 1}" class="accordion-collapse collapse ${status.index == 0 ? 'show' : ''}" data-bs-parent="#accordionExample">
			                    <div class="accordion-body">
			                        <strong>${k.f_response}</strong> 
			                    </div>
			                </div>
			            </div>
			        </c:if>
			    </c:forEach>
			</div>
		</div>

</body>
</html>