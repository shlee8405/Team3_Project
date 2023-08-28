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
        margin-top: 5px;
        text-align: center;
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
   }
   
   .accordion {
        margin: 10px auto;
   }
   
   /* New styles for the navigation */
   .navbar {
        height: auto;
        min-height: 100vh;
        width: 250px;
   }
   
   .navbar-toggler {
        margin: auto;
   }
   
   .offcanvas {
        width: 320px;
        background-color: #637F42;
   }
   
   .navbar-nav.flex-column {
        align-items: center;
   }
   
   .navbar-nav.flex-column .nav-item {
        width: 100%;
        text-align: center;
   }

   .offcanvas-body {
       display: flex;
       flex-direction: column;
       align-items: center;
   }
   .dropdown {
       margin-top: 10px;
   }
   
</style>

<script type="text/javascript">

$(window).scroll(function() {
    var scroll = $(window).scrollTop();
    if (scroll > 50) { // 50px 이상 스크롤하면 배경색을 변경
        $(".navbar").css("background-color", "#0F4200"); // Change this color if needed
    } else {
        $(".navbar").css("background-color", "#637F42"); // Original color
    }
});

$(document).ready(function() {
    // 검색 버튼 클릭 이벤트
    $("#search-button").click(function() {
        var searchTerm = $("#search-input").val().toLowerCase();
        $(".accordion").each(function() {
            var content = $(this).find(".accordion-button").text().toLowerCase();
            if (content.includes(searchTerm)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });
});

</script>
</head>
<body>

<jsp:include page="../header.jsp"/>

<div class="d-flex">
    <nav class="navbar navbar-dark" style="background-color: #637F42; width: 80px;">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon" style="color: black;"></span>
            </button>
        </nav>
        <!-- Offcanvas Navbar Content -->
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="color: white;">고객센터</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body" >
            	<div> <!-- 오른쪽 정렬 -->
                	<a class="btn btn-light" href="/cusSerFAQ.do" role="button">FAQ</a>
            	</div>
                <!-- Offcanvas Navigation Links -->
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
                      QnA
                    </button>
                    <ul class="dropdown-menu">
					  <li><a class="dropdown-item" href="/cusSerAsk.do">문의 목록 보기</a></li>
					  <li><a class="dropdown-item" href="/go_inquiry.do">문의 하기</a></li>
                    </ul>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Report
                    </button>
                    <ul class="dropdown-menu">
					  <li><a class="dropdown-item" href="/cusSerReport.do">신고 목록 보기</a></li>
					  <li><a class="dropdown-item" href="/report.do">신고하기</a></li>
                    </ul>
                  </div>
            </div>
        </div>
        
        <div class="container-fluid align-self-center">
		    <!-- 검색창 추가 -->
		    <form class="d-flex justify-content-end mb-3" role="search" id="search-form">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="search-input">
		        <button class="btn btn-outline-success" type="button" id="search-button">Search</button>
		    </form>
		    
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
</div>


</body>
</html>