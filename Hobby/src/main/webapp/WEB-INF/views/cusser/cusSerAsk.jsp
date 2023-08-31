<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/고객센터.do</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style type="text/css">
    .container-fluid {
        margin: auto;
        width: 60%;
        background-color: #d4ead7;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    }
    
    .table th, .table td {
        vertical-align: middle;
    }
    
    .table th:first-child, .table td:first-child {
        width: 10%;
        font-size: 14px;
        text-align: center; /* 가운데 정렬 추가 */
        border: 1px solid #dee2e6; /* 테두리 추가 */
    }

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

    function go_inquiry() {
        location.href = "/go_inquiry.do"
    }
    function go_AskDetail() {
        location.href = "/go_AskDetail.do?q_idx=" + q_idx;
    }
    
    
    
    $(document).ready(function() {
        $("#search-button").click(function() {
            performSearch();
        });

        $("#search-input").keyup(function(event) {
            if (event.keyCode === 13) {
                performSearch();
            }
        });

        function performSearch() {
            var searchTerm = $("#search-input").val().toLowerCase();
            $(".table tbody tr").each(function() {
                var number = $(this).find("td:nth-child(1)").text().toLowerCase();
                var author = $(this).find("td:nth-child(2)").text().toLowerCase();
                var content = $(this).find("td:nth-child(3)").text().toLowerCase();
                var response = $(this).find("td:nth-child(4)").text().toLowerCase();

                if (number.includes(searchTerm) || author.includes(searchTerm) || content.includes(searchTerm) || response.includes(searchTerm)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }
    });



</script>
</head>
<body>

<jsp:include page="../header.jsp" />

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

        <div class="container-fluid align-self-end">
        
         <!-- 검색창 추가 -->
		    <form class="d-flex justify-content-end mb-3" role="search" id="search-form" onsubmit="return false;">
			    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="search-input">
			    <button class="btn btn-success" type="button" id="search-button">Search</button>
			</form>

            <div class="card-body">
                <!-- Default Table -->
                <table class="table caption-top" style="background-color: white; border-radius: 10px;">
                    <caption class="text-center">1:1 문의</caption>
                    <thead>
                        <tr>
                            <th scope="col" class="text-center">번호</th>
                            <th scope="col" class="text-center">작성자</th>
                            <th scope="col" class="text-center">내용</th>
                            <th scope="col" class="text-center">답변</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
				    <c:forEach var="k" items="${list}" varStatus="loop">
				        <c:choose>
				            <c:when test="${k.q_status == 0}">
				                <tr>
				                    <td colspan="4">삭제된 목록입니다</td>
				                </tr>
				            </c:when>
				            <c:otherwise>
				                <tr>
				                    <td>${loop.count}</td>
				                    <td>${user.u_name}</td>
				                    <td>
				                        <a href="/go_AskDetail.do?q_idx=${k.q_idx}">상세보기</a>
				                    </td>
				                    <td>
				                        <c:if test="${k.q_response == null}">
				                            대기중
				                        </c:if>
				                        <c:if test="${k.q_response != null}">
				                            답변 완료
				                        </c:if>
				                    </td>
				                </tr>
				            </c:otherwise>
				        </c:choose>
				    </c:forEach>
				</tbody>

                </table>
                <!-- End Default Table Example -->
            </div>
            <div class="text-end">
                <!-- 오른쪽 정렬 -->
                <button type="button" class="btn btn-success" onclick="go_inquiry()">문의하기</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
