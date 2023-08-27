<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>캠핑장 리스트(카드형태로 css 적용)</title>

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
	
	<div class="searchBox">
		<input type="text" id="camping_search" placeholder="캠핑장 이름을 입력하세요"/>
	   	<button type="button" onclick="doSearch()">검색</button>
	</div>
	
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
	<div class="btn-group">
		<button id="more-btn">더보기</button>
	</div>
		
</body>

	<script type="text/javascript">

		var searchMode = false; //검색모드인지 확인하는 용도. 기본값은 false, 검색 모드일 때 true
		var searchKeyword = "";
		var pageNo = 1;
		
		/* more-btn(더보기)이 클릭되면 실행됨 */
		function loadMore() {
			
			// url: 검색모드인지 여부에 따라 다르게 설정하는 삼항연산자
			var url = searchMode ? "/campSearch.do" : "/campList.do";
			var dataObj = { pageNo: pageNo };
			
			// searchMode가 true일 경우에만 dataObj 객체에 keyword 속성을 추가
			if(searchMode == true) {
				dataObj.keyword = searchKeyword;
		}
		
		$.ajax({
			url : url,
			method : "get",
			data : dataObj,
			dataType : "json", 
			success : function(data) {
				
				// 검색결과가 없으면 dataList에 message 하나만 온다.
		        if(data.length == 1 && data[0].message) {
		            alert(data[0].message);
		            return;  // 메시지만 있으므로 추가 작업을 하지 않고 반환
		        }
				
		        var list = "";
				
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
					pageNo++;
	            },
	            error: function() {
	            	alert("에러");
	            }
	        });
	    }
		$('#more-btn').trigger("click");
		
			
			function doSearch() {
				searchMode = true; // 검색 모드 활성화
				searchKeyword = $("#camping_search").val(); // var 키워드 제거
			 	
				 // 검색 버튼을 누른 후, 서치 박스의 내용을 초기화
			    $("#camping_search").val("");
				
				$("#camp_list").empty(); // 초기화
					pageNo = 1; // 페이지 번호 초기화
				
					loadMore(); // loadMore 함수 호출
				
				}
			
				$(document).ready(function() {
		       	 	$("#more-btn").on("click", loadMore);
		        	$('#more-btn').trigger("click");
		   		});

	</script>
</html>