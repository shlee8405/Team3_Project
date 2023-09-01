<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 상세보기</title>
<!-- <link> 태그(=스타일시트)는 <head> 내부에 위치한다. -->
   <!-- 부트스트랩 CDN 추가 -->
   <link rel="stylesheet" href="/resources/css/camp/camp_detail.css?after">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
   <link href="/assets/css/star.css" rel="stylesheet" />
 
<style type="text/css">
	.nav-tabs .nav-link {
		border: 1px solid #ccc;
		border-radius: 5px;
		text-align: center;
		transition: background-color 0.3s;  /* 부드러운 효과 */
		color: #637F42;
		font-size: 20px; /* 원하는 크기로 조정 */
	}
	
	/* 활성화된 탭 */
	.nav-tabs .nav-link.active {   
	background-color: #637F42;
	color: white;
	font-weight: bolder;
	}
</style>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="../header.jsp"  />
	<div style="position:relative; top:200px; z-index:1;">
	
<div class="container2">
	<div class="carousel-inner" id="titleBox">
   	 <div class="carousel-item active">
       	 <img src="resources/images/camp_titleBox_img.jpg" class="d-block w-100" alt="...">
       	 <div class="carousel-caption d-none d-md-block">
            	<p id="facltNm">${cvo.facltNm}</p>
           		<p id="lineIntro" style="font-size: 20px;">${cvo.lineIntro == "" ? "자연의 아름다움을 가까이에서 느끼며, 힐링의 시간을 선사하는 캠핑장" : cvo.lineIntro}</p>
     	   </div>
    	</div>
	</div>
		
	<div class="container3">
		<%-- <div class="row">
			<!-- 캠핑장 제목과 한줄 소개-->
			<div class="col-md-12" style="margin-bottom: 10px;">
				<h1 style="font-weight: bolder;">${cvo.facltNm}</h1>
				<br>
				<p><font color="gray">${cvo.lineIntro}</font></p>
			</div>
		</div> --%>

		<hr style="border-top: 1px solid #dee2e6; margin: 20px 0;">
			
		<div class="container">
			<div class="row">

				<!-- 캠핑장 이미지 -->
				<div class="col-md-6">
					<img src='${cvo.firstImageUrl == "" ? "resources/images/default_camp_img.jpg" : cvo.firstImageUrl}' 
						 width="500px" hight="500px" alt="캠핑장 이미지" class="img-fluid">
				</div>

				<!-- 캠핑장 기본 정보 -->
				<div class="col-md-6">
					<!-- 테이블 정보 -->
						<table class="table horizontal-only-lines">
							<tr>
								<th>주소</th>
								<td>${cvo.addr1 == "" ? "준비 중 입니다." : cvo.addr1}</td>
							</tr>
							<tr>
								<th>문의처</th>
								<td>${cvo.tel == "" ? "준비 중 입니다." : cvo.tel}</td>
							</tr>
							<tr>
								<th>운영일</th>
								<td>${cvo.operDeCl == "" ? "준비 중 입니다." : cvo.operDeCl}</td>
							</tr>
							<tr>
								<th>캠핑장환경</th>
								<td>${cvo.lctCl == "" ? "준비 중 입니다." : cvo.lctCl}</td>
							</tr>
							<tr>
								<th>캠핑장 유형</th>
								<td>${cvo.induty == "" ? "준비 중 입니다." : cvo.induty}</td>
							</tr>
							<tr>
								<th>주변이용가능시설</th>
								<td>${cvo.posblFcltyCl == "" ? "준비 중 입니다." : cvo.posblFcltyCl}</td>
							</tr>
						</table>
		
				<!-- 좋아요, 찜버튼 -->
				<div class="d-flex justify-content-end mt-3">
					<button class="btn btn-danger rounded-circle mr-2" onclick="addLike('user01', '${cvo.facltNm}')" style="width: 50px; height: 50px;">
			        	<i class="fas fa-heart"></i>
			        </button>
			    		 <span id="like-count" style="margin-right:20px">${cvo.likesCount}</span> 
			    		 
					<button class="btn btn-primary rounded-circle" onclick="addToWishlist('user01', '${cvo.facltNm}')" style="width: 50px; height: 50px;">
			        	<i class="fas fa-thumbs-up"></i>
			        </button>
			    		<span id="wish-count">${cvo.wishCount}</span> 
				</div>
			</div>
 		</div>
	</div>
	
	<hr style="border-top: 1px solid #dee2e6; margin: 10px;">

	<!-- 탭 버튼 -->
	<div class="container mt-3">
    	<ul class="nav nav-tabs">
        	<li class="nav-item">
            	<a class="nav-link active" data-toggle="tab" href="#campIntro">캠핑장소개</a>
       		</li>
        	<li class="nav-item">
            	<a class="nav-link" data-toggle="tab" href="#locationInfo">위치정보</a>
        	</li>
        	<li class="nav-item">
            	<a class="nav-link" data-toggle="tab" href="#reviews">후기</a>
        	</li>
    	</ul>
    	
    <!-- 탭 컨텐츠 -->
    <div class="tab-content">
        <!-- 캠핑장 소개 -->
        <div class="tab-pane container active" id="campIntro">
	        <div id="title">
	        	<img id="camp_icon" src="resources/images/camp_icon.png" alt="캠핑 아이콘">
	        	<h2 id="review_title" style="font-weight: bolder;">소개글</h2>
	    	</div>
            	<p id="campIntroText">
            	<c:choose>
        			<c:when test="${fn:length(cvo.featureNm) > fn:length(cvo.intro)}">
            			<p>${cvo.featureNm}</p>
       				</c:when>
        			<c:when test="${fn:length(cvo.intro) >= fn:length(cvo.featureNm)}">
            			<p>${cvo.intro}</p>
        			</c:when>
        			<c:otherwise>
            			<p>정보를 준비 중 입니다.</p>
        			</c:otherwise>
    			</c:choose>
    			</p>
       		</div>
        
        <!-- 위치정보 -->
        <div class="tab-pane container fade" id="locationInfo">
        <div id="title">
        	<img id="camp_icon" src="resources/images/camp_icon.png" alt="캠핑 아이콘">
        	<h2 id="review_title" style="font-weight: bolder;">찾아오시는 길</h2>
    	</div>
            <!-- 카카오맵 지도 -->
            <div id="map" style="width: 100%; max-width: 800px; height: 400px; margin: 0 auto;"></div>
        </div>
        
        <!-- 후기 -->
        <div class="tab-pane container fade" id="reviews">
          <jsp:include page="camp_review.jsp" />
    	</div>
	</div>

