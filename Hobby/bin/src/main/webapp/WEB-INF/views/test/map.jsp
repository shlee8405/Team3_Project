<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Map Test</title>
</head>
<body>
	<%-- 지도api 연습 --%>
		<div id="map" style="width: 500px; height: 400px;"></div>
	<%-- 지도를 그리는 Javascript API를 불러오기 --%>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a447b9339cfa86beab10e8ff569b495"></script>
		<script type="text/javascript">
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.552361, 126.937717), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
			};

			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var markerPosition  = new kakao.maps.LatLng(37.552361, 126.937717);  // 마커가 표시될 위치 
			var marker = new kakao.maps.Marker({  // 마커를 생성한다
			    position: markerPosition
			});

			marker.setMap(map); // 마커가 지도 위에 표시되도록 설정한다

			// 아래 코드는 지도 위의 마커를 제거하는 코드이다
			// marker.setMap(null);
	</script>
</body>
</html>