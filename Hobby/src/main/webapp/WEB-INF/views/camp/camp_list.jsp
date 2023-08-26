<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캠핑장 리스트</title>

<!-- bootstrap cdn -->
<link rel="stylesheet" href="/resources/css/camp/camp_list.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div style="position: relative; top: 200px; z-index: 1;"></div>

	<div class="container2">
<!-- 	<h3 class="h3">캠핑장 전체 리스트</h3>-->		
<!--    <div class="row"> -->

			<div id="camp_list">
				<!-- 이 안에 캠핑장 리스트 보여주기 -->
				<!-- <div class="product-grid">
						<div class="product-image">
						<a href="#">
						<img class="pic-1" src="/resources/images/camping.jpg"> 
						<img class="pic-2" src="/resources/images/camping.jpg">
						</a> 
						<span class="product-new-label">강원도</span> 
						<span class="product-discount-label">BEST 1</span>
						</div>
					<div class="product-content">
						<div class="price">
							<a href="#">장호 비치 캠핑장</a>
							<h3 class="title">강원도 삼척시 근덕면 장호1길 41</h3>
						</div>
						<a class="add-to-cart" href="#">View Details</a>
						</div>
					</div> -->
			</div>
		</div>
	<hr>
</body>

	<script type="text/javascript">
	$(document).ready(function () {
		var pageNo = 1;
		
		$.ajax({
			url : "/campList.do",
			method : "get",
			data : {pageNo: pageNo},
			dataType : "json", 
			success : function(data) {
				console.log(data);
				$.each(data, function (index, dataList) {
					$("#camp_list").append(
							"<div class='product-grid'>"
								+"<div class='product-image'>"
									+"<a href='#'>"
									+"<img class='pic-1' src=" + dataList.firstImageUrl + ">" 
									+"<img class='pic-2' src=" + dataList.firstImageUrl + ">" 
									+"</a>" 
									+"<span class='product-new-label'>" + dataList.doNm + "</span>" 
								+"</div>" 
								+"<div class='product-content'>" 
										+"<div class='price'>" 
											+"<a class='title' href='/campDetail.do?keyword=" + dataList.facltNm + "'>" + dataList.facltNm + "</a>" 
											+"<span class='addr1'>" + dataList.addr1 + "</span>" 
										+"</div>" 
									+"<a class='add-to-cart' href='#'>" + "View Details" + "</a>" 
								+"</div>"
							+"</div>" 
	                    ); //append
	                }); //each
	            },
	            error: function() {
	            	alert("에러");
	            }
	        });
	    });
	</script>
</html>