<!-- <script> 태그(스크립트)는 대부분 </body> 앞에 위치 -->
<!-- 부트스트랩 JS 및 jQuery CDN 추가 -->
<!-- 부트스트랩은 제이쿼리에 의존하므로 제이쿼리 스크립트를 부트스트랩 스크립트보다 먼저 로드 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a447b9339cfa86beab10e8ff569b495"></script>
<script type="text/javascript">
	var mapX = ${cvo.mapX} //API로부터 받은 캠핑장의 X좌표
	var mapY = ${cvo.mapY} //API로부터 받은 캠핑장의 Y좌표
			
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(mapY, mapX), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
	var markerPosition  = new kakao.maps.LatLng(mapY, mapX);  // 마커가 표시될 위치 
	var marker = new kakao.maps.Marker({  // 마커를 생성한다
		position: markerPosition
	});

	marker.setMap(map); // 마커가 지도 위에 표시되도록 설정한다

	// #locationInfo 탭이 선택되었을 때 지도를 다시 그린다.
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	    if ($(e.target).attr('href') == '#locationInfo') {
	        setTimeout(function() {
	            map.relayout();
	            map.setCenter(new kakao.maps.LatLng(mapY, mapX));  // 지도의 중심을 다시 설정
	        }, 100);  // 도를 다시 그리는 코드를 100ms의 딜레이를 준 후 실행
	    }
	});
	</script>
	
	<script type="text/javascript">
	/* 찜하기 버튼 */
	function addToWishlist(u_id, campName) {
    	$.ajax({
    	    url: "/addWishlist.do",
     		type: "POST",
     		data: { u_id: u_id, facltNm: campName },
      		success: function(response) {
     	       alert(response.message);
     	       
     	      $('#wish-count').text(response.wishCount); /* 화면에 실시간으로 연동 */
       	 	}
    	});
	};
	
	/* 좋아요 버튼 */
	function addLike(u_id, campName) {
	    $.ajax({
	        url: "/addLike.do",
	        type: "POST",
	        data: { u_id: u_id, facltNm: campName },
	        success: function(response) {
	            alert(response.message);
	           
	            $('#like-count').text(response.likesCount);/* 화면에 실시간으로 연동 */
	        }
	    });
	};
	</script>
	</div>
</div>
	</body>
</html>