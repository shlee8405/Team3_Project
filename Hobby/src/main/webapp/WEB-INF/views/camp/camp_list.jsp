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

		<div class="searchBox">
			<!-- <input type="text" id="camping_search" placeholder="캠핑장 이름을 입력하세요"/>
		   	<button type="button" onclick="doSearch()">검색</button> -->		
	
		<section>
    		<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        		<div class="carousel-inner">
            		<div class="carousel-item active">
               			 <img src="resources/images/camp_search_box1.jpg" class="d-block w-100" alt="...">
           			</div>
            		<div class="carousel-item">
                		<img src="resources/images/camp_search_box2.jpg" class="d-block w-100" alt="...">
            		</div>
            		<div class="carousel-item">
                		<img src="resources/images/camp_search_box3.jpg" class="d-block w-100" alt="...">
            		</div>
            		<!--https://upload.wikimedia.org/wikipedia/commons/8/8d/Yarra_Night_Panorama%2C_Melbourne_-_Feb_2005.jpg-->
        		</div>
        		<a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
            		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
            		<span class="sr-only">Previous</span>
        		</a>
       			 <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
            		<span class="carousel-control-next-icon" aria-hidden="true"></span>
            		<span class="sr-only">Next</span>
        		</a>
    		</div>
		</section>
		<section class="search-sec">
   			<div class="schbox-wrap">
       	    	<div>
                	<input type="text" class="search-slt" placeholder="캠핑장 이름을 입력하세요.">
                </div>
				<div>
                    <button type="button" class="btn btn-info wrn-btn" onclick="doSearch()">Search</button>
				</div>
			 </div>
		</section>
		</div>
		
		<div class="best_wrap">
			<div class="small-title">
				<span>BEST 캠핑장</span>
			</div>
			<div id="camp_best3_list">
				<!-- 베스트3 캠핑장 리스트  -->
			</div>
		</div>
		
		<div class="list_wrap">
			<div class="small-title">
				<span>전체 캠핑장 살펴보기</span>
			</div>
<!-- 			<div class="sch-title">
					<h3>검색 결과</h3>
			</div> -->
			
				<div id="camp_list">
					<!-- 이 안에 캠핑장 리스트 보여주기 -->
				</div>
			</div>	
		</div>		
</body>

	<script type="text/javascript">

		var searchMode = false; // 검색모드인지 확인하는 용도. 기본값은 false, 검색 모드일 때 true
		var searchKeyword = "";
		var pageNo = 1;
		var loading = false; 	// 디폴트 false
		
		/* 스크롤이 80% 이상 움직였을 때 loadMore() 함수 실행*/
		function loadMore() {
			
			// loading이 true라면 데이터 로드 중일 때 loadMore() 함수가 또 실행되지 않도록 return해버림. ()
			if(loading) return; 
			loading = true;		// 데이터 로드 시작
			
			
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
					// 제공 이미지 없을 시
					var imageUrl = dataList.firstImageUrl == "" ? "resources/images/default_camp_img.jpg" : dataList.firstImageUrl;
					
					list += "<div class='product-grid'>"
								+"<div class='product-image'>"
									+"<a href='#'>"
									+"<img class='pic-1' src=" + imageUrl + ">" 
									+"<img class='pic-2' src=" + imageUrl + ">" 
									+"</a>" 
									+"<span class='product-new-label'>" + dataList.doNm + "</span>" 
								+"</div>" 
								+"<div class='product-content'>" 
									+"<div class='price'>" 
										+"<a class='title' href='/campDetail.do?keyword=" + dataList.facltNm + "'>" + dataList.facltNm + "</a>" 
										+"<span class='addr1'>" + dataList.addr1 + "</span>" 
									+"</div>" 
										+"<ul class='rating'>"
						                    +"<li class='fa fa-star'>" 
						                    +"</li>"
						                    +"<li class='fa fa-star'>" 
						                    +"</li>"
						                    +"<li class='fa fa-star'>" 
						                    +"</li>"
						                    +"<li class='fa fa-star'>" 
						                    +"</li>"
						                    +"<li class='fa fa-star disable'>"
						                    +"</li>"
				                		+"</ul>"
									+"<a class='add-to-cart' href='#'>" + "View Details" + "</a>" 
								+"</div>"
							+"</div>"                  
	                }); //each
	                
	                $("#camp_list").append(list); //append
					pageNo++;
	                
	                loading = false; // 데이터 로드 완료
	                
	            },
	            error: function() {
	            	alert("에러");
	            	loading = false;
	            }
	        });
	    }
		loadMore();
		
			
			function doSearch() {
				searchMode = true; // 검색 모드 활성화
				searchKeyword = $(".search-slt").val(); // var 키워드 제거
			 	
				 // 검색 버튼을 누른 후, 서치 박스의 내용을 초기화
			    $(".search-slt").val("");
				
				$("#camp_list").empty(); // 초기화
					pageNo = 1; // 페이지 번호 초기화
					loadMore(); // loadMore 함수 호출

				}
			
				$(document).ready(function() {
		       	 	$("#more-btn").on("click", loadMore);
		        	$('#more-btn').trigger("click");
		   		});
				
				// 무한 스크롤
				$(window).scroll(function() {
					// 사용자가 스크롤 바를 80%이상 움직였을 때 loadMore()실행해서 무한스크롤 함.
					if($(window).scrollTop() + $(window).height() > $(document).height() * 0.8) {
						loadMore();
					}
				});
	</script>
</html>